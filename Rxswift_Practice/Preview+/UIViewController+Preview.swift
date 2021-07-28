//
//  UIViewController+Preview.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import UIKit
import SwiftUI

extension UIViewController {
    
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        
        typealias UIViewControllerType = UIViewController
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
        
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        
         Preview(viewController: self)
    }
}
