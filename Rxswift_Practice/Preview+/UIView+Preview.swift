//
//  UIView+Preview.swift
//  Rxswift_Practice
//
//  Created by Yenting Chen on 2021/7/28.
//

import UIKit
import SwiftUI

extension UIView {
    
    @available(iOS 13, *)
    
    private struct Preview: UIViewRepresentable {
        
        typealias UIViewType = UIView
        
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            
            //
        }
    
    }
    
    @available(iOS 13, *)
    
    func showPreview() -> some View {
        
        Preview(view: self)
        
    }
    
}
