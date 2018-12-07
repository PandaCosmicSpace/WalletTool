//
//  RootViewController.swift
//  WalletTool

//
//  Created by YangJiacheng on 2018/11/22.
//  Copyright © 2018 Jiacheng. All rights reserved.
//

import UIKit
import SnapKit
class RootViewController: UIViewController {

    var passwordLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "WalletTool"
        
        //init navigationBaritem
        let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(onSettingTap))
        navigationItem.rightBarButtonItem = rightButton
        checkNeedPassword()
    }
    
    func checkNeedPassword() {
        weak var weakSelf = self
        if(UserPasswordManager.sharedManager.isUsePassword){
            UserPasswordManager.sharedManager.authenticationWithTouchID(result: {isSuccess in
                if(isSuccess){
                    weakSelf?.initView()
                } else{
                    weakSelf?.initViewForPassword()
                }
            })
        } else{
            initView()
        }
    }
    
    func initView() {
        let label = UILabel.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Hello World"
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(onLabelClick))
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    func initViewForPassword() {
        passwordLabel = UILabel.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        passwordLabel?.font = UIFont.systemFont(ofSize: 15)
        passwordLabel?.textColor = .black
        passwordLabel?.text = "点击验证密码"
        view.addSubview(passwordLabel!)
        passwordLabel?.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(onPasswordLabelClick))
        passwordLabel?.isUserInteractionEnabled = true
        passwordLabel?.addGestureRecognizer(tap)
    }
    
    @objc func onLabelClick(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize=CGSize.zero
        let walletVC = WalletCollectionViewController.init(collectionViewLayout: layout)
        navigationController?.pushViewController(walletVC, animated: true)
    }
    
    @objc func onPasswordLabelClick(){
        passwordLabel?.removeFromSuperview()
        checkNeedPassword()
    }
    
    @objc func onSettingTap() {
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }

}
