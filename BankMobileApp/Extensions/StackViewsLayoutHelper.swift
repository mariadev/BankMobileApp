//
//  StackViewsLayoutHelper.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import UIKit

public enum Padding {
    case top, left, right, bottom, verticalMargins, horizontalMargins, allMargins
}

protocol StackViewsLayoutHelper {
    func setupSubview(backgroundColor: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor ) -> CustomUIStackView
    func height(_ height: CGFloat) -> CustomUIStackView
    func width(_ width: CGFloat) -> CustomUIStackView
    func padding(_ margins: [Padding], amount: CGFloat) -> CustomUIStackView
}

extension StackViewsLayoutHelper where Self: UIStackView {

    func setupSubview(backgroundColor: UIColor = .white, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = .clear) -> CustomUIStackView {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = backgroundColor
        subview.layer.masksToBounds = true
        subview.layer.cornerRadius = cornerRadius
        subview.layer.borderWidth = borderWidth
        subview.layer.borderColor = borderColor.cgColor
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
        return self as! CustomUIStackView
    }

    func height(_ height: CGFloat) -> CustomUIStackView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self as! CustomUIStackView
    }

    func width(_ width: CGFloat) -> CustomUIStackView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self as! CustomUIStackView
    }

    func padding(_ margins: [Padding], amount: CGFloat) -> CustomUIStackView {
        isLayoutMarginsRelativeArrangement = true

        margins.forEach { (padding) in
            switch padding {
            case .top:
                layoutMargins.top = amount
            case .left:
                layoutMargins.left = amount
            case .right:
                layoutMargins.right = amount
            case .bottom:
                layoutMargins.bottom = amount
            case .verticalMargins:
                layoutMargins.top = amount
                layoutMargins.bottom = amount
            case .horizontalMargins:
                layoutMargins.left = amount
                layoutMargins.right = amount
            case .allMargins:
                layoutMargins = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
            }
        }

        return self as! CustomUIStackView
    }
}
