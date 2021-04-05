//
//  CustomeSectionView.swift
//  n26BlurRecreation
//
//  Created by Maria on 05/04/2021.
//

import UIKit

class CustomSectionView: CustomUIView {
    
    var title = CustomUILabel()
    
    public init() {
        super.init(frame: CGRect.zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func initialize() {
        layout()
        style()
    }
    
    func layout() {
        self.addSubview(title)
        title.edgeTo(self)
        
    }
    
    func style() {
        self.backgroundColor = .white
        title.sizeToFit()
        title.textColor = .black
        title.font = UIFont(name:Constants.fontFamily,size:Constants.sizeBig)
    }
}

