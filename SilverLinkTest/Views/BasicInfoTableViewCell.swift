//
//  BasicInfoTableViewCell.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell {
    

    let containerView:UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        view.backgroundColor = .clear
          return view
      }()
      
      let contentImageView:UIImageView = {
          let img = UIImageView()
          img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
          img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
          img.layer.cornerRadius = 0
          img.clipsToBounds = true
          return img
      }()
      
      let titleLabel:UILabel = {
          let label = UILabel()
          label.font = UIFont.boldSystemFont(ofSize: 20)
          label.textColor = .black
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      let descriptionLabel:UILabel = {
          let label = UILabel()
          label.font = UIFont.boldSystemFont(ofSize: 14)
          label.textColor =  .darkGray
          label.backgroundColor = .clear
          label.layer.cornerRadius = 5
          label.clipsToBounds = true
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
           //self.contentView.addSubview(countryImageView)
           
           contentImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
           contentImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
           contentImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        contentImageView.heightAnchor.constraint(equalToConstant:70).priority = UILayoutPriority(rawValue: 999)
           
           containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
           containerView.leadingAnchor.constraint(equalTo:self.contentImageView.trailingAnchor, constant:10).isActive = true
           containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
           //containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
           containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -10).isActive = true
        
           titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
           titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
           titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
           titleLabel.heightAnchor.constraint(equalToConstant:24).isActive = true
           
            descriptionLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant: 6).isActive = true
           descriptionLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
           descriptionLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor, constant: -6).isActive = true
           descriptionLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant: -10).isActive = true
           
        
       }
       
       required init?(coder aDecoder: NSCoder) {
           
           super.init(coder: aDecoder)
       }
    
    func setDummyData(image: String){
        self.titleLabel.text = "Beavers"
        self.descriptionLabel.text = "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony"
        self.contentImageView.image = UIImage.init(named: image)
        
        
        contentImageView.heightAnchor.constraint(equalToConstant:  self.getAspectRatioAccordingToiPhones(cellImageWidth: 70,downloadedImage: contentImageView.image!)).isActive = true

    }
    
    func getAspectRatioAccordingToiPhones(cellImageWidth:CGFloat,downloadedImage: UIImage)->CGFloat {
        let widthOffset = downloadedImage.size.width - cellImageWidth
        let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
        let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
        let effectiveHeight = downloadedImage.size.height - heightOffset
        return(effectiveHeight)
    }

}
