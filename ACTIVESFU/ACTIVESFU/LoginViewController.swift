//
//  LoginViewController.swift
//  Developed by Carber Zhang, Nathan Cheung
//
//  Using the coding standard provided by eure: github.com/eure/swift-style-guide
//
//  The view controller the user sees when he is not logged into his account or starts the app
//  for the first time. User is able to register using email and a password and data will be saved
//  in Firebase.
//
//  Bugs:
//
//
//
//  Changes:
//  Allowed keyboard to be dismissed when pressing 'done'
//  Changed transition from navigate to dismiss
//
//
<<<<<<< HEAD
// Worked on by: Shelly, Carber
=======
//
//  Copyright © 2017 CMPT276 Group 10. All rights reserved.
>>>>>>> eddebbc8bb88c40cefdcd151f7a7d7b608fbc09f

import UIKit

import Firebase


//MARK: LoginViewController


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
<<<<<<< HEAD
       override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        ref = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }
=======
    //MARK: Internal
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
>>>>>>> eddebbc8bb88c40cefdcd151f7a7d7b608fbc09f

    var firebaseReference: FIRDatabaseReference!
    
    @IBAction func loginButton(_ sender: UIButton) {

        
        if (self.emailTextField.text=="" || self.passwordTextField.text=="") {
            
            print("Login was pressed")
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter and email and password.", preferredStyle: .alert)
            let defaulAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaulAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
<<<<<<< HEAD
        else
        {
            func handleLogin() {
                //wait for user input
                //                let email: String = "333@gmail.com"
                //                let password: String = "123456"
                
                //checking the authentication:
                FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    else{
                        print("login successful")
                        let loggedInScene = self.navigationController?.storyboard?.instantiateViewController(withIdentifier: "mainmenuVC_ID") as! MainViewController
                        self.navigationController?.pushViewController(loggedInScene, animated: true)
                    }
                })
                //show the user info
                let uid = FIRAuth.auth()?.currentUser?.uid
                self.ref = FIRDatabase.database().reference()
                let UsersRef = self.ref.child("Users").child(uid!)
                UsersRef.observeSingleEvent(of: .value, with: { (snapshot) in
                    print(snapshot)
                }, withCancel: nil)
            
                
            }
=======
        else {
>>>>>>> eddebbc8bb88c40cefdcd151f7a7d7b608fbc09f
            
            handleLogin()
        }
    }
    
    @IBAction func accountButton(_ sender: UIButton) {
        
        if (self.emailTextField.text=="" || self.passwordTextField.text=="") {
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter and email and password.", preferredStyle: .alert)
            let defaulAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

            alertController.addAction(defaulAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else {
<<<<<<< HEAD
            //wait for user input
            // guard let email = usernameTextField.text, let password = passwordTextField.text, let name = usernameTextField.text else {
//            let email:String = "333@gmail.com"
//            let password:String = "123456"
            func handleRegister() {
            let name:String = "Bob"
            let friends:Array = ["7PT0C9flfDM3RcZtdcHURzySlaJ2", "orQY3pNQxJa1h5RcBa1QrjKblQg2"]//dummy users
=======
>>>>>>> eddebbc8bb88c40cefdcd151f7a7d7b608fbc09f
            
            handleRegister()
        }
    }
    
    func segueToSurvey(){
        UINavigationBar.appearance().barTintColor = UIColor.purple
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let surveyController = QuestionController()
        let navController = UINavigationController(rootViewController: surveyController)
            self.present(navController, animated: true, completion: nil)
    }
    
    func handleLogin() {
                
<<<<<<< HEAD
                //refernece to this user
                self.ref = FIRDatabase.database().reference()
                let UsersRef = self.ref.child("Users").child(uid)

                
                //insert user
                UsersRef.updateChildValues(["user": name, "email": self.emailTextField.text!, "contact": friends], withCompletionBlock: { (err, ref) in
                    if err != nil {
                        print(err!)
                        return
                    }
                    let values = ["user": name, "email": self.emailTextField.text!]
                    
                    self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                   print("Create account successful")
                })
=======
        //checking the authentication:
        FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            if error != nil {
                        
            print(error!)
            return
            }
            else{
                        
                print("login successful")
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
    func handleRegister() {
        
        let userUsername: String = "shelly"
        let userFriends: Array = ["7PT0C9flfDM3RcZtdcHURzySlaJ2", "orQY3pNQxJa1h5RcBa1QrjKblQg2"]//dummy users
            
        FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user: FIRUser?, error) in
            if error != nil {
                    
                print(error!)
                return
            }
            guard let userUID = user?.uid
                
            else {
                    
                return
            }
            
            self.firebaseReference = FIRDatabase.database().reference()
            let userReferenceInDatabase = self.firebaseReference.child("Users").child(userUID)
                
            //insert user
            userReferenceInDatabase.updateChildValues(["user": userUsername, "email": self.emailTextField.text!, "contact": userFriends], withCompletionBlock: { (err, ref) in
                if err != nil {
                        
                    print(err!)
                    return
                }
                print("Create account successful")
                self.segueToSurvey()
>>>>>>> eddebbc8bb88c40cefdcd151f7a7d7b608fbc09f
            })
        })
    }
    
    
    //MARK: UIViewController
    
    
    override func viewDidLoad() {
        
<<<<<<< HEAD
   }
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        let ref = FIRDatabase.database().reference()
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err!)
                return
            }
            
            let user = User()
            //this setter potentially crashes if keys don't match
            user.setValuesForKeys(values)
            self.dismiss(animated: true, completion: nil)
        })
=======
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        firebaseReference = FIRDatabase.database().reference()
>>>>>>> eddebbc8bb88c40cefdcd151f7a7d7b608fbc09f
    }

    
    //MARK: UITextFieldDelegate
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        textField.returnKeyType = UIReturnKeyType.done
        self.emailTextField.keyboardType = UIKeyboardType.emailAddress
        return true
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
