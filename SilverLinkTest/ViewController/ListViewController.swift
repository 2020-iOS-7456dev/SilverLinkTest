//
//  ListViewController.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    let listTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(listTableView)
        setupTableView()
        self.navigationItem.title = "Dynamic Title"

    }
    
    func setupTableView() {
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        
    listTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive=true
    listTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
    listTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
    listTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.listTableView.dataSource = self
        self.listTableView.rowHeight = UITableView.automaticDimension
        self.listTableView.estimatedRowHeight = 100
        
        registerTableViewCells()
    }
    
    func registerTableViewCells(){
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

extension ListViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
        return 10
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "basicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
           cell.setDummyData(image: "dummy0")
          
           return cell
       }
    
}
