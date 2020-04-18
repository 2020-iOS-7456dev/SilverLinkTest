//
//  ImagePlaceholder.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import Foundation
import UIKit
struct Constants {
    static let baseURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    static let placeholderColor =  UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
    static let placeholderImage: UIImage = {
        let color: UIColor = placeholderColor
        let size: CGSize = CGSize.init(width: 500, height: 500)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }()
}
