//
//  ViewController.swift
//  C0778925_MidTerm_MAD3115W2020
//
//  Created by MacStudent on 2020-03-05.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   

@IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var switch_rememberMe: UISwitch!
    @IBOutlet weak var txtPassord: UITextField!
   var flag=false
    @IBOutlet weak var lbl: UILabel!
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
                                      switch_rememberMe.isOn = false 
        getRememberMe()
        setRememberMe()
       
        super.viewDidLoad()
        //viewWillAppear(true)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
        userDefault.set("", forKey: "username")
        userDefault.set("", forKey: "password")
    }

    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
     
    guard let username = txtUsername.text else{
               showAlertBox(msg: "Please enter username")
        return
        }
        if username.isEmpty{
            showAlertBox(msg: "Please enter username")}
        
        guard let password = txtPassord.text else{
               showAlertBox(msg: "Please enter password")
        return
        }
        if password.isEmpty{
            showAlertBox(msg: "Please enter password")}
        readPlist(users:username,pwd:password)
          if flag==true
          {
            setRememberMe()
           //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let vc = storyboard.instantiateViewController(withIdentifier: "customersVC") as! CustomersViewController
                                               
           // self.navigationController?.pushViewController(vc, animated: true)
            
        }
          else{
            showAlertBox(msg: "NO USER EXIST")
        }
       }
       
    func showAlertBox(msg : String)  {
    let alert = UIAlertController(title: "Error", message:
        msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
    
    self.present(alert, animated: true)
}
    
    func setRememberMe()  {
    if switch_rememberMe.isOn {
        userDefault.set(self.txtUsername.text, forKey: "username")
        userDefault.set(self.txtPassord.text, forKey: "password")
    }else{
       userDefault.set("", forKey: "username")
       userDefault.set("", forKey: "password")
    }
}

 func getRememberMe()
{
    let userDefault = UserDefaults.standard
    
    if let username = userDefault.string(forKey: "username")
    {
        txtUsername.text = username
        
       if let password = userDefault.string(forKey: "password")
        {
            txtPassord.text = password
            
        }
    }
}
   
    
   func readPlist(users:String,pwd:String){
          if let path = Bundle.main.path(forResource: "CustomerPlist", ofType: "plist"){
              if let dictionary  = NSMutableDictionary(contentsOfFile: path){
                  if let c = dictionary["username_password"] as? [[String:String]]{
                      for user in c{
                          if user["username"]==users{
                              if user["password"]==pwd{
                                  flag=true
                              }
                              else{
                                  showAlertBox(msg: "Wrong password")
                              }
                          }}
                        
                            
                        
                    
                    
                }
            }
        }
    }
    
    
}

