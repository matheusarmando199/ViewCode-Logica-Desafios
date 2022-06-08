//
//  ViewController.swift
//  desafio006
//
//  Created by Matheus Armando on 07/06/22.
//

import UIKit

class DesafioVC: UIViewController {

    // MARK: - Elementos
    
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 006 - Criar um app em ViewCode que receba um valor em reais e apresnte o mesmo convertido para dolar."
        dl.textColor = .systemPink
        dl.font = UIFont.boldSystemFont(ofSize: 20)
        dl.numberOfLines = 4
        return dl
    }()
    lazy var descritivoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Oi me informa um valor em Reais que eu te digo quanto ele vale em dolar hoje 08/06/2022"
        dl.textColor = .black
        dl.font = UIFont.boldSystemFont(ofSize: 17)
        dl.numberOfLines = 4
        return dl
    }()
    lazy var valorTextField: UITextField = {
        let vtf = UITextField()
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.textColor = .white
        vtf.backgroundColor = .systemBlue
        vtf.placeholder = " Valor em R$"
        vtf.layer.cornerRadius = 7.5
        vtf.layer.borderWidth = .leastNormalMagnitude
        vtf.keyboardType = .numberPad
        return vtf
    }()
    lazy var converterButton:UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Converter", for: .normal)
        cb.setTitleColor(.white, for: .normal)
        cb.backgroundColor = .systemPink
        cb.layer.borderWidth = .leastNormalMagnitude
        cb.layer.cornerRadius = 7.5
        cb.addTarget(self, action: #selector(actionConvert), for: .touchUpInside)
        return cb
    }()
    
    // MARK: - Funções SetUp

    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setUpAllEllements(){
        view.addSubview(desafioLabel)
        view.addSubview(descritivoLabel)
        view.addSubview(valorTextField)
        view.addSubview(converterButton)
    }
    func setUpValorDelegate(delegate: UITextFieldDelegate){
        valorTextField.delegate = delegate
    }
    
    // MARK: - Funções Target
    
    @objc func actionConvert(){
        let rvc: ResultadoVC = ResultadoVC()
        navigationController?.pushViewController(rvc, animated: true)
        
        let vals: String = valorTextField.text ?? ""
        let valDouble = Double(vals)
        guard let valDouble = valDouble else { return }
        let resultUgly = valDouble/4.87
        let resultadoRedondo = (round(1000 * resultUgly) / 1000)
        
        
        rvc.resultadoLabel.text = "US$ \(resultadoRedondo)"
    }
    
    // MARK: - Constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            desafioLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            desafioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            desafioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            descritivoLabel.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 90),
            descritivoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descritivoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            valorTextField.topAnchor.constraint(equalTo: descritivoLabel.bottomAnchor, constant: 10),
            valorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            valorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            valorTextField.heightAnchor.constraint(equalToConstant: 35),
            
            converterButton.topAnchor.constraint(equalTo: valorTextField.bottomAnchor, constant: 50),
            converterButton.leadingAnchor.constraint(equalTo: valorTextField.leadingAnchor),
            converterButton.trailingAnchor.constraint(equalTo: valorTextField.trailingAnchor)
        
        ])
    }
    
    // MARK: - Ciclos De Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpNavigationController()
        setUpAllEllements()
        setUpConstraints()
        setUpValorDelegate(delegate: self)
    }


}

extension DesafioVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
