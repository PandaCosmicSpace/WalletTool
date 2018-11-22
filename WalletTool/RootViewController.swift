//
//  RootViewController.swift
//  WalletTool
//
//  Created by YangJiacheng on 2018/11/22.
//  Copyright © 2018 Jiacheng. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.text = "Hello World"
        view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
