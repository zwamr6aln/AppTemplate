
import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {
    let 💾 = UserDefaults(suiteName: "group.net.aaaakkkkssssttttnnnn.AppTemplate")!

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        print(#function)
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        print(#function)
        print("📠: ", contentText.debugDescription)
        💾.set(contentText, forKey: "sharedText")
        
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        print(#function)
        return []
    }

}
