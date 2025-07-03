//
//  Created by Hader
//
import Foundation
import UIKit
import CDAlertView

extension UIViewController{
    func showNoInternet(handler: (() -> Void)? = nil){
        makeAlertWithOkButtonWithHandler(title: "No Internet Connection".localize, message:"Please check your network settings and try again.".localize ,okCompletion: {
           handler?()
        })
    }
    
    func makeDoneAlert(title: String, SubTitle: String, Image : UIImage) {
        let alert = CDAlertView(title: title, message: SubTitle, type: .notification)
        let doneAction = CDAlertViewAction(title:NSLocalizedString("Done", comment: ""))
        alert.circleFillColor = UIColor.primaryColor
        doneAction.buttonTextColor = UIColor.primaryColor
        alert.add(action: doneAction)
        alert.show()
    }
    
    func makeOkAlert(title: String, SubTitle: String, Image : UIImage) {
        let alert = CDAlertView(title: title, message: SubTitle, type: .notification)
        let doneAction = CDAlertViewAction(title:NSLocalizedString("Ok", comment: "") )
        alert.circleFillColor = UIColor.primaryColor
        doneAction.buttonTextColor = UIColor.primaryColor
        alert.add(action: doneAction)
        alert.show()
    }
    
    func makeTrueAlert(title: String, SubTitle: String, Image : UIImage) {
        let alert = CDAlertView(title: title, message: SubTitle, type: .success)
        let doneAction = CDAlertViewAction(title: NSLocalizedString("Done", comment: ""))
        alert.circleFillColor = .primaryColor
        alert.add(action: doneAction)
        alert.show()
    }


    
    func makeAlertWithTwoButtons(
        title: String,
        message: String,
         okCompletion: (() -> Void)? = nil,
        cancelCompletion: (() -> Void)? = nil
    ) {
        let alert = CDAlertView(title: title, message: message, type: .notification)

        // Create an "OK" action with a completion handler
        let okAction = CDAlertViewAction(title:NSLocalizedString("Ok", comment: "")) { (action) -> Bool in
            okCompletion?()
            return true // Return true to indicate that the action should close the alert
        }

        // Create a "Cancel" action with a completion handler
        let cancelAction = CDAlertViewAction(title: NSLocalizedString("Cancel", comment: "")) { (action) -> Bool in
            cancelCompletion?()
            return true // Return true to indicate that the action should close the alert
        }

        // Customize the appearance of the alert if needed
        alert.circleFillColor = .primaryColor
         okAction.buttonTextColor = .primaryColor
         cancelAction.buttonTextColor = .primaryColor

        // Add the actions to the alert
        alert.add(action: okAction)
        alert.add(action: cancelAction)

        // Show the alert
        alert.show()
    }
    
    
    func makeAlertWithOkButtonWithHandler(
        title: String,
        message: String,
        okCompletion: (() -> Void)? = nil) {
            let alert = CDAlertView(title: title, message: message, type: .notification)
            
            // Create an "OK" action with a completion handler
            let okAction = CDAlertViewAction(title:NSLocalizedString("Ok", comment: "")) { (action) -> Bool in
                okCompletion?()
                return true // Return true to indicate that the action should close the alert
            }
            // Customize the appearance of the alert if needed
            alert.circleFillColor = .primaryColor
            okAction.buttonTextColor = .primaryColor

            // Add the actions to the alert
            alert.add(action: okAction)

            // Show the alert
            alert.show()
        }
    
    
    
    func handleError(_ error: Error) {
        // Cast the error to NSError
        if let nsError = error as NSError? {
            // Access the domain and code of the error
            let domain = nsError.domain
            let code = nsError.code
            let userInfo = nsError.userInfo
            
            // Print the error details
            print("Error Domain: \(domain)")
            print("Error Code: \(code)")
            
            // Check if there are additional details in UserInfo
            if let description = userInfo[NSLocalizedDescriptionKey] as? String {
                print("Description: \(description)")
            }
            
            // Print any other userInfo details
            for (key, value) in userInfo {
                print("Key: \(key), Value: \(value)")
            }
        } else {
            // Handle generic errors
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func openURL(urlLink: String) {
        if let url = URL(string: urlLink) {
            UIApplication.shared.open(url)
        }
    }
    

}

extension UIViewController {
    
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func present(_ vc: UIViewController) {
        navigationController?.present(vc, animated: true)
    }
        
    func popTwoScreens() {
        guard let vc = navigationController?.viewControllers[(navigationController?.viewControllers.count)! - 3] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
    func popThreeScreens() {
        guard let vc = navigationController?.viewControllers[(navigationController?.viewControllers.count)! - 4] else { return }
        navigationController?.popToViewController(vc, animated: false)
    }
    
    func isNavigationHidden(_ status: Bool) {
        navigationController?.isNavigationBarHidden = status
    }
    
    func isTabBarHidden(_ status: Bool){
        tabBarController?.tabBar.isHidden = status
    }
}
