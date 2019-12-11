//
//  ContactTableViewCell.swift
//  TheRegistrationPage
//
//  Created by Juan Gerardo Cruz on 12/11/19.
//  Copyright © 2019 inventaapps. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    
    var contact: Contact? {
        didSet {
            guard let contactItem = contact else {return}
            if let name = contactItem.name {
                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let jobTitle = contactItem.jobTitle {
                jobTitleDetailedLabel.text = " \(jobTitle) "
            }
            
            if let country = contactItem.country {
                countryImageView.image = UIImage(named: country)
            }
        }
    }
    
    let profileImageView: UIImageView = {
       let img = UIImageView()
       img.contentMode = .scaleToFill
       img.translatesAutoresizingMaskIntoConstraints = false
       img.layer.cornerRadius = 35
       img.clipsToBounds = true
       return img
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobTitleDetailedLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.7803921569, blue: 0.8392156863, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let countryImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        self.containerView.addSubview(nameLabel)
        self.containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(self.containerView)
        self.contentView.addSubview(countryImageView)
        
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
        countryImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
