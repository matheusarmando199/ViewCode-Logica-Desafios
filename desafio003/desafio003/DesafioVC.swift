//
//  ViewController.swift
//  desafio003
//
//  Created by Matheus Armando on 04/06/22.
//

import UIKit

class DesafioVC: UIViewController {
    // MARK: - Elementos
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 003 - Crie uma tela que receba 4 valores inteiros e uma segunda que mostre a Média Aritmética desses valores"
        dl.textColor = .systemPink
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        dl.numberOfLines = 4
        return dl
    }()
    
    lazy var descritivoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Informe abaixo 4 valores a baixo e eu te digo a média aritimética entre eles."
        dl.textColor = .white
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        dl.numberOfLines = 4
        return dl
    }()
    
    lazy var n1TextFild: UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Digite apenas números inteiros"
        ntf.textColor = .black
        ntf.backgroundColor = .white
        ntf.keyboardType = .numberPad
        ntf.borderStyle = .roundedRect
        ntf.autocorrectionType = .no
        return ntf
    }()
    lazy var n2TextFild: UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Digite apenas números inteiros"
        ntf.textColor = .black
        ntf.backgroundColor = .white
        ntf.keyboardType = .numberPad
        ntf.borderStyle = .roundedRect
        ntf.autocorrectionType = .no
        return ntf
    }()
    lazy var n3TextFild: UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Digite apenas números inteiros"
        ntf.textColor = .black
        ntf.backgroundColor = .white
        ntf.keyboardType = .numberPad
        ntf.borderStyle = .roundedRect
        ntf.autocorrectionType = .no
        return ntf
    }()
    lazy var n4TextFild: UITextField = {
        let ntf = UITextField()
        ntf.translatesAutoresizingMaskIntoConstraints = false
        ntf.placeholder = "Digite apenas números inteiros"
        ntf.textColor = .black
        ntf.backgroundColor = .white
        ntf.keyboardType = .numberPad
        ntf.borderStyle = .roundedRect
        ntf.autocorrectionType = .no
        return ntf
    }()
    lazy var calcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Calcular", for: .normal)
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
        let rvc: ResultadoVC = ResultadoVC()
        navigationController?.pushViewController(rvc, animated: true)
        
        let n1String = n1TextFild.text ?? ""
        let n2String = n2TextFild.text ?? ""
        let n3String = n3TextFild.text ?? ""
        let n4String = n4TextFild.text ?? ""
        
        let n1Int = Int(n1String)
        let n2Int = Int(n2String)
        let n3Int = Int(n3String)
        let n4Int = Int(n4String)
        
        guard let n1Int = n1Int else { return }
        guard let n2Int = n2Int else { return }
        guard let n3Int = n3Int else { return }
        guard let n4Int = n4Int else { return }
        
        let resultado = (n1Int + n2Int + n3Int + n4Int)/4
        rvc.resultadoLabel.text = "\(resultado)"
    }
    func setUpAllElements(){
        view.addSubview(desafioLabel)
        view.addSubview(descritivoLabel)
        view.addSubview(n1TextFild)
        view.addSubview(n2TextFild)
        view.addSubview(n3TextFild)
        view.addSubview(n4TextFild)
        view.addSubview(calcularButton)
    }
    func setUpTextFieldDelegate(delegate: UITextFieldDelegate){
        n1TextFild.delegate = delegate
        n2TextFild.delegate = delegate
        n3TextFild.delegate = delegate
        n4TextFild.delegate = delegate
    }
    
    
    // MARK: - Constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            desafioLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            desafioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            desafioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            descritivoLabel.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 50),
            descritivoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descritivoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            n1TextFild.topAnchor.constraint(equalTo: descritivoLabel.bottomAnchor, constant: 30),
            n1TextFild.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            n1TextFild.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            n2TextFild.topAnchor.constraint(equalTo: n1TextFild.bottomAnchor, constant: 20),
            n2TextFild.leadingAnchor.constraint(equalTo: n1TextFild.leadingAnchor),
            n2TextFild.trailingAnchor.constraint(equalTo: n1TextFild.trailingAnchor),
            
            n3TextFild.topAnchor.constraint(equalTo: n2TextFild.bottomAnchor, constant: 20),
            n3TextFild.leadingAnchor.constraint(equalTo: n1TextFild.leadingAnchor),
            n3TextFild.trailingAnchor.constraint(equalTo: n1TextFild.trailingAnchor),
            
            n4TextFild.topAnchor.constraint(equalTo: n3TextFild.bottomAnchor, constant: 20),
            n4TextFild.leadingAnchor.constraint(equalTo: n1TextFild.leadingAnchor),
            n4TextFild.trailingAnchor.constraint(equalTo: n1TextFild.trailingAnchor),
            
            calcularButton.topAnchor.constraint(equalTo: n4TextFild.bottomAnchor, constant: 30),
            calcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            
            
            
        ])
    }
    
    
    // MARK: - Ciclos De Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        setUpTextFieldDelegate(delegate: self)
    }


}

    


// MARK: - Delegates
extension DesafioVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
