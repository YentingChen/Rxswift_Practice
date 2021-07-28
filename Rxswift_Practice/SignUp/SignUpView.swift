//
//  SignUpView.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import UIKit

class SignUpView: UIView {
    
    lazy var verticalStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [
            
            accountTextField,
            
            passwordTextField,
            
            submitButton
            
        ])
        
        stackView.axis = .vertical
        
        stackView.distribution = .equalSpacing
        
        stackView.spacing = 20
        
        return stackView
    }()
    
    lazy var accountTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .red
        
        button.setTitle("Submit", for: .normal)
        
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        self.backgroundColor = .green
        
        self.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { (make) in
            
            make.centerX.centerY.equalToSuperview()
            
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
    }
    
}

#if DEBUG
import SwiftUI
@available(iOS 13, *)

struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignUpView().showPreview()
    }
}
#endif
