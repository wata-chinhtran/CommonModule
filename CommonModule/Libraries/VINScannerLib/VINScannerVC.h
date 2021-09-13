//
//  VINScannerVC.h
//  MobileTechBooks
//
//  Created by Hoang Nguyen on 09/10/2020.
//  Copyright (c) 2020 MobilTechBooks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import "CMBReadResult.h"
#import "CMBReaderDevice.h"

#define SCANVIN_KEY @"Garjwb9Bv39YsK01fT/5bK1jxn4P1GH7sFGGsWVsac0="
#define IS_PAD   ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
#define TopViewSpace_IPhoneX 30.f

@interface VINScannerVC : UIViewController 
@property (nonatomic) BOOL isVin;
@property (nonatomic) BOOL notNeedCheckDuplicate;
@property (nonatomic) BOOL isHideBtnAddManual;
@property (strong,nonatomic) void(^onClickAddManually)(void);
@property (nonatomic, copy) void (^callback_getcode)(NSString* code);
@end
