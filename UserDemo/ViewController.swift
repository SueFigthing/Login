//
//  ViewController.swift
//  UserDemo
//
//  Created by lisue on 16/9/27.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        loginBtn.backgroundColor = UIColor.yellow
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginBtn.setTitle("登录", for: .normal)
        self.view.addSubview(loginBtn)
        
        
        
        let registBtn = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 40))
        registBtn.backgroundColor = UIColor.orange
        registBtn.setTitle("注册", for: .normal)
        registBtn.addTarget(self, action: #selector(regisetAction), for: .touchUpInside)
        self.view.addSubview(registBtn)
        
        
    }

    ///注册
    func regisetAction() -> Void {
      print("---regisetAction------")
        
        let regist = RegisterVIewController(style: .plain)
        regist.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(regist, animated: true)
    }
    
    ///登录
    func loginAction() -> Void {
        let login = LoginViewController(style: .plain)
        login.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(login, animated: true)
        
     print("---loginAction------")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

