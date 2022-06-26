//
//  descontoVC.swift
//  desafio009
//
//  Created by Matheus Armando on 23/06/22.
//

import UIKit

class questVC: UIViewController {
    
    // MARK: - Elementos
    
    lazy var titleViewLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = " "
        dl.font = UIFont.boldSystemFont(ofSize: 40)
        dl.numberOfLines = 2
        dl.textColor = .white
        dl.textAlignment = .center
        return dl
    }()
    
    lazy var salarioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = " "
        dl.font = UIFont.boldSystemFont(ofSize: 20)
        dl.numberOfLines = 2
        dl.textColor = .white
        return dl
    }()
    
    lazy var salarioTextField: UITextField = {
        let stf = UITextField()
        stf.translatesAutoresizingMaskIntoConstraints = false
        stf.layer.cornerRadius = 10
        stf.layer.borderWidth = 1
        stf.backgroundColor = .white
        stf.placeholder = " Digite o salário"
        stf.textColor = .black
        stf.keyboardType = .numberPad
        return stf
    }()
    
    lazy var porcentagemLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.font = UIFont.boldSystemFont(ofSize: 20)
        dl.numberOfLines = 2
        dl.textColor = .white
        return dl
    }()
    
    lazy var porcentagemTextField: UITextField = {
        let stf = UITextField()
        stf.translatesAutoresizingMaskIntoConstraints = false
        stf.layer.cornerRadius = 10
        stf.layer.borderWidth = 1
        stf.backgroundColor = .white
        stf.textColor = .black
        stf.keyboardType = .numberPad
        return stf
    }()
    lazy var resultButton: UIButton = {
        let db = UIButton()
        db.translatesAutoresizingMaskIntoConstraints = false
        db.setTitle("Calcular", for: .normal)
        db.layer.cornerRadius = 10
        db.titleLabel?.textAlignment = .center
        db.setTitleColor(.white, for: .normal)
        db.backgroundColor = .black
        db.addTarget(self, action: #selector(callViewResultAction), for: .touchUpInside)
        return db
    }()
    
    lazy var backButton: UIButton = {
        let db = UIButton()
        db.translatesAutoresizingMaskIntoConstraints = false
        db.setTitle("  <  ", for: .normal)
        db.layer.cornerRadius = 10
        db.titleLabel?.textAlignment = .center
        db.setTitleColor(.white, for: .normal)
        db.backgroundColor = .black
        db.addTarget(self, action: #selector(callViewHomeAction), for: .touchUpInside)
        return db
    }()
    // MARK: - Funções setUp
    
    func setUpAllEllements(){
        view.addSubview(titleViewLabel)
        view.addSubview(salarioLabel)
        view.addSubview(salarioTextField)
        view.addSubview(porcentagemLabel)
        view.addSubview(porcentagemTextField)
        view.addSubview(resultButton)
        view.addSubview(backButton)
    }
    
    func setUpTextFieldDelegate(delegate: UITextFieldDelegate){
        self.salarioTextField.delegate = delegate
        self.porcentagemTextField.delegate = delegate
    }
    
    func setUpButton(){
        let salario = salarioTextField.text ?? ""
        let porcentagem = porcentagemTextField.text ?? ""
        
        
        
        if salario.isEmpty || porcentagem.isEmpty{
               let alert: UIAlertController = UIAlertController(title: "Atenção", message: "um dos campos está vazio revise os dados e tente novamente", preferredStyle: .alert)
               let action: UIAlertAction = UIAlertAction(title: "Revisar Dados", style: .cancel)
                   alert.addAction(action)
               present(alert, animated: true)
               }else{
                   
               }
        
        
    }
    
    // MARK: - Funções target
    
    @objc func callViewResultAction(){
        setUpButton()
        let fr: FinalResult = FinalResult()
        
        let valor = salarioTextField.text ?? ""
        let valorFloat = Float(valor)
        guard let valorFloat = valorFloat else { return }
        
        let porcentagem = porcentagemTextField.text ?? ""
        let porcentagemFloat = Float(porcentagem)
        guard let porcentagemFloat = porcentagemFloat else { return }
        
        if titleViewLabel.text ==  "$ Desconto $"{
            fr.resultLabel.text = "R$ \(valorFloat - ((porcentagemFloat / 100.0) * valorFloat))"
        }else if titleViewLabel.text ==  "$ Aumento $"{
            fr.resultLabel.text = "R$ \(valorFloat + ((porcentagemFloat / 100.0) * valorFloat))"
        }
 
        navigationController?.present(fr, animated: true)
    }
    @objc func callViewHomeAction(){
        let home: homeVC = homeVC()
        navigationController?.pushViewController(home, animated: true)
    }
    
    
    
    // MARK: - constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleViewLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            backButton.trailingAnchor.constraint(equalTo: titleViewLabel.leadingAnchor, constant: 5),
            
            salarioLabel.topAnchor.constraint(equalTo: titleViewLabel.bottomAnchor, constant: 50),
            salarioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            salarioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            salarioTextField.topAnchor.constraint(equalTo: salarioLabel.bottomAnchor, constant: 10),
            salarioTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            salarioTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            salarioTextField.heightAnchor.constraint(equalToConstant: 35),
            
            porcentagemLabel.topAnchor.constraint(equalTo: salarioTextField.bottomAnchor, constant: 30),
            porcentagemLabel.leadingAnchor.constraint(equalTo: salarioLabel.leadingAnchor),
            porcentagemLabel.trailingAnchor.constraint(equalTo: salarioLabel.trailingAnchor),
            
            porcentagemTextField.topAnchor.constraint(equalTo: porcentagemLabel.bottomAnchor, constant: 10),
            porcentagemTextField.trailingAnchor.constraint(equalTo: salarioTextField.trailingAnchor),
            porcentagemTextField.leadingAnchor.constraint(equalTo: salarioTextField.leadingAnchor),
            porcentagemTextField.heightAnchor.constraint(equalToConstant: 35),
            
            resultButton.topAnchor.constraint(equalTo: porcentagemTextField.bottomAnchor, constant: 30),
            resultButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            resultButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35)
        ])
    }
    // MARK: - Ciclos de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAllEllements()
        setUpConstraints()
        setUpTextFieldDelegate(delegate: self)
    }
    
}

extension questVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
