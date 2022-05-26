//
//  ResultadoVC.swift
//  desafio001
//
//  Created by Matheus Armando on 26/05/22.
//

import UIKit

class ResultadoVC: UIViewController {
    
    lazy var resultadoLabel: UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = "Resultado"
        rl.font =  UIFont.boldSystemFont(ofSize: 30)
        rl.textColor = .systemBlue
        rl.textAlignment = .center
        return rl
    }()
    
    var Ex001View: ex001View?
   
   
   override func loadView() {
       Ex001View = ex001View()
       view = Ex001View
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        superViewResult()
        setUpConstraints()
        Ex001View?.calcularButtonResult()
    }
    
    
    func superViewResult(){
        view.addSubview(resultadoLabel)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            resultadoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultadoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }
    


}
