//
//  MyButton.swift
//  UIPracticeEasyPeasy
//
//  Created by Ahmad on 01/10/2020.
//

import UIKit

@IBDesignable class CustomButtonView : UIView {
    
    @IBOutlet weak var mainView: RoundWithShadowView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lineIcon: UIImageView!
    
    private var view: UIView!
    
    var buttonTapped:(()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .clear
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setupView(color: ButtonColor = .pink, title: String = "abc", font: UIFont = Fonts.HELVETICA_BOLD_14!, titleColor: UIColor = Colors.WHITE, cornerRadius: CGFloat = 12.0) {
        if view.frame.width < 130 {
            lineIcon.image = Icons.SMALL_BUTTON_LINE
        }else{
            lineIcon.image = Icons.LARGE_BUTTON_LINE
        }
        switch color {
        case .green:
            self.mainView.topColor = ButtonColors.GREEN_TOP!
            self.mainView.bottomColor = ButtonColors.GREEN!
//            self.mainView.backgroundColor = ButtonColors.GREEN_BG
//            self.button.backgroundColor = ButtonColors.GREEN
            self.bottomView.backgroundColor = ButtonColors.GREEN_BG
            self.button.backgroundColor = .clear
        case .pink:
            self.mainView.topColor = ButtonColors.PINK!
            self.mainView.bottomColor = ButtonColors.PINK_BOTTOM!
//            self.mainView.backgroundColor = ButtonColors.PINK_BG
//            self.button.backgroundColor = ButtonColors.PINK
            self.bottomView.backgroundColor = ButtonColors.PINK_BG
            self.button.backgroundColor = .clear
        case .gray:
            self.mainView.topColor = ButtonColors.LIGHT_GRAY_BG!
            self.mainView.bottomColor = ButtonColors.LIGHT_GRAY_BG!
            self.bottomView.backgroundColor = ButtonColors.LIGHT_GRAY_BG
            self.button.backgroundColor = .clear
        default:
            self.mainView.topColor = ButtonColors.WHITE!
            self.mainView.bottomColor = ButtonColors.LIGHT_GRAY!
//            self.mainView.backgroundColor = ButtonColors.DARAK_GREY_BG
//            self.button.backgroundColor = ButtonColors.LIGHT_GRAY
            self.bottomView.backgroundColor = ButtonColors.LIGHT_GRAY_BG
            self.button.backgroundColor = .clear
        }
        button.setTitleColor(titleColor, for: .normal)
        button.setTitle(title, for: UIControl.State.normal)
        button.titleLabel?.font = font
        layer.cornerRadius = cornerRadius
        bottomView.layer.cornerRadius = cornerRadius
//        mainView.layer.cornerRadius = cornerRadius
        mainView.cornerRadius = cornerRadius
        clipsToBounds = true
        button.roundWithCorners(corners:[.layerMinXMaxYCorner,.layerMaxXMaxYCorner], radius: 12.0)
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        buttonTapped?()
    }
}
