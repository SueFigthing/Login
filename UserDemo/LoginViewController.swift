//
//  LoginViewController.swift
//  UserDemo
//
//  Created by lisue on 16/10/17.
//  Copyright © 2016年 lisue. All rights reserved.
//

import UIKit

private let infoCellIdentifier = "infoCell"

class infoCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layoutCustomViews()
    
        
    }
    
    fileprivate func layoutCustomViews(){
        contentView.addSubview(textField)
        
    }
    
    /// 懒加载
    lazy var textField:UITextField = {
        let textF =  UITextField(frame: CGRect(x: 10, y: 10, width: self.frame.size.width-20, height: 30))
        textF.backgroundColor = UIColor.yellow
        
        return textF
    
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}

class LoginViewController: UITableViewController{
    
    let pAy = ["账号/手机号","密码"]
    
   override init(style: UITableViewStyle) {
        super.init(style: style)
        self.title = "登录"
    self.tableView.register(infoCell.self, forCellReuseIdentifier: infoCellIdentifier)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboderObserver()
        self.tableView.tableHeaderView = self.tableViewHeaderView()
        self.tableView.tableFooterView = self.tableViewFooterView()
      // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row<2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: infoCellIdentifier, for: indexPath) as! infoCell
            
            cell.textField.placeholder = pAy[indexPath.row]
            
            return cell
            
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
            // Configure the cell...
            
            return cell
        }
       
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
     // MARK: -
    func tableViewHeaderView() -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 316))
        headerView.backgroundColor = UIColor.orange
        
        return headerView
        
    }
    
    func tableViewFooterView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 316))
        footerView.backgroundColor = UIColor.orange
        
        return footerView
        
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: -  NotificationCenter

extension LoginViewController{
    
    func addKeyboderObserver() -> Void {
        //增加监听，当键盘出现或改变时收出消息
    
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    
    func keyboardWillShow(notification:NSNotification) -> Void {
        
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as!TimeInterval
        print("===\(duration)")
        
        UIView.animate(withDuration: duration) {
            
            
            self.tableView.setContentOffset(CGPoint(x: 0, y: 210), animated: false)
        }
    }
    
    func keyboardWillHide(notification:NSNotification) -> Void {
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as!TimeInterval
        
        UIView.animate(withDuration: duration) {
            self.tableView.setContentOffset(CGPoint(x: 0, y:0), animated: false)
        }
    }
    
}
