//
//  BasicInfoTableViewCell.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import UIKit
import SDWebImage
class BasicInfoTableViewCell: UITableViewCell {
    var rowData: RowData? {
        didSet {
            guard let oneRecord = rowData else {return}
            if let title = oneRecord.title {
                titleLabel.text = title
            } else {
                titleLabel.text = ""
            }
            if let description = oneRecord.description {
                descriptionLabel.text = "\(description)"
            } else {
                descriptionLabel.text = ""
            }
            var urlString = ""
            if let imageString = oneRecord.imageHref {
                var stringArray = imageString.components(separatedBy: ":")
                if stringArray[0].contains("s") {
                    urlString = imageString
                } else {
                    stringArray.remove(at: 0)
                    stringArray.insert("https:", at: 0)
                    urlString = stringArray.joined()
                }
            }
            if let imageUrl = URL.init(string: urlString) {
                contentImageView.sd_setImage(with: imageUrl, placeholderImage: Constants.placeholderImage)
            } else {
                contentImageView.image = Constants.placeholderImage
            }
            // swiftlint:disable:next line_length
            contentImageView.heightAnchor.constraint(equalToConstant: self.getAspectRatioAccordingToiPhones(cellImageWidth: 70, downloadedImage: contentImageView.image!)).isActive = true
        }
    }
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        view.backgroundColor = .clear
        return view
    }()
    let contentImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 0
        img.clipsToBounds = true
        return img
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor =  .darkGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(contentImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        self.contentView.addSubview(containerView)
        contentImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        contentImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        contentImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        // swiftlint:disable:next line_length
        contentImageView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 10).isActive = true
        // swiftlint:disable:next line_length
        contentImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        // swiftlint:disable:next line_length
        containerView.leadingAnchor.constraint(equalTo: self.contentImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 6).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -6).isActive = true
        // swiftlint:disable:next line_length
        descriptionLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func setData(data: RowData?) {
        guard let oneRecord = rowData else {return}
        if let title = oneRecord.title {
            titleLabel.text = title
        }
        if let description = oneRecord.description {
            descriptionLabel.text = " \(description) "
        }
        if let imageString = oneRecord.imageHref, let imageUrl = URL.init(string: imageString) {
            contentImageView.sd_setImage(with: imageUrl, placeholderImage: Constants.placeholderImage)
        } else {
            contentImageView.image = Constants.placeholderImage
        }
        // swiftlint:disable:next line_length
        contentImageView.heightAnchor.constraint(equalToConstant: self.getAspectRatioAccordingToiPhones(cellImageWidth: 70, downloadedImage: contentImageView.image!)).isActive = true
    }
    func getAspectRatioAccordingToiPhones(cellImageWidth: CGFloat, downloadedImage: UIImage) -> CGFloat {
        let widthOffset = downloadedImage.size.width - cellImageWidth
        let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
        let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
        let effectiveHeight = downloadedImage.size.height - heightOffset
        return(effectiveHeight)
    }
}
