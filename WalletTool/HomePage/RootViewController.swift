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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "WalletTool"
        
        //init navigationBaritem
        let rightButton: UIBarButtonItem = UIBarButtonItem(title: "Setting", style: .plain, target: self, action: #selector(onSettingTap))
        navigationItem.rightBarButtonItem = rightButton
    
        
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
        // Do any additional setup after loading the view.
    }
    
    @objc func onLabelClick(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize=CGSize.zero
        let walletVC = WalletCollectionViewController.init(collectionViewLayout: layout)
        navigationController?.pushViewController(walletVC, animated: true)
    }
    
    @objc func onSettingTap() {
        let settingVC = SettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }

}
