//
//  ex001View.swift
//  desafio001
//
//  Created by Matheus Armando on 25/05/22.
//

import UIKit


protocol ex001ViewProtocol: AnyObject{
    func actionCalcularButton()
}


class ex001View: UIView {
    
    weak var delegate: ex001ViewProtocol?
    
    func delegate (delegate:ex001ViewProtocol?){
        self.delegate = delegate
    }
    
    
    lazy var desafioTituloLabel: UILabel = {
        let dt = UILabel()
        dt.translatesAutoresizingMaskIntoConstraints = false
        dt.textColor = .systemPink
        dt.font = UIFont.boldSystemFont(ofSize: 20)
        dt.text = "Desafio 001 - mostrar todas as operações aritméticas de 2 números"
        dt.numberOfLines = 4
        return dt
    }()
    
    lazy var primeiroLabel: UILabel = {
        let pl = UILabel()
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = "Digite o primeiro valor da soma."
        pl.font = UIFont.boldSystemFont(ofSize: 15)
        return pl
    }()
    
    lazy var primeiroValorTextField: UITextField = {
        let pvtf = UITextField()
        pvtf.translatesAutoresizingMaskIntoConstraints = false
        pvtf.borderStyle = .roundedRect
        pvtf.autocorrectionType = .no
        pvtf.backgroundColor = .white
        pvtf.keyboardType = .numberPad
        pvtf.textColor = .black
        pvtf.placeholder = "Apenas valores inteiros."
        return pvtf
    }()
    
    lazy var segundoLabel: UILabel = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        sl.text = "Digite o sefundo valor da soma."
        sl.font =  UIFont.boldSystemFont(ofSize: 15)
        return sl
    }()
    
    lazy var segundoValorTextField: UITextField = {
        let svtf = UITextField()
        svtf.translatesAutoresizingMaskIntoConstraints = false
        svtf.borderStyle = .roundedRect
        svtf.autocorrectionType = .no
        svtf.backgroundColor = .white
        svtf.textColor = .black
        svtf.keyboardType = .numberPad
        svtf.placeholder = "Apenas valores inteiros."
        return svtf
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
    
    lazy var resultadoLabel: UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        rl.text = ""
        rl.numberOfLines = 4
        rl.font =  UIFont.boldSystemFont(ofSize: 20)
        rl.textColor = .systemBlue
        rl.textAlignment = .center
        return rl
    }()
    
    
    func addAllElements (){
        addSubview(desafioTituloLabel)
        addSubview(primeiroLabel)
        addSubview(primeiroValorTextField)
        addSubview(segundoLabel)
        addSubview(segundoValorTextField)
        addSubview(calcularButton)
        addSubview(resultadoLabel)
    }
    
    func setUpBackgroundColor (){
        backgroundColor = .black
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate) {
        primeiroValorTextField.delegate = delegate
        segundoValorTextField.delegate = delegate
    }
    
    func calcularButtonResult(){
        let primeiroValor:String = self.primeiroValorTextField.text ?? ""
        let segundoValor:String = self.segundoValorTextField.text ?? ""
        
        let n1 = Int(primeiroValor)
        let n2 = Int(segundoValor)
        
        guard let n1 = n1 else {return}
        guard let n2 = n2 else {return}
        
        let resultsoma = n1 + n2
        let resultsub = n1 - n2
        let resultmulti = n1 * n2
        let resultdiv = n1 / n2
        resultadoLabel.text = "Soma: \(String(resultsoma)), Subtração: \(String(resultsub)), Multiplicação: \(String(resultmulti)), Divisão: \(String(resultdiv))"
    }
    
    @objc private func tappedCalcular(){
        delegate?.actionCalcularButton()
    }
    
    
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            desafioTituloLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            desafioTituloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            desafioTituloLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            desafioTituloLabel.heightAnchor.constraint(equalToConstant: 100),
            
        
            primeiroLabel.topAnchor.constraint(equalTo: desafioTituloLabel.bottomAnchor,constant: 20),
            primeiroLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            primeiroLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            primeiroValorTextField.topAnchor.constraint(equalTo: primeiroLabel.bottomAnchor, constant: 5),
            primeiroValorTextField.leadingAnchor.constraint(equalTo: primeiroLabel.leadingAnchor),
            primeiroValorTextField.trailingAnchor.constraint(equalTo: primeiroLabel.trailingAnchor),
            primeiroValorTextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            segundoLabel.topAnchor.constraint(equalTo: primeiroValorTextField.bottomAnchor, constant: 20),
            segundoLabel.leadingAnchor.constraint(equalTo: primeiroLabel.leadingAnchor),
            segundoLabel.trailingAnchor.constraint(equalTo: primeiroLabel.trailingAnchor),
            
            
            segundoValorTextField.topAnchor.constraint(equalTo: segundoLabel.bottomAnchor, constant: 5),
            segundoValorTextField.leadingAnchor.constraint(equalTo: segundoLabel.leadingAnchor),
            segundoValorTextField.trailingAnchor.constraint(equalTo: segundoLabel.trailingAnchor),
            segundoValorTextField.heightAnchor.constraint(equalTo: primeiroValorTextField.heightAnchor),
            
            
            calcularButton.topAnchor.constraint(equalTo: segundoValorTextField.bottomAnchor, constant: 30),
            calcularButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            calcularButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            calcularButton.heightAnchor.constraint(equalToConstant: 30),
            
            
            resultadoLabel.topAnchor.constraint(equalTo: calcularButton.bottomAnchor, constant: 10),
            resultadoLabel.leadingAnchor.constraint(equalTo: calcularButton.leadingAnchor),
            resultadoLabel.trailingAnchor.constraint(equalTo: calcularButton.trailingAnchor),
            resultadoLabel.heightAnchor.constraint(equalToConstant: 200)
            
            
        ])
    }
    
    
    
    //metodos inicializadores.
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAllElements()
        setUpConstraints()
        setUpBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
