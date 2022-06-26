//
//  descontoResult.swift
//  desafio009
//
//  Created by Matheus Armando on 23/06/22.
//

import UIKit

class FinalResult: UIViewController {

    // MARK: - Elementos
    lazy var titleLabel: UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = "Resultado"
        rl.font = UIFont.boldSystemFont(ofSize: 30)
        rl.textColor = .black
        rl.layer.borderWidth = 1
        rl.layer.cornerRadius = 10
        return rl
    }()
    
    lazy var resultLabel: UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = " "
        rl.font = UIFont.boldSystemFont(ofSize: 50)
        rl.backgroundColor = .black
        rl.textColor = .white
        rl.layer.borderWidth = 1
        rl.layer.cornerRadius = 10
        return rl
    }()
    
    // MARK: - Funções SetUp
    func setUpAllElements(){
        view.addSubview(resultLabel)
        view.addSubview(titleLabel)
    }
    
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Ciclos de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        
    }
    

}
