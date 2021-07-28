//
//  SignUPViewModel.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import RxSwift

class SignUPViewModel {
    
    let accountTextPublishSubject = PublishSubject<String>()
    
    let passwordTextPublishSubject = PublishSubject<String>()
    
    var validToSubmit: Observable<Bool> {
        
        return Observable.combineLatest(accountTextPublishSubject.asObserver(), passwordTextPublishSubject.asObserver())
            .map { account, password in
                
                return !account.isEmpty && !password.isEmpty
                
            }.startWith(false)
        
    }
    
}
