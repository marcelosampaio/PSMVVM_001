//
//  BindingTextField.swift
//  PSMVVM_001
//
//  Created by Marcelo Sampaio on 23/01/23.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChanged: (String) -> Void = { _ in
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        commomInit()
    }
    
    private func commomInit() {
        addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
    }
    
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            textChanged(text)
        }
    }
}
 
