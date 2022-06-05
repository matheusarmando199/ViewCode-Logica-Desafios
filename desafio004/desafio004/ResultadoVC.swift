//
//  ResultadoVC.swift
//  desafio004
//
//  Created by Matheus Armando on 04/06/22.
//

import UIKit

class ResultadoVC: UIViewController {

    // MARK: - Elementos
    lazy var titleLabel:UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Resultado"
        tl.textAlignment = .center
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 25)
        return tl
    }()
    lazy var resultLabel:UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = "teste"
        rl.textAlignment = .center
        rl.textColor = .white
        rl.backgroundColor = .systemBlue
        rl.font = UIFont.boldSystemFont(ofSize: 10)
        return rl
    }()
    lazy var recalcularButton: UIButton = {
        let rb = UIButton()
        rb.translatesAutoresizingMaskIntoConstraints = false
        rb.setTitle("Recalcular", for: .normal)
        rb.setTitleColor(.white, for: .normal)
        rb.backgroundColor = .systemPink
        rb.layer.cornerRadius = 7.7
        rb.addTarget(self, action: #selector(actionRecalcular), for: .touchUpInside)
        return rb
    }()
    
    
    // MARK: - Funcionalidades
    func setUpAllElements(){
        view.addSubview(titleLabel)
        view.addSubview(resultLabel)
        view.addSubview(recalcularButton)
    }
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    @objc func actionRecalcular(){
        let dvc: DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            
            recalcularButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
            recalcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            recalcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            recalcularButton.heightAnchor.constraint(equalToConstant: 35)
        
        ])
    }
    
    
    // MARK: - Ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
    }
    



}
