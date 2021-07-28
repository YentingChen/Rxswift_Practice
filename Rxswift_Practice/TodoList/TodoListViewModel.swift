//
//  TodoListViewModel.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import RxSwift
import RxCocoa

class TodoListViewModel {

    let currentList = BehaviorRelay<[String]>(value: ["1", "2"])
    
    var textFieldText = BehaviorRelay<String>(value: "")
    
    var validToSubmit: Observable<Bool> {
        
        return textFieldText.map({ !$0.isEmpty}).startWith(false)
        
    }
    
    var addNewTask = PublishSubject<String>()
    
    let disposeBag = DisposeBag()
    
    init() {
        
        addNewTask.subscribe { [unowned self] (item) in
            
            self.currentList.accept(currentList.value + [item])
            
        }.disposed(by: disposeBag)
        
    }
    
}
