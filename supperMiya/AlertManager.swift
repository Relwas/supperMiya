//
//  AlertManager.swift
//  supperMiya
//
//  Created by relwas on 28/02/23.
//

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
    }
}


//MARK: - Show validation alerts
extension AlertManager {
    
    public static func showInvalidPhoneNumberAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Noto'g'ri raqam kirg'azildi!", message: "Iltimos raqamingizni tekshirib, qaytdan urunib ko'ring.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Parol not'g'ri!", message: "Iltimos parolni tekshirib, qaytdan urunib ko'ring.")
    }
}

//MARK: - Log in Errors
extension AlertManager {
 
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, with: "Uknown Error sign in", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Error sign in", message: "\(error.localizedDescription)")
    }
}

//MARK: - Log out Errors
extension AlertManager {
    
    public static func showLogOutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Log Out Error", message: "\(error.localizedDescription)")
    }
}

//MARK: - Forgot Password Errors
extension AlertManager {
    
    public static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Forgot Password Error", message: "\(error.localizedDescription)")
    }
}

//MARK: - Fetching User Errors
extension AlertManager {
    
    public static func showFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Error fetching user", message: "\(error.localizedDescription)")
    }
    
    public static func showUnknownFetchingUserError(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, with: "Unknown Error Fetching User", message: nil)
    }
}
