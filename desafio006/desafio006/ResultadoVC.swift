//
//  ResultadoVC.swift
//  desafio006
//
//  Created by Matheus Armando on 07/06/22.
//

import UIKit

class ResultadoVC: UIViewController {

    // MARK: - Elementos
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Resultado"
        tl.font = UIFont.boldSystemFont(ofSize: 20)
        tl.textColor = .black
        tl.textAlignment = .center
        return tl
    }()
    lazy var resultadoLabel: UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = "20"
        rl.textColor = .white
        rl.backgroundColor = .systemPink
        rl.font = UIFont.boldSystemFont(ofSize: 27)
        rl.textAlignment = .center
        return rl
    }()
    lazy var recalcularButton: UIButton = {
        let rb = UIButton()
        rb.translatesAutoresizingMaskIntoConstraints = false
        rb.setTitle("Recalcular", for: .normal)
        rb.setTitleColor(.white, for: .normal)
        rb.backgroundColor = .systemBlue
        rb.layer.cornerRadius = 10
        rb.layer.borderWidth = .leastNormalMagnitude
        rb.layer.cornerCurve = .circular
        rb.addTarget(self, action: #selector(actionRecalcularButton), for: .touchUpInside)
        return rb
    }()
    // MARK: - Funções SetUp
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    func setUpNavigationController(){
        navigationController?.setToolbarHidden(true, animated: false)
    }
    func setUpAllElements(){
        view.addSubview(titleLabel)
        view.addSubview(resultadoLabel)
        view.addSubview(recalcularButton)
    }
    // MARK: - Funções Target
    @objc func actionRecalcularButton(){
        let dvc: DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            resultadoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            resultadoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultadoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultadoLabel.heightAnchor.constraint(equalToConstant: 150),
            
            recalcularButton.topAnchor.constraint(equalTo: resultadoLabel.bottomAnchor, constant: 50),
            recalcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            recalcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            recalcularButton.heightAnchor.constraint(equalToConstant: 35)
        
        ])
    }
    
    // MARK: - Ciclos De Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpNavigationController()
        setUpAllElements()
        setUpConstraints()
    }
    

}
