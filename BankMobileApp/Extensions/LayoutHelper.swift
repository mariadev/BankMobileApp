//
//  LayoutHelper.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import UIKit

protocol LayoutHelper {

    func edgeTo(_ view: UIView,
                constant: CGFloat)

    func setAnchor(top: NSLayoutYAxisAnchor?,
                   bottom: NSLayoutYAxisAnchor?,
                   right: NSLayoutXAxisAnchor?,
                   left: NSLayoutXAxisAnchor?,
                   paddingTop: CGFloat,
                   paddingBottom: CGFloat,
                   paddingLeft: CGFloat,
                   paddingRight: CGFloat)

    func edgeToSafeArea(_ view: UIView, constant: CGFloat)

    func center(center: UIView)

    func toBottomCenter(bottomView: UIView, centerView: UIView, constant: CGFloat)

    func toTopCenter(topView: UIView, centerView: UIView, constant: CGFloat)

    func setWidthWithMultiplier(viewWidth: NSLayoutDimension,
                                multiplier: CGFloat,
                                constant: CGFloat)

    func setHeightMultiplier(viewHeight: NSLayoutDimension,
                             multiplier: CGFloat,
                             constant: CGFloat)

    func setHeight(_ height: CGFloat)

    func setWidth(_ width: CGFloat)

    func centerYRightX(center: UIView)

    func centerYLeftX(leftX: UIView, centerViewY: UIView)

}

extension LayoutHelper where Self: UIView {

    func edgeTo(_ view: UIView,
                constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant),
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant)
        ])

    }

    func edgeToSafeArea(_ view: UIView,
                        constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant),
                leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant),
                trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -constant),
                bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant)
        ])

    }

    func toBottomCenter(bottomView: UIView, centerView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -constant),
            centerXAnchor.constraint(equalTo: centerView.centerXAnchor)
        ])
    }

    func toTopCenter(topView: UIView, centerView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: topView.topAnchor, constant: -constant),
            centerXAnchor.constraint(equalTo: centerView.centerXAnchor)
        ])
    }

    func center(center: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: center.centerXAnchor),
            centerYAnchor.constraint(equalTo: center.centerYAnchor)
        ])
    }

    func centerYLeftX(leftX: UIView, centerViewY: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leftX.leadingAnchor),
            centerYAnchor.constraint(equalTo: centerViewY.centerYAnchor)
        ])
    }

    func centerYRightX(center: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: center.trailingAnchor),
            centerYAnchor.constraint(equalTo: center.centerYAnchor)
        ])
    }

    func setAnchor(top: NSLayoutYAxisAnchor? = nil,
                   bottom: NSLayoutYAxisAnchor? = nil,
                   right: NSLayoutXAxisAnchor? = nil,
                   left: NSLayoutXAxisAnchor? = nil,
                   paddingTop: CGFloat = 0,
                   paddingBottom: CGFloat = 0,
                   paddingLeft: CGFloat = 0,
                   paddingRight: CGFloat = 0) {

        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let  right = right {
            trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let  left = left {
            leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
    }

    func setWidthWithMultiplier(viewWidth: NSLayoutDimension,
                                multiplier: CGFloat = 0,
                                constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: viewWidth,
                               multiplier: multiplier,
                               constant: constant).isActive = true

    }

    func setHeightMultiplier(viewHeight: NSLayoutDimension,
                             multiplier: CGFloat = 0,
                             constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: viewHeight,
                                multiplier: multiplier,
                                constant: constant).isActive = true

    }

    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

}
