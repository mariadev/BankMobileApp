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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func layout() {
        let calculateHeight = contentView.frame.height / 1.2

        
        contentView.addSubview(view)
        middle.addSubview(companyName)
        middle.addSubview(date)
        
        rightView.addSubview(price)
    
    
        view.edgeToSafeArea(contentView, constant: 20)
        view.HStack(icon,
                         middle,
                         rightView,
                         spacing: 20,
                         alignment: .center,
                         distribution: .fill
                    )
        
        companyName.setAnchor(top: middle.topAnchor)
        date.setAnchor(top: companyName.bottomAnchor, bottom:middle.bottomAnchor,  paddingTop: 10)

        price.centerYRighttX(center: rightView)
        
        icon.setHeight(calculateHeight)
        icon.setWidth(calculateHeight)
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        
        price.font = UIFont(name:"BloggerSans-Light",size:16)
        price.textColor = .darkText
        
        date.font = UIFont(name:"BloggerSans-Light",size:16)
        date.textColor = .systemGray
        
        companyName.font = UIFont(name:"BloggerSans-Light",size:17)
        companyName.textColor = .darkText
        companyName.numberOfLines = 0

    }


}
