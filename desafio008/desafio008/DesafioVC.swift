//
//  ViewController.swift
//  desafio008
//
//  Created by Matheus Armando on 10/06/22.
//

import UIKit

class DesafioVC: UIViewController {

    // MARK: - Elementos
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Desafio 008 - criar um app em viewCode que receba um valor e informe o valor digitado com o valor de desconto abatido."
        tl.textColor = .systemBlue
        tl.textAlignment = .center
        tl.font = UIFont.boldSystemFont(ofSize: 15)
        tl.layer.cornerRadius = 7.5
        tl.layer.borderWidth = 1
        tl.layer.borderColor = UIColor.systemPink.cgColor
        tl.numberOfLines = 5
        return tl
    }()
    lazy var descritivoLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Informe o valor do produto."
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 18)
        return tl
    }()
    lazy var valorTextField: UITextField = {
        let vtf = UITextField()
        vtf.translatesAutoresizingMaskIntoConstraints = false
        vtf.backgroundColor = .systemBlue
        vtf.placeholder = " Valor do produto"
        vtf.keyboardType = .numberPad
        vtf.layer.cornerRadius = 8
        vtf.layer.borderWidth = 1
        vtf.layer.borderColor = UIColor.black.cgColor
        return vtf
    }()
    lazy var testelabel:UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = " "
        return tl
    }()
    lazy var descontoslabel:UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Agora escolha um dos descontos a baixo e clique em cima."
        tl.textColor = .black
        tl.font = UIFont.boldSystemFont(ofSize: 18)
        tl.numberOfLines = 5
        return tl
    }()
    lazy var cincoOffButton: UIButton = {
        let cob = UIButton()
        cob.translatesAutoresizingMaskIntoConstraints = false
        cob.setImage(UIImage(named: "5off"), for: .normal)
        cob.addTarget(self, action: #selector(actionCincoPorcento), for: .touchUpInside)
        return cob
    }()
    lazy var vinteOffButton: UIButton = {
        let vob = UIButton()
        vob.translatesAutoresizingMaskIntoConstraints = false
        vob.setImage(UIImage(named: "20off"), for: .normal)
        vob.addTarget(self, action: #selector(actionCincoPorcento), for: .touchUpInside)
        return vob
    }()
    lazy var trintaOffButton: UIButton = {
        let vob = UIButton()
        vob.translatesAutoresizingMaskIntoConstraints = false
        vob.setImage(UIImage(named: "30off"), for: .normal)
        vob.addTarget(self, action: #selector(actionCincoPorcento), for: .touchUpInside)
        return vob
    }()
    lazy var cinquentaOffButton: UIButton = {
        let vob = UIButton()
        vob.translatesAutoresizingMaskIntoConstraints = false
        vob.setImage(UIImage(named: "50off"), for: .normal)
        vob.addTarget(self, action: #selector(actionCincoPorcento), for: .touchUpInside)
        return vob
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Funções SetUp
    func setUpAllElements(){
        view.addSubview(scrollView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descritivoLabel)
        contentView.addSubview(valorTextField)
        contentView.addSubview(descontoslabel)
        contentView.addSubview(cincoOffButton)
        contentView.addSubview(vinteOffButton)
        contentView.addSubview(trintaOffButton)
        contentView.addSubview(cinquentaOffButton)
        
        scrollView.addSubview(testelabel)
        scrollView.addSubview(contentView)
    }
    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func setUpTextFieldDelegate(delegate: UITextFieldDelegate){
        valorTextField.delegate = delegate
    }
    func setUpTextFieldEmpty(){
        let resultString = valorTextField.text ?? ""
        
        if resultString.isEmpty {
        let alert: UIAlertController = UIAlertController(title: "Atenção", message: "você não colocou o valor do produto, coloque o mesmo pra saber o valor total com o desconto aplicado.", preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "Revisar Dados", style: .cancel)
            alert.addAction(action)
        present(alert, animated: true)
        }else{
            
        }
    }
    // MARK: - Funções Target
    
    @objc func actionCincoPorcento(){
        setUpTextFieldEmpty()
        let rsvc: Resultado5VC = Resultado5VC()
        navigationController?.pushViewController(rsvc, animated: true)
        let resultString = valorTextField.text ?? ""
        let resultFloat = Float(resultString)
        guard let resultFloat = resultFloat else { return }
        
        if cincoOffButton.isTouchInside{
            let finalResult = (resultFloat - ((5/100) * resultFloat))
            rsvc.resultadoLabel.text = "R$ \(finalResult)"
        }else if vinteOffButton.isTouchInside{
            let finalResult = (resultFloat - ((20/100) * resultFloat))
            rsvc.resultadoLabel.text = "R$ \(finalResult)"
        }else if trintaOffButton.isTouchInside{
            let finalResult = (resultFloat - ((30/100) * resultFloat))
            rsvc.resultadoLabel.text = "R$ \(finalResult)"
        }else if cinquentaOffButton.isTouchInside{
            let finalResult = (resultFloat - ((50/100) * resultFloat))
            rsvc.resultadoLabel.text = "R$ \(finalResult)"
        }
    }
    
    // MARK: - Constraints
    
    func setUpConstraintsScrollView(){
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    func setUpConstraintsView(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            descritivoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            descritivoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descritivoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            valorTextField.topAnchor.constraint(equalTo: descritivoLabel.bottomAnchor, constant: 10),
            valorTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            valorTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            valorTextField.heightAnchor.constraint(equalToConstant: 35),
            
            descontoslabel.topAnchor.constraint(equalTo: valorTextField.bottomAnchor, constant: 30),
            descontoslabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descontoslabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            cincoOffButton.topAnchor.constraint(equalTo: descontoslabel.bottomAnchor, constant: 10),
            cincoOffButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            cincoOffButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            cincoOffButton.heightAnchor.constraint(equalToConstant: 200),
            
            vinteOffButton.topAnchor.constraint(equalTo: cincoOffButton.bottomAnchor, constant: 2),
            vinteOffButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            vinteOffButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            vinteOffButton.heightAnchor.constraint(equalToConstant: 200),
            
            trintaOffButton.topAnchor.constraint(equalTo: vinteOffButton.bottomAnchor, constant: 2),
            trintaOffButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            trintaOffButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            trintaOffButton.heightAnchor.constraint(equalToConstant: 200),
            
            cinquentaOffButton.topAnchor.constraint(equalTo: trintaOffButton.bottomAnchor, constant: 2),
            cinquentaOffButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            cinquentaOffButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            cinquentaOffButton.heightAnchor.constraint(equalToConstant: 200),
            
            testelabel.topAnchor.constraint(equalTo: cinquentaOffButton.bottomAnchor, constant: 10),
            testelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            testelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            testelabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    // MARK: - Ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAllElements()
        setUpConstraintsScrollView()
        setUpConstraintsView()
        setUpNavigationController()
        setUpTextFieldDelegate(delegate: self)
    }

}

extension DesafioVC: UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scrollView.endEditing(true)
    }
}

