//
//  SwitchTableViewCell.swift
//  WalletTool
//
//  Created by YangJiacheng on 2018/12/6.
//  Copyright © 2018 Jiacheng. All rights reserved.
//

import UIKit
import SnapKit

class SwitchTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let aSwitch : UISwitch = UISwitch()
        aSwitch.isOn = UserPasswordManager.sharedManager.isUsePassword
        contentView.addSubview(aSwitch)
        aSwitch.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.centerY.equalToSuperview()
        }
        aSwitch.addTarget(self, action:#selector(onSwitchValueChanged), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
     @objc func onSwitchValueChanged(aSwitch:UISwitch){
        UserPasswordManager.sharedManager.authenticationWithTouchID(result: {isSuccess in
            if(UserPasswordManager.sharedManager.isUsePassword){
                if(isSuccess){
                    UserPasswordManager.sharedManager.changeIsUsepassword(isUsePassword: false)
                } else{
                    aSwitch.isOn = true
                }
            }else{
                if(isSuccess){
                    UserPasswordManager.sharedManager.changeIsUsepassword(isUsePassword: true)
                } else{
                    aSwitch.isOn = false
                }
            }
            })
    }

}
