//
//  ViewController.swift
//  A209FBLoing
//
//  Created by 申潤五 on 2022/10/29.
//

import UIKit
import FacebookLogin
import Firebase

class ViewController: UIViewController, LoginButtonDelegate {

    

    
    let facebookLoginBtn = FBLoginButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookLoginBtn.delegate = self
       
        facebookLoginBtn.center = self.view.center
        facebookLoginBtn.permissions = ["public_profile", "email"]
        self.view.addSubview(facebookLoginBtn)
    }

    //MARK:FBLogin Delegate
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error{
            print(error.localizedDescription)
            return
        }
        if let token = AccessToken.current{
            let credential = FacebookAuthProvider
                .credential(withAccessToken: token.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }else{
            print("登入失敗")
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        logout()
    }
    
    func logout(){
        
    }

}

