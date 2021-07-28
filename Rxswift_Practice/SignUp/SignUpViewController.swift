//
//  SignUpViewController.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    let signUpView = SignUpView()
    
    let disposeBag = DisposeBag()
    
    let viewModel = SignUPViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        binding()
    }
    
    private func binding() {
        
        signUpView.accountTextField.rx.text
            .compactMap({ $0 })
            .bind(to: viewModel.accountTextPublishSubject)
            .disposed(by: disposeBag)
        
        signUpView.passwordTextField.rx.text
            .compactMap({ $0 })
            .bind(to: viewModel.passwordTextPublishSubject)
            .disposed(by: disposeBag)
        
        viewModel.validToSubmit
            .bind(to: signUpView.submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.validToSubmit
            .map({
            $0 ? 1 : 0.1 })
            .bind(to: signUpView.submitButton.rx.alpha)
            .disposed(by: disposeBag)
        
    }
    
    
    @objc func submitButtonTapped(sender: UIButton) {
        print("sbumit")
    }
    

    fileprivate func setupView() {
        self.view.addSubview(signUpView)
        
        signUpView.snp.makeConstraints { (make) in
            
            make.edges.equalToSuperview()
            
        }
        
       
        signUpView.submitButton.addTarget(self, action: #selector(submitButtonTapped(sender:)), for: .touchUpInside)
    }
    
}
