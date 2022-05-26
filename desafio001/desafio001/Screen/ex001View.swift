//
//  ex001View.swift
//  desafio001
//
//  Created by Matheus Armando on 25/05/22.
//

import UIKit

class ex001View: UIView {

    lazy var desafioTituloLabel: UILabel = {
        let dt = UILabel()
        dt.translatesAutoresizingMaskIntoConstraints = false
        dt.textColor = .blue
        dt.font = UIFont.boldSystemFont(ofSize: 20)
        dt.text = "Desafio 001 - mostrar a soma de 2 números"
        dt.numberOfLines = 2
        return dt
    }()
    
    func addAllElements (){
        addSubview(desafioTituloLabel)
    }
    
    func setUpBackgroundColor (){
        backgroundColor = .black
    }
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            desafioTituloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            desafioTituloLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
    
    //metodos inicializadores.
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAllElements()
        setUpConstraints()
        setUpBackgroundColor()
    }
    
    required init?(coder: NSCoder) {\
        fatalError("init(coder:) has not been implemented")
    }
    
}
