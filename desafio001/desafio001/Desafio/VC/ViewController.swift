//
//  ViewController.swift
//  desafio001
//
//  Created by Matheus Armando on 25/05/22.
//

import UIKit

class ViewController: UIViewController {
    
     var Ex001View: ex001View?
    
    
    override func loadView() {
        Ex001View = ex001View()
        view = Ex001View
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Ex001View?.delegate(delegate: self)
        Ex001View?.configTextFieldDelegate(delegate: self)
    }
}

extension ViewController: ex001ViewProtocol {
    func actionCalcularButton() {
        Ex001View?.calcularButtonResult()
    }
}



extension ViewController: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
