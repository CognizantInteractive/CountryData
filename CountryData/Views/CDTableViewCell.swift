//
//  CDTableViewCell.swift
//  CountryData
//
//  Created by CTS iMac Sierra on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit

class CDTableViewCell: UITableViewCell {
    var indexPath: IndexPath?
    
    var containerView: CustomView = {
        var containerView = CustomView()
        containerView.cornerRadius = 5.0
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.font = ThemingFont.primaryLabelFont()
        titleLabel.textColor = ThemingColors.globalBlackColor()
        titleLabel.text = ""
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    var descriptionLabel: UILabel = {
        var descLabel = UILabel()
        descLabel.font = ThemingFont.secondarylabelFont()
        descLabel.textColor = ThemingColors.globalGreyColor()
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.text = ""
        descLabel.numberOfLines = 0
        return descLabel
    }()
    
    var photoImageView: UIImageView = {
        var photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.contentMode = .scaleAspectFit
        photoImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return photoImage
    }()
    
    var stackContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate func stackLayoutConstraints() {
        //Constraints
        stackContainerView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        self.addSubview(containerView)
        self.autoresizesSubviews = false
        self.containerView.bindFrameToSuperviewBounds()
        self.stackContainerView.addArrangedSubview(self.photoImageView)
        self.stackContainerView.addArrangedSubview(self.titleLabel)
        self.stackContainerView.addArrangedSubview(self.descriptionLabel)
        self.containerView.addSubview(stackContainerView)
        self.stackContainerView.bindViewToSuperviewBounds(withConstant: 8.0)
        stackLayoutConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
