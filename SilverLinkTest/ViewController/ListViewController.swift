//
//  ListViewController.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    let listTableView = UITableView()
    var listVM = ListViewModel()
    let dataSource = ListViewDataService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(listTableView)
        setupTableView()
        listVM.delegate = self
        listVM.getData()
        self.navigationItem.title = "Dynamic Title"
    }
    func setupTableView() {
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
        listTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        listTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.listTableView.dataSource = self.dataSource
        self.listTableView.rowHeight = UITableView.automaticDimension
        self.listTableView.estimatedRowHeight = 100
        registerTableViewCells()
    }
    func registerTableViewCells() {
        self.listTableView.register(BasicInfoTableViewCell.self, forCellReuseIdentifier: "basicInfoTableViewCell")
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

extension ListViewController: ListDataprotocal {
    func success() {
        dataSource.data = listVM.getListData()
        self.navigationItem.title = listVM.getTitle()
        self.listTableView.reloadData()
    }
    func failure() {
       BannerMessage.sharedManager.notificationBanner(msg: "Something went wrong. Please try again!", barColor: .red)
    }
}
