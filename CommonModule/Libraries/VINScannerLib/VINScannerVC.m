//  MobileTechBooks
//
//  Created by Hoang Nguyen on 09/10/2020.
//  Copyright (c) 2020 MobilTechBooks. All rights reserved.
//

#import "VINScannerVC.h"

@interface VINScannerVC () <CMBReaderDeviceDelegate>{
    CMBReaderDevice *readerDevice;
    bool isScanning;
    UIImageView* imgView;
}

@end

@implementation VINScannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appBecameActive)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    UIColor *bgColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
    [self.view setBackgroundColor:bgColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addCroshairs];
    [self createScanner];

}


- (void)createScanner{
    readerDevice = [CMBReaderDevice readerOfDeviceCameraWithCameraMode:kCDMCameraModeNoAimer previewOptions:1|2 previewView:imgView registrationKey:SCANVIN_KEY];
    readerDevice.delegate = self;
    [readerDevice connectWithCompletion:^(NSError *error) {
        if (error)
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Failed to connect" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            [self performSelector:@selector(startScan) withObject:nil afterDelay:0.5];
        }
    }];
}

- (void)startScan{
    __strong VINScannerVC* weakSelf = self;
    //enable C39 flag for all scan mode, jira #2040
    [readerDevice setSymbology:CMBSymbologyC39 enabled:YES completion:^(NSError *error) {
        if (error == nil) {
            [weakSelf->readerDevice startScanning];
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
            [weakSelf presentViewController:alert animated:YES completion:nil];
        }
    }];
}

#pragma mark- Scanner Delegate

- (void)didReceiveReadResultFromReader:(CMBReaderDevice *)reader results:(CMBReadResults *)readResults{
    NSString* code = @"";
    if (readResults != nil && readResults.readResults != nil && readResults.readResults.count > 0) {
        CMBReadResult* res = readResults.readResults.firstObject;
        if (res.readString != nil && res.readString.length > 0){
            if (self->_isVin){
                code = [self correctCode:res.readString];
            }else{
                if (res.readString.length > 17){
                    code = [res.readString substringToIndex:17];
                }else{
                    code = res.readString;
                }
            }
        }
    }
    
    if (self.callback_getcode) {
        [self dismissViewControllerAnimated:YES completion:^{
            if (code.length > 0) {
                self.callback_getcode(code);
            }
        }];
    }
}

- (NSString*)correctCode:(NSString*)code{
    if (_isVin) {
        if ([code.lowercaseString hasPrefix:@"i"]){
            code = [code stringByReplacingOccurrencesOfString:@"I" withString:@""];
            code = [code stringByReplacingOccurrencesOfString:@"i" withString:@""];
        }
        if (code.length > 17) {
            return [code substringToIndex:17];
        }else{
            return code;
        }
    }else{
        return code;
    }
}

