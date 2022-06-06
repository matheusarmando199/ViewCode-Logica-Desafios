//
//  ViewController.swift
//  desafio005
//
//  Created by Matheus Armando on 05/06/22.
//

import UIKit

class DesafioVC: UIViewController {

    // MARK: - Elementos
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 005 - Crie um app em ViewCode que peça um número e retorne a tabuada do numéro declarado, o retorno deve ser uma UITableView"
        dl.font = UIFont.boldSystemFont(ofSize: 17)
        dl.textColor = .systemPink
        dl.numberOfLines = 5
        return dl
    }()
    lazy var descritivoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Oi me informa um número e eu vou te mostrar toda a tabuada dele até 10"
        dl.textColor = .black
        dl.font = UIFont.boldSystemFont(ofSize: 12)
        dl.numberOfLines = 4
        return dl
    }()
    lazy var valorTextField: UITextField = {
        let vtf = UITextField()
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.textColor = .white
        vtf.placeholder = "  Apenas números inteiros"
        vtf.backgroundColor = .systemBlue
        vtf.borderStyle = .roundedRect
        vtf.keyboardType = .numberPad
        vtf.layer.borderWidth = .leastNormalMagnitude
        return vtf
    }()
    lazy var buttonCalcular: UIButton = {
        let bc = UIButton()
        bc.translatesAutoresizingMaskIntoConstraints = false
        bc.setTitle("Calcular", for: .normal)
        bc.setTitleColor(.white, for: .normal)
        bc.backgroundColor = .systemPink
        bc.layer.cornerRadius = 8
        bc.layer.borderWidth = .leastNormalMagnitude
        bc.addTarget(self, action: #selector(actionCacularButton), for: .touchUpInside)
        return bc
    }()
    
    // MARK: - Funcionalidades
    
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @objc func actionCacularButton(){
        let rvc: ResultadoVC = ResultadoVC()
        navigationController?.pushViewController(rvc, animated: true)
        let valor = valorTextField.text ?? ""
        
        let valorint = Int(valor)
        guard let valorint = valorint else { return }
        
        for i in 1...10{
            rvc.dataCells.append(Data(resultado: "\(valor)  X  \(i)  =  \(valorint * i)"))
        }
        
    }
    func setUpAllElements(){
        view.addSubview(desafioLabel)
        view.addSubview(descritivoLabel)
        view.addSubview(valorTextField)
        view.addSubview(buttonCalcular)
    }
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        valorTextField.delegate = delegate
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            desafioLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            desafioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            desafioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            descritivoLabel.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 100),
            descritivoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            descritivoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            valorTextField.topAnchor.constraint(equalTo: descritivoLabel.bottomAnchor, constant: 10),
            valorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            valorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            valorTextField.widthAnchor.constraint(equalToConstant: 35),
            
            buttonCalcular.topAnchor.constraint(equalTo: valorTextField.bottomAnchor, constant: 20),
            buttonCalcular.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonCalcular.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            buttonCalcular.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    
    
    // MARK: - Ciclos de vida
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavigationController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        configTextFieldDelegate(delegate: self)
    }


}

extension DesafioVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

