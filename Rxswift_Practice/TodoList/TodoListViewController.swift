//
//  TodoListViewController.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import UIKit
import RxSwift
import RxCocoa

class TodoListViewController: UIViewController {
    
    let todoListView = TodoListView()
    
    let viewModel = TodoListViewModel()
    
    let disposeBag = DisposeBag()
    
    fileprivate func setupView() {
        todoListView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            
            make.left.right.bottom.equalToSuperview()
            
        }
        
        todoListView.addNewListView.doneButton.addTarget(self, action: #selector(doneButtonTapped(sender:)), for: .touchUpInside)
        
        todoListView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(todoListView)
        
        setupView()
        
        binding()
    }
    
    func binding() {
        
        viewModel.currentList.bind(to: todoListView.tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = "\(element)"
            return cell
        }.disposed(by: disposeBag)
        
        viewModel.validToSubmit
            .bind(to: todoListView.addNewListView.doneButton.rx.isEnabled).disposed(by: disposeBag)
        
        todoListView.addNewListView.textField.rx.text
            .compactMap({ $0})
            .bind(to: viewModel.textFieldText)
            .disposed(by: disposeBag)
        
        viewModel.textFieldText.bind(to: todoListView.addNewListView.textField.rx.text).disposed(by: disposeBag)
        
    }
    
    @objc func doneButtonTapped(sender: UIButton) {
        
        viewModel.addNewTask.onNext(viewModel.textFieldText.value)
        
        viewModel.textFieldText.accept("")
        
    }
    
}