- (void)connectionStateDidChangeOfReader:(CMBReaderDevice *)reader{
    if (reader.connectionState == CMBConnectionStateConnected) {
        [readerDevice setSymbology:CMBSymbologyDataMatrix enabled:YES completion:^(NSError *error){
            if (error)
            {
                NSLog(@"FALIED TO ENABLE [Symbology_DataMatrix], %@", error.description);
            }else{
                NSLog(@"ENABLE [Symbology_DataMatrix]");
            }
        }];
        [readerDevice setSymbology:CMBSymbologyQR enabled:YES completion:^(NSError *error){
            if (error)
            {
                NSLog(@"FALIED TO ENABLE [Symbology_QR], %@", error.description);
            }else{
                NSLog(@"ENABLE [Symbology_QR]");
            }
        }];
        [readerDevice setSymbology:CMBSymbologyC128 enabled:YES completion:^(NSError *error){
            if (error)
            {
                NSLog(@"FALIED TO ENABLE [Symbology_C128], %@", error.description);
            }else{
                NSLog(@"ENABLE [Symbology_C128]");
            }
        }];
        [readerDevice setSymbology:CMBSymbologyUpcEan enabled:YES completion:^(NSError *error){
            if (error)
            {
                NSLog(@"FALIED TO ENABLE [Symbology_UpcEan], %@", error.description);
            }else{
                NSLog(@"ENABLE [Symbology_UpcEan]");
            }
        }];
        
        [readerDevice setSymbology:CMBSymbologyC39 enabled:YES completion:^(NSError *error){
            if (error)
            {
                NSLog(@"FALIED TO ENABLE [CMBSymbologyC39], %@", error.description);
            }else{
                NSLog(@"ENABLE [CMBSymbologyC39]");
            }
        }];
        
        readerDevice.imageResultEnabled = NO;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return IS_PAD?UIInterfaceOrientationMaskLandscape:UIInterfaceOrientationMaskPortrait;
}

- (void) testAllSubview:(UIView*) view {
    if(view) {
        if([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
        
        if([view subviews]) {
            for(UIView *v in [view subviews]) {
                [self testAllSubview:v];
            }
        }
    }
}

// handle app resume
-(void) appBecameActive {
    if (readerDevice != nil
        && readerDevice.availability == CMBReaderAvailibilityAvailable
        && readerDevice.connectionState != CMBConnectionStateConnecting && readerDevice.connectionState != CMBConnectionStateConnected)
    {
        [readerDevice connectWithCompletion:^(NSError *error) {
            if (error) {
                // handle connection error
            }
        }];
    }
}
- (float)getHeighScreen
{
    return [UIScreen mainScreen].bounds.size.height;
}
- (float)getWidthScreen
{
  return [UIScreen mainScreen].bounds.size.width;
}
- (BOOL)isIphoneX {
        if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
            switch ((int)UIScreen.mainScreen.nativeBounds.size.height) {
                case 2436:
                case 2688:
                case 1792:
                        return YES;
                        break;
                                
                default:
                        return NO;
                        break;
                }
        }
        return NO;
}
- (void)addCroshairs {
    
    float widthScreen = [self getWidthScreen];
    float heighScreen = [self getHeighScreen];
    // Top Mask
    CGFloat paddingMore = [self isIphoneX]? TopViewSpace_IPhoneX  : 0;
    UIView *naviView = [[UIView alloc] init];
    naviView.frame = CGRectMake(0,0, widthScreen, 55 + paddingMore);
    naviView.backgroundColor = UIColor.blackColor;
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(-1, [self isIphoneX]? TopViewSpace_IPhoneX + 55 : 55, widthScreen+2, heighScreen*130.0/736.0);
    topView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    topView.layer.borderColor = [UIColor whiteColor].CGColor;
    topView.layer.borderWidth = 1;
    
    UIView *middleView = [[UIView alloc] init];
    middleView.frame = CGRectMake(-1, heighScreen/2.0 + 22.5, widthScreen+2, 1);
    middleView.backgroundColor = [UIColor redColor];
    middleView.layer.borderColor = [UIColor redColor].CGColor;
    middleView.layer.borderWidth = 1;
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(-1, heighScreen-(heighScreen*130.0/736.0), widthScreen+2, heighScreen*130.0/736.0);
    bottomView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    bottomView.layer.borderColor = [UIColor whiteColor].CGColor;
    bottomView.layer.borderWidth = 1;
    
    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel addTarget:self action:@selector(onCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnCancel.frame = CGRectMake(-10, paddingMore + 5 , 120, 55);
    [btnCancel setTitle:@"CANCEL" forState:UIControlStateNormal];
    btnCancel.titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Bold" size:14];
    [naviView addSubview:btnCancel];
    
    UIButton *btnFlash = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnFlash addTarget:self action:@selector(onTurnFlash:) forControlEvents:UIControlEventTouchUpInside];
    btnFlash.backgroundColor = UIColor.clearColor;
    btnFlash.imageEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
    btnFlash.frame = CGRectMake(widthScreen - 20 - 120, paddingMore, 120, 55);
    [btnFlash setImage:[[UIImage imageNamed:@"ic_flash"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btnFlash setImage:[[UIImage imageNamed:@"ic_flash_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    [naviView addSubview:btnFlash];
    
    //add preview screen
    imgView = [[UIImageView alloc]
               initWithFrame:CGRectMake(0,naviView.frame.size.height,
                                        self.view.frame.size.width,
                                        self.view.frame.size.height - naviView.frame.size.height )];
    
        UIButton *btnAddVin = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnAddVin addTarget:self action:@selector(onAddManuallyClicked:) forControlEvents:UIControlEventTouchUpInside];
        btnAddVin.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.63];
        btnAddVin.titleLabel.font = [UIFont fontWithName:@"SourceSansPro-Semibold" size:16];
        btnAddVin.titleLabel.textColor = UIColor.whiteColor;
        btnAddVin.layer.cornerRadius = 3;
        btnAddVin.layer.masksToBounds = YES;
        [btnAddVin setBackgroundColor:[UIColor.blackColor colorWithAlphaComponent:0.63]];
        if (_isVin) {
            [btnAddVin setTitle:@"Add VIN Number Manually" forState:UIControlStateNormal];
        } else {
            [btnAddVin setTitle:@"Add Stock/RO Number Manually" forState:UIControlStateNormal];
        }
        if (IS_PAD) {
            btnAddVin.frame = CGRectMake(widthScreen/2.0 - 365/2.0, 33,365,67);
            
        }else{
            btnAddVin.frame = CGRectMake(20, 33,widthScreen - 40,heighScreen * (67.0/736.0));
        }
        
        [bottomView addSubview:btnAddVin];
    
    [self.view addSubview:naviView];
    [self.view addSubview:imgView];
    [self.view addSubview:topView];
    [self.view addSubview:bottomView];
    [self.view addSubview:middleView];
}

- (void)onAddManuallyClicked:(UIButton *)btn {
    
    [self dismissViewControllerAnimated:NO completion:^{
        if (self.onClickAddManually){
            self.onClickAddManually();
        }
    }];
    
}

- (void)onCancelClicked:(UIButton *)btn {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onTurnFlash:(UIButton *)btn {
    
    BOOL shouldOn = !btn.selected;
    
    // check if flashlight available
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            
            [device lockForConfiguration:nil];
            if (shouldOn) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
                
                btn.selected = shouldOn;
                //torchIsOn = YES; //define as a variable/property if you need to know status
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                //torchIsOn = NO;
                
                btn.selected = shouldOn;
            }
            [device unlockForConfiguration];
        }
    }
}

@end
