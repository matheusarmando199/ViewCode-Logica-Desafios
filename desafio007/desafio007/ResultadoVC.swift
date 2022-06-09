//
//  ResultadoVC.swift
//  desafio007
//
//  Created by Matheus Armando on 09/06/22.
//

import UIKit

class ResultadoVC: UIViewController {

    // MARK: - Elementos
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Resultado"
        tl.textColor = .systemBlue
        tl.font = UIFont.boldSystemFont(ofSize: 27)
        tl.textAlignment = .center
        tl.layer.borderWidth = .leastNormalMagnitude
        tl.numberOfLines = 8
        return tl
    }()
    lazy var dimensaoLabel: UILabel = {
        let ddl = UILabel()
        ddl.translatesAutoresizingMaskIntoConstraints = false
        ddl.text = ""
        ddl.textColor = .white
        ddl.font = UIFont.boldSystemFont(ofSize: 18)
        ddl.backgroundColor = .systemPink
        ddl.layer.borderWidth = .leastNormalMagnitude
        ddl.numberOfLines = 4
        return ddl
    }()
    lazy var areaLabel: UILabel = {
        let ddl = UILabel()
        ddl.translatesAutoresizingMaskIntoConstraints = false
        ddl.text = ""
        ddl.textColor = .white
        ddl.font = UIFont.boldSystemFont(ofSize: 18)
        ddl.backgroundColor = .systemPink
        ddl.layer.borderWidth = .leastNormalMagnitude
        ddl.numberOfLines = 4
        return ddl
    }()
    lazy var litrosLabel: UILabel = {
        let ddl = UILabel()
        ddl.translatesAutoresizingMaskIntoConstraints = false
        ddl.text = ""
        ddl.textColor = .white
        ddl.font = UIFont.boldSystemFont(ofSize: 18)
        ddl.backgroundColor = .systemPink
        ddl.layer.borderWidth = .leastNormalMagnitude
        ddl.numberOfLines = 4
        return ddl
    }()
    lazy var recalcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Recalcular", for: .normal)
        cb.setTitleColor(.white, for: .normal)
        cb.backgroundColor = .systemBlue
        cb.layer.cornerRadius = 7.5
        cb.addTarget(self, action: #selector(actionRecalcular), for: .touchUpInside)
        return cb
    }()

    // MARK: - Funções setUp
    
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    func setUpAllElements(){
        view.addSubview(titleLabel)
        view.addSubview(dimensaoLabel)
        view.addSubview(areaLabel)
        view.addSubview(litrosLabel)
        view.addSubview(recalcularButton)
    }
    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Funções Target
    
    @objc func actionRecalcular(){
        let dvc: DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            dimensaoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 150),
            dimensaoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dimensaoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            areaLabel.topAnchor.constraint(equalTo: dimensaoLabel.bottomAnchor, constant: 1),
            areaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            areaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            litrosLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 1),
            litrosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            litrosLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            recalcularButton.topAnchor.constraint(equalTo: litrosLabel.bottomAnchor, constant: 100),
            recalcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            recalcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            recalcularButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    
    // MARK: - Ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpNavigationController()
        setUpAllElements()
        setUpConstraints()
    }

}

