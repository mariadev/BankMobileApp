//
//  UIViewToStackView.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import UIKit

protocol UIViewToStackView {
    func stack(_ axis: NSLayoutConstraint.Axis,
               views: [UIView], spacing: CGFloat,
               alignment: UIStackView.Alignment,
               distribution: UIStackView.Distribution)
    -> CustomUIStackView
    func verticalStack(_ views: UIView...,
                       spacing: CGFloat,
                       alignment: UIStackView.Alignment,
                       distribution: UIStackView.Distribution)
    -> CustomUIStackView
    func horizontalStack(_ views: UIView...,
                         spacing: CGFloat,
                         alignment: UIStackView.Alignment,
                         distribution: UIStackView.Distribution)
    -> CustomUIStackView
}

extension UIViewToStackView where Self: UIView {
    @discardableResult
    func stack(_ axis: NSLayoutConstraint.Axis = .vertical,
               views: [UIView],
               spacing: CGFloat = 0,
               alignment: UIStackView.Alignment = .fill,
               distribution: UIStackView.Distribution = .fill)
    -> CustomUIStackView {
        let stackView = CustomUIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.edgeTo(self)
        return stackView
    }

    @discardableResult
    func verticalStack(_ views: UIView...,
                       spacing: CGFloat = 0,
                       alignment: UIStackView.Alignment = .fill,
                       distribution: UIStackView.Distribution = .fill)
    -> CustomUIStackView {
        print(views)
        return stack(.vertical,
                     views: views,
                     spacing: spacing,
                     alignment: alignment,
                     distribution: distribution)
    }

    @discardableResult
    func horizontalStack(_ views: UIView...,
                         spacing: CGFloat = 0,
                         alignment: UIStackView.Alignment = .fill,
                         distribution: UIStackView.Distribution = .fill)
    -> CustomUIStackView {
        return stack(.horizontal,
                     views: views,
                     spacing: spacing,
                     alignment: alignment,
                     distribution: distribution)
    }

}
