//
//  BannerMessage.swift
//  Collab
//
//  Created by Stylabs on 03/08/18.
//  Copyright © 2018 Raj K. All rights reserved.
//

import UIKit
import Foundation

class BannerMessage: NSObject {
    static let sharedManager: BannerMessage = {
        let sharedPre = BannerMessage()
        return sharedPre
    }()
    func notificationBanner(msg: String, barColor: UIColor) {
        RKMsgView.init(duration: 0.6, delay: 1)
            .message(message: msg)
            .messageColor(color: .white)
            .messageFont(font: UIFont.systemFont(ofSize: 12))
            .backgroundColor(color: barColor)
            .show()
    }
}
