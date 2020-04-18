//
//  ListViewDataService.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import Foundation
import UIKit

class RowDataSource: NSObject {
    var data = [RowData]()
}
class ListViewDataService: RowDataSource, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        // swiftlint:disable:next line_length
           let cell = tableView.dequeueReusableCell(withIdentifier: "basicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
        cell.rowData = data[indexPath.row]
           return cell
       }
}
