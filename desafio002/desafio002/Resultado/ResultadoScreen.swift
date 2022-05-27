//
//  ResultadoScreen.swift
//  desafio002
//
//  Created by Matheus Armando on 27/05/22.
//

import UIKit


//protocolos
protocol ResultadoScreenProtocol: AnyObject {
    func actionRecalcularButton()
}



class ResultadoScreen: UIView {

    
    weak var delegate: ResultadoScreenProtocol?
    
    
    
    // Elementos
    
    lazy var ResultadoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "20"
        dl.textColor = .white
        dl.textAlignment = .center
        dl.numberOfLines = 4
        dl.font = UIFont.boldSystemFont(ofSize: 50)
        dl.backgroundColor = .systemBlue
        return dl
    }()
    
    
    lazy var recalcularButton: UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Recalcular", for: .normal)
        cb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cb.setTitleColor(.white, for: .normal)
        cb.clipsToBounds = true
        cb.layer.cornerRadius = 20
        cb.backgroundColor = .systemPink
        cb.addTarget(self, action: #selector(tapppedCalcularButton), for: .touchUpInside)
        return cb
    }()
    
    
    // Metodos Funcionais
    
    func addAllElements(){
        addSubview(ResultadoLabel)
        addSubview(recalcularButton)
    }
    
    func setUpBackground(){
        backgroundColor = .black
    }
    
    
    @objc private func tapppedCalcularButton(){
        delegate?.actionRecalcularButton()
    }
    
    
    // Constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            
            ResultadoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            ResultadoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ResultadoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ResultadoLabel.heightAnchor.constraint(equalToConstant: 200),
            
            
            recalcularButton.topAnchor.constraint(equalTo: ResultadoLabel.bottomAnchor, constant: 30),
            recalcularButton.leadingAnchor.constraint(equalTo: ResultadoLabel.leadingAnchor),
            recalcularButton.trailingAnchor.constraint(equalTo: ResultadoLabel.trailingAnchor)
  
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
