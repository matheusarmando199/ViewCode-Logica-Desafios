//
//  ViewController.swift
//  desafio007
//
//  Created by Matheus Armando on 09/06/22.
//

import UIKit

class DesafioVC: UIViewController {
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Desafio 007 - fazer um app em viewCode que Receba a altura e a largura de uma parede e retorne a área total em metros quadrados, su área e quantos litros de tinta serão necessários para pintar a parede, tendo em vista que a cada 2 metros quadrados serão gastos 2 litros de tinta."
        tl.textColor = .systemPink
        tl.font = UIFont.boldSystemFont(ofSize: 15)
        tl.numberOfLines = 8
        return tl
    }()
    lazy var descritivoAlturaLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Oi me informa a Altura da parede que você quer pintar."
        tl.textColor = .black
        tl.numberOfLines = 2
        tl.font = UIFont.boldSystemFont(ofSize: 12)
        return tl
    }()
    lazy var descritivoLarguraLabel: UILabel = {
        let dll = UILabel()
        dll.translatesAutoresizingMaskIntoConstraints = false
        dll.text = "agora me informa a Largura da parede que você quer pintar."
        dll.textColor = .black
        dll.numberOfLines = 2
        dll.font = UIFont.boldSystemFont(ofSize: 12)
        return dll
    }()
    lazy var larguraTextFied: UITextField = {
        let ltf = UITextField()
        ltf.translatesAutoresizingMaskIntoConstraints = false
        ltf.placeholder = " valor da Largura"
        ltf.textColor = .white
        ltf.backgroundColor = .systemBlue
        ltf.keyboardType = .numberPad
        ltf.layer.cornerRadius = 7.5
        ltf.layer.borderWidth = .leastNormalMagnitude
        return ltf
    }()
    lazy var alturaTextField: UITextField = {
        let atf = UITextField()
        atf.translatesAutoresizingMaskIntoConstraints = false
        atf.placeholder = " valor da Altura"
        atf.textColor = .white
        atf.backgroundColor = .systemBlue
        atf.keyboardType = .numberPad
        atf.layer.cornerRadius = 6
        atf.layer.borderWidth = .leastNormalMagnitude
        return atf
    }()
    lazy var calcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Calcular", for: .normal)
        cb.setTitleColor(.white, for: .normal)
        cb.backgroundColor = .systemPink
        cb.layer.cornerRadius = 7.5
        cb.addTarget(self, action: #selector(actionCalcular), for: .touchUpInside)
        return cb
    }()
    // MARK: - funções SetUp
    
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    func setUpAllElements(){
        view.addSubview(titleLabel)
        view.addSubview(descritivoAlturaLabel)
        view.addSubview(alturaTextField)
        view.addSubview(descritivoLarguraLabel)
        view.addSubview(larguraTextFied)
        view.addSubview(calcularButton)
    }
    func setUpTextFieldDelegates(delegate: UITextFieldDelegate){
        alturaTextField.delegate = delegate
        larguraTextFied.delegate = delegate
    }
    func validaTextField(ativo: Bool){
        let altString = alturaTextField.text ?? ""
        let largString = larguraTextFied.text ?? ""
        
        if altString.isEmpty || largString.isEmpty{
            let alert: UIAlertController = UIAlertController(title: "Atenção", message: "um dos campos de valor está vazio, revise os dados informados.", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "Revisar Dados", style: .cancel)
            
            alert.addAction(action)
            present(alert, animated: true)
        }else{
            
        }
    }
    // MARK: - Funções Tag
    
    @objc func actionCalcular(){
        validaTextField(ativo: true)
        let rvc: ResultadoVC = ResultadoVC()
        navigationController?.pushViewController(rvc, animated: true)
        
        let altString = alturaTextField.text ?? ""
        let largString = larguraTextFied.text ?? ""
        
        let altDouble = Double(altString)
        let largDouble = Double(largString)
        
        guard let altDouble = altDouble else { return }
        guard let largDouble = largDouble else { return }
        
        let paredeArea = altDouble * largDouble
        
        rvc.dimensaoLabel.text = "A dimensão da sua parede é de \(altDouble) X \(largDouble)"
        rvc.areaLabel.text = "A Área da sua parede é igual a \(paredeArea)m²"
        rvc.litrosLabel.text = "e você vai gartar mais ou menos \(paredeArea / 2)L de tinta para pintar essa parede"
    }
    
    // MARK: - Constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            descritivoAlturaLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            descritivoAlturaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descritivoAlturaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            alturaTextField.topAnchor.constraint(equalTo: descritivoAlturaLabel.bottomAnchor, constant: 10),
            alturaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            alturaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            alturaTextField.heightAnchor.constraint(equalToConstant: 35),
            
            descritivoLarguraLabel.topAnchor.constraint(equalTo: alturaTextField.bottomAnchor, constant: 30),
            descritivoLarguraLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            descritivoLarguraLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            larguraTextFied.topAnchor.constraint(equalTo: descritivoLarguraLabel.bottomAnchor, constant: 10),
            larguraTextFied.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            larguraTextFied.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            larguraTextFied.heightAnchor.constraint(equalToConstant: 35),
        
            calcularButton.topAnchor.constraint(equalTo: larguraTextFied.bottomAnchor, constant: 30),
            calcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    // MARK: - Ciclos de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        setUpTextFieldDelegates(delegate: self)
    }
}

extension DesafioVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
