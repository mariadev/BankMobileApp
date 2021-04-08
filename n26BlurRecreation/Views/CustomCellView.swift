//
//  CustomeCell.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

final class CustomCell: UITableViewCell {

    let view = CustomUIView()
    let middle = CustomUIView()
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

    override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         if selected {
            self.selectedBackgroundView?.isHidden = true
            contentView.backgroundColor =  Theme.colorLight
            price.backgroundColor =  Theme.colorAccent.withAlphaComponent(0.2)
         } else {
            contentView.backgroundColor =  Theme.colorLight
            price.backgroundColor = Theme.colorLight
         }
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

        view.setAnchor(top: contentView.topAnchor,
                       bottom: contentView.bottomAnchor,
                       right: contentView.trailingAnchor,
                       left: contentView.leadingAnchor,
                       paddingTop: Theme.paddingLeftRight,
                       paddingBottom: Theme.paddingLeftRight)
        view.horizontalStack(icon,
                    middle,
                    price,
                    spacing: 8,
                    alignment: .center,
                    distribution: .fill
        )

        companyName.setAnchor(top: middle.topAnchor)
        date.setAnchor(top: companyName.bottomAnchor,
                       bottom: middle.bottomAnchor,
                       paddingTop: Theme.paddingTop)

    }

    func addImagesFixSize() {
        let calculateHeight = contentView.frame.height / 1.2
        icon.setHeight(calculateHeight)
        icon.setWidth(calculateHeight)

    }

    func style() {
        self.backgroundColor = .white
        self.isOpaque = false

        price.font = UIFont(name: Theme.fontFamily, size: Theme.sizeSmall)
        price.textColor = .darkText
        price.frame = CGRect(x: 0, y: 0, width: (price.intrinsicContentSize.width), height: 15)
        price.layer.cornerRadius = price.frame.size.height/2.0
        price.layer.masksToBounds = true
        price.paddingTop = 12
        price.paddingRight = 10
        price.paddingLeft = 10
        price.paddingBottom = 10
        price.paddingLeft = 10

        date.font = UIFont(name: Theme.fontFamily, size: Theme.sizeMedium)
        date.textColor = .systemGray

        companyName.font = UIFont(name: Theme.fontFamily, size: Theme.sizeBig)
        companyName.textColor = .darkText
        companyName.numberOfLines = 0

        icon.tintColor =  UIColor(hex: 0x000000)
    }

    func configure(operation: DataOperation) {

        self.companyName.text = operation.companyName
        self.price.text = operation.price
        self.date.text = operation.date
        self.icon.image = UIImage(systemName: operation.image)
    }
}
