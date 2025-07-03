//
//  Created by Hader
//

import Foundation
import UIKit

enum AppStoryboard : String {
    case Streak
    case Progress
    case Ranking
    case Prayer
    case Order
    case Guest
    case Home
    case Login
    case ForgetPass
    case Verfication
    case ResetPassword
    case Register
    case Profile
    case EditProfile
    case MyAddress
    case AddAddress
    case AboutUs
    case ContactUs
    case ChangePAssword
    case Complaint
    case Favourite
    case OrderDetails
    case Checkout
    case SubCatageories
    case AllItems
    case ItemDetails
    case Search
    case Reviews
    case Notfications
    case AddReview
    case SucessOrder
    case Payment
    case Countries
    case PrayerTimes
    case Settings
    case Language
    case Theme
    case HelpDesk
    case UnlockPremium
    case PrivacyPolicy
    case DuaaDetails
    case Zikr
    case ZikrDetails
    case Tasbih
    case RankingMore
    case SavedPrayer
    case MyPrayer
    case PostDetails
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)"
    }
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
//        let vc = AppStoryboard.ItemPopup.viewController(viewControllerClass: ItemPopupViewController.self)

//let vc = AppStoryboard.Profile.viewController(viewControllerClass: ProfileViewController.self)
//navigationController?.pushViewController(vc, animated: true)
