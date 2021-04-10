//
//  Header.swift
//  n26BlurRecreation
//
//  Created by Maria on 03/04/2021.
//

import UIKit

final class SearchBarView: CustomUIView {

    public init() {
        super.init(frame: CGRect.zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let topView = CustomUIView()
    let iconLeftTop =  CustomUIImageView()
    let iconMiddleTop =  CustomUIImageView()
    let iconRightTop =  CustomUIImageView()

    func initialize() {
        style()
        layout()
        addImages()
        addImagesFixSize()
    }

    func addImages() {
        iconLeftTop.image = UIImage(systemName: "magnifyingglass")
        iconMiddleTop.image = UIImage(named: "icon4")
        iconRightTop.image = UIImage(systemName: "circle")

    }

    private func addImagesFixSize() {

        iconLeftTop.setHeight(30)
        iconLeftTop.setWidth(30)

        iconMiddleTop.setHeight(30)
        iconMiddleTop.setWidth(40)

        iconRightTop.setHeight(30)
        iconRightTop.setWidth(30)

    }

    func layout() {
        self.addSubview(topView)

        topView.setAnchor(top: self.topAnchor,
                          right: self.trailingAnchor,
                          left: self.leadingAnchor)

        topView.horizontalStack(iconLeftTop,
                       iconMiddleTop,
                       iconRightTop,
                       alignment: .leading,
                       distribution: .equalCentering)

    }

    func style() {
        backgroundColor = .white
        [
            iconLeftTop,
            iconRightTop
        ].forEach {
            $0.tintColor =  UIColor(hex: 0x000000)
        }

    }

}
