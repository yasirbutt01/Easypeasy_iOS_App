//
//  CellCardBackgroundShadowedView.swift
//  Hooley
//
//  Created by Macbook Pro 1 on 7/19/19.
//  Copyright © 2019 MessageMuse. All rights reserved.
//

import UIKit

class CellCardBackgroundShadowedView: UIView {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}

class RoundedView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}

class CellCardBackgroundView: UIView {

}

class PercentStripBackgroundView: UIView {

}

class RearrangeMenuBGView: UIView {
    
}

class CardBackgroundShadowedView: UIView {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
//        layer.cornerRadius = 12
//        layer.shadowOpacity = 0.2
//        layer.shadowRadius = 3
//        layer.shadowOffset = CGSize(width: 0, height: 1)
        
        layer.masksToBounds = true
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor =  UIColor.black.cgColor
        layer.shadowRadius = 12
        layer.shadowOpacity = 0.2
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
        
    }
}


class CellCardRoundView: UIView {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        layer.cornerRadius = 8
        self.clipsToBounds = true
    }
}

class CellCardRoundBorderedView: UIView {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        layer.cornerRadius = 8
        layer.borderColor = Colors.GRAY.cgColor
        layer.borderWidth = 1
        self.clipsToBounds = true
    }
}


class TopCornerRoundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        self.roundWithCorners(corners: [.layerMinXMinYCorner,.layerMaxXMinYCorner], radius: 12)
    }
}

class BottomCornerRoundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        self.roundWithCorners(corners: [.layerMinXMaxYCorner,.layerMaxXMaxYCorner], radius: 12)
    }
}

class CalenderHeaderBottomCornerRoundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        self.roundWithCorners(corners: [.layerMinXMaxYCorner,.layerMaxXMaxYCorner], radius: 8)
    }
}
