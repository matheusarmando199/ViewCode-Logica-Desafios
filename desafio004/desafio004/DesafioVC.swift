//
//  ViewController.swift
//  desafio004
//
//  Created by Matheus Armando on 04/06/22.
//

import UIKit

class DesafioVC: UIViewController {

    // MARK: - Elementos
    
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 004 - Crie um app em viewCode que receba um valor em metros, e converta ele seguindo a tabela de conversão e de medidas a baixo"
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        dl.textColor = .systemPink
        dl.numberOfLines = 4
       
        return dl
    }()
    
    lazy var desafioImageView: UIImageView = {
        let dil = UIImageView()
        dil.translatesAutoresizingMaskIntoConstraints = false
        dil.image = UIImage(named: "udc")
        dil.contentMode = .scaleAspectFit
        return dil
    }()
    lazy var descritivoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "olá, me informe um valor em metros e eu te digo eles em escala de km, hm, dam, dm, cm, mm"
        dl.textColor = .black
        dl.font = UIFont.boldSystemFont(ofSize: 12)
        dl.numberOfLines = 2
        return dl
    }()
    lazy var valorTextField: UITextField = {
        let vtf = UITextField()
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.backgroundColor = .systemBlue
        vtf.placeholder = "  Valor em metros"
        vtf.textColor = .white
        vtf.keyboardType = .numberPad
        vtf.autocorrectionType = .no
        vtf.borderStyle = .roundedRect
        return vtf
    }()
    lazy var calcularButton:UIButton = {
        let cb = UIButton()
        cb.translatesAutoresizingMaskIntoConstraints = false
        cb.setTitle("Calcular", for: .normal)
        cb.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cb.setTitleColor(.white, for: .normal)
        cb.backgroundColor = .systemPink
        cb.layer.cornerRadius = 7.5
        cb.addTarget(self, action: #selector(calcularAction), for: .touchUpInside)
        return cb
    }()
    
    // MARK: - Funcionalidades
    
    func setUpAllElements(){
        view.addSubview(desafioLabel)
        view.addSubview(desafioImageView)
        view.addSubview(descritivoLabel)
        view.addSubview(valorTextField)
        view.addSubview(calcularButton)
        
    }
    
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    
    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @objc func calcularAction(){
        let rvc: ResultadoVC = ResultadoVC()
        navigationController?.pushViewController(rvc, animated: true)
        let n1String = valorTextField.text ?? ""
        let n1float = Float(n1String)
        guard let n1float = n1float else { return }
        
        let km = n1float / 1000
        let hm = n1float / 100
        let dam = n1float / 10
        let dm = n1float * 10
        let cm = n1float * 100
        let mm = n1float * 1000
        rvc.resultLabel.text = "\(km) <- \(hm) <- \(dam) <- \(n1float) -> \(dm) -> \(cm) -> \(mm)"
                               //KM       HM       DAM          M          DM       CM       MM
                               
                               
    }
    func setUpTextFieldDelegates(delegate: UITextFieldDelegate){
        valorTextField.delegate = delegate
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            desafioLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            desafioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            desafioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            desafioImageView.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 20),
            desafioImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            desafioImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            desafioImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descritivoLabel.topAnchor.constraint(equalTo: desafioImageView.bottomAnchor, constant: 30),
            descritivoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descritivoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            valorTextField.topAnchor.constraint(equalTo: descritivoLabel.bottomAnchor, constant: 10),
            valorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            valorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            valorTextField.heightAnchor.constraint(equalToConstant: 35),
            
            calcularButton.topAnchor.constraint(equalTo: valorTextField.bottomAnchor, constant: 10),
            calcularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calcularButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            calcularButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    // MARK: - Ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        setUpTextFieldDelegates(delegate: self)
    }


}


extension DesafioVC:UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

