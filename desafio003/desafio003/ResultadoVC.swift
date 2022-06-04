//
//  ResultadoVC.swift
//  desafio003
//
//  Created by Matheus Armando on 04/06/22.
//

import UIKit

class ResultadoVC: UIViewController {

        // MARK: - Elementos
        lazy var tituloLabel: UILabel = {
            let dl = UILabel()
            dl.translatesAutoresizingMaskIntoConstraints = false
            dl.text = "Resultado"
            dl.textColor = .white
            dl.font = UIFont.boldSystemFont(ofSize: 25)
            dl.textAlignment = .center
            return dl
        }()
        
        lazy var resultadoLabel: UILabel = {
            let dl = UILabel()
            dl.translatesAutoresizingMaskIntoConstraints = false
            dl.text = "20"
            dl.textColor = .white
            dl.backgroundColor = .systemBlue
            dl.font = UIFont.boldSystemFont(ofSize: 45)
            dl.textAlignment = .center
            return dl
        }()
        
        lazy var recalcularButton: UIButton = {
            let cb = UIButton()
            cb.translatesAutoresizingMaskIntoConstraints = false
            cb.setTitle("Recalcular", for: .normal)
            cb.setTitleColor(.white, for: .normal)
            cb.backgroundColor = .systemBlue
            cb.addTarget(self, action: #selector(actionCalcular), for: .touchUpInside)
            return cb
        }()
        
        
        
        // MARK: - Funcionalidades
        
        func setUpBackgroundColor(){
            view.backgroundColor = .black
        }
        
        @objc func actionCalcular (){
            let dvc: DesafioVC = DesafioVC()
            navigationController?.pushViewController(dvc, animated: true)
        }
        func setUpAllElements(){
            view.addSubview(tituloLabel)
            view.addSubview(resultadoLabel)
            view.addSubview(recalcularButton)
        }

        
        
        // MARK: - Constraints
        
        func setUpConstraints(){
            NSLayoutConstraint.activate([
                
                tituloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
                tituloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                tituloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                
                
                resultadoLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 50),
                resultadoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                resultadoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                resultadoLabel.heightAnchor.constraint(equalToConstant: 200),
                
                recalcularButton.topAnchor.constraint(equalTo: (resultadoLabel).bottomAnchor, constant: 80),
                recalcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                recalcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
                
                
                
            ])
        }
        
        
    // MARK: - Ciclos De Vida
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
    }

}


