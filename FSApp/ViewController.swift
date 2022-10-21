//
//  ViewController.swift
//  FSApp
//
//  Created by 海老原颯希 on 2022/10/21.
//

import UIKit
import GoogleSignIn
import GTMSessionFetcher
import GoogleAPIClientForREST

class ViewController: UIViewController {
    @IBAction func logInButtonDidTap(_ sender: Any) {
            // デリゲートを設定
                GIDSignIn.sharedInstance()?.delegate = self
        
            // ログイン画面の表示元を設定
            GIDSignIn.sharedInstance()?.presentingViewController = self

            // ログインを実行
            GIDSignIn.sharedInstance()?.signIn()
        
        if GIDSignIn.sharedInstance()!.hasPreviousSignIn() {
                    // 以前のログイン情報が残っていたら復元する
                GIDSignIn.sharedInstance()!.restorePreviousSignIn()
                } else {
                    // 通常のログインを実行
                    GIDSignIn.sharedInstance()?.signIn()
                }
        
        }
        // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = GIDSignIn.sharedInstance()?.currentUser {
            print("currentUser.profile.email: \(user.profile!.email!)")
        } else {
            // 次回起動時にはこちらのログが出力される
            print("currentUser is nil")
        }
    }
    }
extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            if error == nil {
                // ...

                let service = GTLRDriveService()
                service.authorizer = user.authentication.fetcherAuthorizer()
            } else {
                // ...
            }
        }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


