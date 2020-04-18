//
//  ListDataModel.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import Foundation

struct ListDataModel: Codable {
    let title: String?
    let rows: [RowData]?
}

struct RowData: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
