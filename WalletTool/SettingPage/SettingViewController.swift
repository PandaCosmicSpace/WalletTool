//
//  SettingViewController.swift
//  WalletTool
//
//  Created by YangJiacheng on 2018/12/4.
//  Copyright © 2018 Jiacheng. All rights reserved.
//

import UIKit

let SettingCellPlainIdetifier: String = "SettingCellPlainIdetifier"
let SettingCellWithSwitchIdetifier: String = "SettingCellWithSwitchIdetifier"

var dataArray:Array<CellTypeModel>?

class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Setting"
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SettingCellWithSwitchIdetifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingCellPlainIdetifier)
        tableView.delegate = self
        tableView.dataSource = self
        initView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = dataArray?[indexPath.row].cellType
        let identifier = obtainCellIdentifier(cellType: cellType!)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = dataArray?[indexPath.row].name
        return cell
    }
    
    func initView() {
        let switchCellModel = CellTypeModel(name: "Use touch ID", cellType: .CellWithSwitch)
        dataArray = [switchCellModel]
    }
    
    func obtainCellIdentifier(cellType:CellType) -> String {
        let identifier : String
        switch cellType {
        case .Plain:
            identifier = SettingCellPlainIdetifier
        case .CellWithSwitch:
            identifier = SettingCellWithSwitchIdetifier
        }
        return identifier
    }
}

struct CellTypeModel {
    let name :String?
    var cellType : CellType = .Plain
}

enum CellType {
    case CellWithSwitch
    case Plain
    
}
