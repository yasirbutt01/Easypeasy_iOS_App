//
//  CircularView.swift
//  easypeasy
//
//  Created by Ahmad on 06/10/2020.
//

import UIKit

class CircularArrowView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        layer.masksToBounds = true
        roundedUIView(withRadius: self.frame.height/2, withBorderColor: Colors.LIGHT_GRAY, borderWidth: 1.0)
    }
}

class CircularView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
    }
}

class CircularButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
    }
}


class EventCellBackgroundView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        // add the shadow to the base view
        self.backgroundColor = UIColor.clear
        self.layer.shadowColor = Colors.GRAY.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2.0
        
        // improve performance
        //self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.frame.height/2).cgPath
        let shadowSize : CGFloat = 5.0
        
        self.layer.shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                          y: -shadowSize / 2,
                                                          width: self.frame.width + shadowSize,
                                                          height: self.frame.height + shadowSize)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        // add the border to subview
        let borderView = MyProfileSectionTitleBGView()
        borderView.backgroundColor = UIColor.white
        borderView.frame = self.bounds
        borderView.layer.cornerRadius = 10
        
        self.layer.cornerRadius = 10
        self.layer.borderColor = Colors.EVENT_CELL_BORDER.cgColor
        self.layer.borderWidth = 1.0
        
        borderView.layer.masksToBounds = true
        self.addSubview(borderView)
        self.sendSubviewToBack(borderView)
        
        //  }
    }
}

class MyProfileSectionTitleBGView: UIView {
    
}

class ShadowView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // corner radius
        self.layer.cornerRadius = 10

        // border
        self.layer.borderWidth = 1.0
        self.layer.borderColor = Colors.EVENT_CELL_BORDER.cgColor

        // shadow
        self.layer.shadowColor = Colors.GRAY.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }

}

class AnimationVideoBorderView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() -> Void {
        
        // corner radius
        self.backgroundColor = #colorLiteral(red: 0.6705882353, green: 0.537254902, blue: 0.2, alpha: 1)
    }

}


