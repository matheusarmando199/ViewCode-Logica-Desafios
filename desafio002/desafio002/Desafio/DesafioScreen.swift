//
//  DesafioScreen.swift
//  desafio002
//
//  Created by Matheus Armando on 26/05/22.
//

import UIKit


//protocolos
protocol DesafioScreenProtocol: AnyObject {
    func actionCalcularButton()
}



class DesafioScreen: UIView {
    
    
    weak var delegate: DesafioScreenProtocol?

    // Elementos
    
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 002 - mostrar o antecessor e sucessor de numeros inteiros."
        dl.textColor = .systemPink
        dl.numberOfLines = 4
        dl.font = UIFont.boldSystemFont(ofSize: 20)
        return dl
    }()
    
    lazy var primeiraLabel: UILabel = {
        let pl = UILabel()
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = "Digite a baixo um número inteiro e eu te digo o antecessor e o sucessor do mesmo."
        pl.textColor = .white
        pl.font = UIFont.boldSystemFont(ofSize: 15)
        pl.numberOfLines = 4
        return pl
    }()
    
    lazy var valorTextField: UITextField = {
        let vtf = UITextField()
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.borderStyle = .roundedRect
        vtf.autocorrectionType = .no
        vtf.backgroundColor = .white
        vtf.keyboardType = .numberPad
        vtf.textColor = .black
        vtf.placeholder = "Apenas valores inteiros."
        return vtf
    }()
    
    lazy var calcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Calcular", for: .normal)
        cb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cb.setTitleColor(.white, for: .normal)
        cb.clipsToBounds = true
        cb.layer.cornerRadius = 20
        cb.backgroundColor = .systemBlue
        cb.addTarget(self, action: #selector(tapppedCalcularButton), for: .touchUpInside)
        return cb
    }()
    
    
    // Metodos Funcionais
    
    func addAllElements(){
        addSubview(desafioLabel)
        addSubview(primeiraLabel)
        addSubview(valorTextField)
        addSubview(calcularButton)
    }
    
    func setUpBackground(){
        backgroundColor = .black
    }
    
    public func configTextFieldDelegate (delegate:UITextFieldDelegate){
        valorTextField.delegate = delegate
    }
    
    @objc private func tapppedCalcularButton(){
        delegate?.actionCalcularButton()
    }
    
    
    // Constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            desafioLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            desafioLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            desafioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            desafioLabel.heightAnchor.constraint(equalToConstant: 100),
            
            primeiraLabel.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 20),
            primeiraLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            primeiraLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            valorTextField.topAnchor.constraint(equalTo: primeiraLabel.bottomAnchor, constant: 5),
            valorTextField.leadingAnchor.constraint(equalTo: primeiraLabel.leadingAnchor),
            valorTextField.trailingAnchor.constraint(equalTo: primeiraLabel.trailingAnchor),
            
            calcularButton.topAnchor.constraint(equalTo: valorTextField.bottomAnchor, constant: 20),
            calcularButton.leadingAnchor.constraint(equalTo: valorTextField.leadingAnchor),
            calcularButton.trailingAnchor.constraint(equalTo: valorTextField.trailingAnchor)
        ])
    }
    
    
    
    // Metodos Inicializadores
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBackground()
        addAllElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
