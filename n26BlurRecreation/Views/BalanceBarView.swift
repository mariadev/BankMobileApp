//
//  UpperView.swift
//  n26BlurRecreation
//
//  Created by Maria on 31/03/2021.
//

import UIKit

final class BalanceBarView: CustomUIView {

    public init() {
        super.init(frame: CGRect.zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let background =  UIImageView(frame: UIScreen.main.bounds)

    let wrapermiddleView = CustomUIView()
    let middleView = CustomUIView()
    let iconLeftMiddle =  CustomUIImageView()
    let valueMiddle = CustomUILabel()
    let iconRightMiddle =  CustomUIImageView()

    let bottomView = CustomUIView()
    let current = CustomUILabel()
    let line =  CustomUIImageView()

    func initialize() {
        style()
        layout()
        addTex()
        addImages()
        resizeUI()
    }

    func addTex() {
        valueMiddle.text = "£0.55"
        current.text = "Current Balance"
    }

    func addImages() {
        iconLeftMiddle.image = UIImage(systemName: "circle.fill")
        iconRightMiddle.image = UIImage(systemName: "arrowtriangle.down.fill")
        line.image = UIImage(named: "icon6")

    }

    private func resizeUI() {
        iconLeftMiddle.setHeight(10)
        iconLeftMiddle.setWidth(10)

        iconRightMiddle.setHeight(15)
        iconRightMiddle.setWidth(15)

        line.setHeight(15)
        line.setWidth(150)

    }

    func layout() {
        self.addSubview(wrapermiddleView)

        wrapermiddleView.setAnchor(bottom: self.bottomAnchor, right: self.trailingAnchor, left: self.leadingAnchor)

        middleView.horizontalStack(iconLeftMiddle,
                          valueMiddle,
                          iconRightMiddle,
                          spacing: 8,
                          alignment: .center,
                          distribution: .equalCentering)
        bottomView.verticalStack(current,
                          line,
                          alignment: .center,
                          distribution: .equalSpacing)
        wrapermiddleView.verticalStack(
            middleView,
            bottomView,
            spacing: Theme.spacing,
            alignment: .center
        )

    }

    func style() {
        backgroundColor = .white

        valueMiddle.textAlignment = .center
        valueMiddle.textColor = UIColor.black
        valueMiddle.font = UIFont(name: Theme.fontFamily, size: 30)

        current.font = UIFont(name: Theme.fontFamily, size: 15)
        current.textColor = UIColor.systemGray

        [
            iconRightMiddle
        ].forEach {
            $0.tintColor =  Theme.colorDark
        }
        [
            iconLeftMiddle
        ].forEach {
            $0.tintColor =  Theme.colorAccent
        }

    }

}
