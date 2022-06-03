//
//  ViewController.swift
//  desafio002
//
//  Created by Matheus Armando on 03/06/22.
//

import UIKit

class DesafioVC: UIViewController {

    //elementos
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 002 - criar duas telas uma que recebe um valor e uma segunda que exibe o valor digitado, seu atecessor e seu sucessor."
        dl.numberOfLines = 4
        dl.textColor = .systemRed
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        return dl
    }()
    
    lazy var descritivoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Digite abaixo um valor inteiro e eu te digo o seu antecessor e seu sucessor."
        dl.textColor = .white
        dl.numberOfLines = 4
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        return dl
    }()
    lazy var valorTextField: UITextField = {
        let vtf = UITextField()
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.placeholder = "Apenas valores inteiros"
        vtf.keyboardType = .numberPad
        vtf.borderStyle = .roundedRect
        vtf.textColor = .black
        vtf.backgroundColor = .white
        vtf.autocorrectionType = .no
        return vtf
    }()
    
    lazy var calcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Calcular", for: .normal)
        cb.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cb.setTitleColor(.white, for: .normal)
        cb.clipsToBounds = true
        cb.layer.cornerRadius =  7.5
        cb.backgroundColor = .systemBlue
        cb.addTarget(self, action: #selector(tappedCalcular), for: .touchUpInside)
        return cb
    }()
    
    //funcionalidade
    func setUpAllElements(){
        view.addSubview(desafioLabel)
        view.addSubview(descritivoLabel)
        view.addSubview(valorTextField)
        view.addSubview(calcularButton)
    }
    
    func setUpBackGroundColor(){
        view.backgroundColor = .black
    }
    
    func setUpTextFildDelegate(delegate:UITextFieldDelegate){
        valorTextField.delegate = delegate
       }
    
    
    @objc func tappedCalcular(){
        let rvc: ResultadoVC = ResultadoVC()
        let resultado = valorTextField.text ?? ""
        
        navigationController?.pushViewController(rvc, animated: true)
    
        
        let resultadoINT = Int(resultado)
        guard let resultadoINT = resultadoINT else { return }
        
        rvc.resultadoLabel.text = "\(resultadoINT-1) <-- \(resultadoINT) --> \(resultadoINT+1)"
    }
    
    
    //constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            desafioLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            desafioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            desafioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        
            descritivoLabel.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 70),
            descritivoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descritivoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            valorTextField.topAnchor.constraint(equalTo: descritivoLabel.bottomAnchor, constant: 10),
            valorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            valorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            calcularButton.topAnchor.constraint(equalTo: valorTextField.bottomAnchor, constant: 70),
            calcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        
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
        setUpTextFildDelegate(delegate: self)
    }

    
}

extension DesafioVC:UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         view.endEditing(true)
     }
}

