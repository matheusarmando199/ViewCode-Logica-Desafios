//
//  ResultadoVC.swift
//  desafio008
//
//  Created by Matheus Armando on 10/06/22.
//

import UIKit

class Resultado5VC: UIViewController {
    // MARK: - Elementos
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Resultado"
        tl.textColor = .systemBlue
        tl.textAlignment = .center
        tl.font = UIFont.boldSystemFont(ofSize: 25)
        tl.numberOfLines = 5
        return tl
    }()
    lazy var resultadoLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "25"
        tl.textColor = .white
        tl.font = UIFont.boldSystemFont(ofSize: 27)
        tl.backgroundColor = .systemPink
        tl.textAlignment = .center
        return tl
    }()
    lazy var recalcularButton: UIButton = {
        let rb = UIButton()
        rb.translatesAutoresizingMaskIntoConstraints = false
        rb.layer.cornerRadius = 8
        rb.layer.borderWidth = 1
        rb.layer.borderColor = UIColor.black.cgColor
        rb.setTitleColor(.white, for: .normal)
        rb.setTitle("Recalcular", for: .normal)
        rb.backgroundColor = .systemBlue
        rb.addTarget(self, action: #selector(actionRecalcular), for: .touchUpInside)
        return rb
    }()
    
    
    // MARK: - Funções SetUp
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setUpAllElements(){
        view.addSubview(titleLabel)
        view.addSubview(resultadoLabel)
        view.addSubview(recalcularButton)
    }
    // MARK: - Funções Target
    @objc func actionRecalcular(){
        let dvc: DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
    // MARK: - Constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            resultadoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 120),
            resultadoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultadoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultadoLabel.heightAnchor.constraint(equalToConstant: 200),
            
            recalcularButton.topAnchor.constraint(equalTo: resultadoLabel.bottomAnchor, constant: 80),
            recalcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            recalcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpNavigationController()
        setUpAllElements()
        setUpConstraints()

    }




}
