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
                   paddingRight: CGFloat
    )
    
    func edgeToSafeArea(_ view: UIView, constant: CGFloat)
    
    func center(center: UIView)
    
    func toBottomAndCenter(bottomView: UIView, centerView: UIView, constant: CGFloat)
    
    func toTopAndCenter(topView: UIView, centerView: UIView, constant: CGFloat)
    
    func setWidthWithMultiplier(viewWidth: NSLayoutDimension,
                                multiplier: CGFloat,
                                constant: CGFloat)
    func setHeightMultiplier(viewHeight: NSLayoutDimension,
                             multiplier: CGFloat,
                             constant: CGFloat)
    func setHeight(_ height: CGFloat)
    func setWidth(_ width: CGFloat)
    
}

extension LayoutHelper where Self: UIView {
    
    func edgeTo(_ view: UIView,
                constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        
    }
    
    func edgeToSafeArea(_ view: UIView,
                        constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -constant).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -constant).isActive = true
        
    }
    
    func toBottomAndCenter(bottomView: UIView, centerView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -constant).isActive = true
        centerXAnchor.constraint(equalTo:  centerView.centerXAnchor).isActive = true
    }
    
    func toTopAndCenter(topView: UIView, centerView: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: topView.topAnchor, constant: -constant).isActive = true
        centerXAnchor.constraint(equalTo:  centerView.centerXAnchor).isActive = true
    }
    
    func center(center: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo:  center.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo:  center.centerYAnchor).isActive = true
    }
    
    func centerYLeftX(leftX: UIView, centerViewY: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: leftX.leadingAnchor).isActive = true
        centerYAnchor.constraint(equalTo:  centerViewY.centerYAnchor).isActive = true
    }
    func centerYRighttX(center: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: center.trailingAnchor).isActive = true
        centerYAnchor.constraint(equalTo:  center.centerYAnchor).isActive = true
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
        if let  right = right  {
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
        widthAnchor.constraint(equalTo: viewWidth, multiplier: multiplier, constant: constant).isActive = true
        
    }
    func setHeightMultiplier(viewHeight: NSLayoutDimension,
                             multiplier: CGFloat = 0,
                             constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: viewHeight, multiplier: multiplier, constant: constant).isActive = true
        
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
