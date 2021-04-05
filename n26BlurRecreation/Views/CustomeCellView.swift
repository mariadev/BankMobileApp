//
//  CustomeCell.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let view = CustomUIView()
    let middle = CustomUIView()
    let rightView = CustomUIView()
    var companyName = CustomUILabel()
    var price =  BlurredLabel()
    var date = CustomUILabel()
    var icon = CustomUIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
    
    func initialize() {
        layout()
        style()
        addImagesFixSize()
    }

    func layout() {
        
        contentView.addSubview(view)
        
        middle.addSubview(companyName)
        middle.addSubview(date)
        
        rightView.addSubview(price)

        view.setAnchor(top: contentView.topAnchor, bottom:contentView.bottomAnchor, right:contentView.trailingAnchor, left:contentView.leadingAnchor,  paddingTop: Constants.paddingLeftRight, paddingBottom: Constants.paddingLeftRight)
        view.HStack(icon,
                         middle,
                         rightView,
                         spacing: 8,
                         alignment: .center,
                         distribution: .fill
                    )
        
        companyName.setAnchor(top: middle.topAnchor)
        date.setAnchor(top: companyName.bottomAnchor, bottom:middle.bottomAnchor,  paddingTop: Constants.paddingTop)
        price.centerYRighttX(center: rightView)

    }
    
    func addImagesFixSize() {
        let calculateHeight = contentView.frame.height / 1.2
        icon.setHeight(calculateHeight)
        icon.setWidth(calculateHeight)
        
    }
    
    func style() {
        self.backgroundColor = .white
        self.isOpaque = false
        
        price.font = UIFont(name:Constants.fontFamily,size:Constants.sizeSmall)
        price.textColor = .darkText
        
        date.font = UIFont(name:Constants.fontFamily,size:Constants.sizeMedium)
        date.textColor = .systemGray
        
        companyName.font = UIFont(name:Constants.fontFamily,size: Constants.sizeBig)
        companyName.textColor = .darkText
        companyName.numberOfLines = 0
    }
}
