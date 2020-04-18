//
//  ListViewModel.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import Foundation

class ListViewModel: NSObject {
    let serviceHandler = WebServiceHandler()
    var listModel: ListDataModel?
    var delegate: ListDataprotocal?
    func getData() {
        let urlString = Constants.baseURL
        guard let url = URL.init(string: urlString) else {
            return
        }
        serviceHandler.get(url: url, parameter: nil) { (flag, responseData, httpResponse, error) in
            DispatchQueue.main.async(execute: {
                    if !flag {
                        BannerMessage.sharedManager.notificationBanner(msg: "Please try again!", barColor: .red)
                    }
                    self.mapToInboxModel(response: responseData, urlResponse: httpResponse)
            })
        }
    }
    func mapToInboxModel(response: Data?, urlResponse: HTTPURLResponse? ) {
        guard let urlResponse = urlResponse else {
            return
        }
        guard let response = response else {return}
        if urlResponse.statusCode == 200 {
            do {
                let jsonString = String(decoding: response, as: UTF8.self)
                let json = jsonString.toJSON()
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                self.listModel = try JSONDecoder().decode(ListDataModel.self, from: jsonData)
                delegate?.success()
            } catch let jsonError {
                print(jsonError)
                delegate?.failure()
            }
        } else {
            print("error code \(urlResponse.statusCode)")
            self.delegate?.failure()
        }
    }
    func getListData() -> [RowData] {
        return self.listModel?.rows ?? [RowData]()
    }
    func getTitle() -> String {
        return self.listModel?.title ?? ""
    }
}
