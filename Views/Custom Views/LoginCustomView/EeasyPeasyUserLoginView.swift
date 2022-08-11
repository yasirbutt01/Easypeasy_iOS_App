//
//  EeasyPeasyUserLoginView.swift
//  easypeasy
//
//  Created by Akhtar on 10/29/20.
//

import UIKit

class EeasyPeasyUserLoginView: UIView {

    
    private var view: UIView!
    
    @IBOutlet weak var signInButton: CustomButtonView!
    @IBOutlet weak var signUpButton: CustomButtonView!
    @IBOutlet weak var backGroundButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    var backGroundButtonTapped:(()->())?
    
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
        addSubview(view)
        configureView()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func configureView() -> Void {
        popUpView.layer.cornerRadius = 6.0
        signInButton.setupView(color: .green, title: "Sign In")
        signUpButton.setupView(color: .pink, title: "Sign Up")
        signInButton.buttonTapped = {
            UserDefaults.standard.setValue(true, forKey: UserDefaultKeys.isSignInTapped)
            ModeSelection.instance.signupMode()
        }
        signUpButton.buttonTapped = {
            ModeSelection.instance.signupMode()
        }
    }
    
    @IBAction func backGroundButtonTapped(_ sender: Any) {
        self.backGroundButtonTapped?()
    }
    

}
