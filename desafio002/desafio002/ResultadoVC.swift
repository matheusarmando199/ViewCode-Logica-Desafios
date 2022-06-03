//
//  ResultadoVC.swift
//  desafio002
//
//  Created by Matheus Armando on 03/06/22.
//

import UIKit

class ResultadoVC: UIViewController {

    //elementos
    lazy var titleLabel:UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = "Resultado"
        rl.font = UIFont.boldSystemFont(ofSize: 25)
        rl.textColor = .white
        rl.textAlignment = .center
        rl.layer.cornerRadius = 7.5
        return rl
    }()
    
    
    lazy var resultadoLabel:UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = " "
        rl.font = UIFont.boldSystemFont(ofSize: 27)
        rl.backgroundColor = .systemBlue
        rl.textColor = .white
        rl.textAlignment = .center
        rl.layer.cornerRadius = 7.5
        return rl
    }()
    
    lazy var recalcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Recalcular", for: .normal)
        cb.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cb.setTitleColor(.white, for: .normal)
        cb.clipsToBounds = true
        cb.layer.cornerRadius =  7.5
        cb.backgroundColor = .systemBlue
        cb.addTarget(self, action: #selector(tappedRecalcular), for: .touchUpInside)
        return cb
    }()
    
    //funcionalidades
    
    func setUpAllElements(){
        view.addSubview(resultadoLabel)
        view.addSubview(recalcularButton)
        view.addSubview(titleLabel)
    }
    
    func setUpBackGroundColor(){
        view.backgroundColor = .black
    }
    
    @objc func tappedRecalcular(){
        let dvc: DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    //constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            resultadoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            resultadoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultadoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            resultadoLabel.heightAnchor.constraint(equalToConstant: 200),
            
            recalcularButton.topAnchor.constraint(equalTo: resultadoLabel.bottomAnchor, constant: 40),
            recalcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            recalcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            recalcularButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    //ciclos de vida
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackGroundColor()
        setUpAllElements()
        setUpConstraints()
    }


}
