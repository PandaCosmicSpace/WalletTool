//
//  SettingViewController.swift
//  WalletTool
//
//  Created by YangJiacheng on 2018/12/4.
//  Copyright © 2018 Jiacheng. All rights reserved.
//

import UIKit

let SettingCellIdetifier: String = "SettingCellIdetifier"

var dataArray:Array<String>?

class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Setting"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SettingCellIdetifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCellIdetifier, for: indexPath)
        cell.textLabel?.text = dataArray?[indexPath.row]
        return cell
    }
    func initView() {
        dataArray = ["use touch ID"]
    }
}
