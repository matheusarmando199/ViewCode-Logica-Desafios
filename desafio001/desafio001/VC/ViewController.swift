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
    }


}

