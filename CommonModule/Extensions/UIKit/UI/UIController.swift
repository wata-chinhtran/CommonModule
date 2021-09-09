

import Foundation
import MessageUI
extension UIViewController: MFMailComposeViewControllerDelegate {
    /// Find the top controller of winfows
    /// - Returns: UIViewController
    class func topMostController() -> UIViewController? {
        var topController = UIApplication.shared.keyWindow?.rootViewController
        
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        
        return topController
    }
    
    func callTo(_ phoneNumber: String) {
        let callUrl = "tel://\(phoneNumber)"
        if let url = URL(string: callUrl), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }else{
//            [self showDialogWithDescription:LANG(@"lk_Call_facility_is_not_available")];
        }
    }
    
    func mailTo(_ mailAddress: String) {
        if MFMailComposeViewController.canSendMail(){
            let mailVC = MFMailComposeViewController()
            mailVC.mailComposeDelegate = self
            mailVC.setToRecipients([mailAddress])
            present(mailVC, animated: true, completion: nil)
        }else{
            //            [self showDialogWithDescription:LANG(@"lk_Mail_facility_is_not_available")];
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            switch(result){
            case .sent:
//                [AppShare.mainVC showToaskMessage:LANG(@"[up]lk_alert_success") withDescription:LANG(@"lk_alert_emailHasBeenSuccessfullySent") callback:^(BOOL isConfirm, BOOL isDecline) {
//                }];
                break
            case .failed:
//                [self showToaskMessage:LANG(@"[up]lk_alert_somethingWentWrong") withDescription:LANG(@"lk_alert_emailHasBeenUnsuccessfullySent") callback:^(BOOL isConfirm, BOOL isDecline) {
//                }];
                break
            default:
                
                break
            }
        }
    }
}


