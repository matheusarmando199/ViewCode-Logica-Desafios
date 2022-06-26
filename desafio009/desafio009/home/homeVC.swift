//
//  ViewController.swift
//  desafio009
//
//  Created by Matheus Armando on 23/06/22.
//

import UIKit

class homeVC: UIViewController {

    
    // MARK: - Elementos
    
    lazy var desafioLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Desafio 009 - criar um app em viewCode que realize um desconto ou um aumento no salário ambos os valores devem ser inseridos peli usuário."
        dl.font = UIFont.boldSystemFont(ofSize: 18)
        dl.numberOfLines = 6
        dl.textColor = .systemPink
        return dl
    }()
    lazy var operacaoLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.text = "Selecione o tipo operação"
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        dl.numberOfLines = 2
        dl.textColor = .white
        dl.textAlignment = .center
        return dl
    }()
    
    lazy var aumentoButton: UIButton = {
        let ab = UIButton()
        ab.translatesAutoresizingMaskIntoConstraints = false
        ab.setTitle("+ Aumento", for: .normal)
        ab.layer.cornerRadius = 10
        ab.titleLabel?.textAlignment = .center
        ab.setTitleColor(.white, for: .normal)
        ab.backgroundColor = .systemGreen
        ab.addTarget(self, action: #selector(callViewAction), for: .touchUpInside)
        return ab
    }()
    
    lazy var descontoButton: UIButton = {
        let db = UIButton()
        db.translatesAutoresizingMaskIntoConstraints = false
        db.setTitle("- Desconto", for: .normal)
        db.layer.cornerRadius = 10
        db.titleLabel?.textAlignment = .center
        db.setTitleColor(.white, for: .normal)
        db.backgroundColor = .systemRed
        db.addTarget(self, action: #selector(callViewAction), for: .touchUpInside)
        return db
    }()
    let scrollView: UIScrollView = {
           let view = UIScrollView()
           view.backgroundColor = .black
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    let contentView: UIView = {
           let view = UIView()
           view.backgroundColor = .black
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()

    // MARK: - Funções setUp
    
   
    
    func setUpAllElements(){
          view.addSubview(scrollView)
          
          contentView.addSubview(desafioLabel)
          contentView.addSubview(operacaoLabel)
          contentView.addSubview(aumentoButton)
          contentView.addSubview(descontoButton)
          
          scrollView.addSubview(contentView)
      }
   
    
    // MARK: - Funções target
    
    @objc func callViewAction(){
        let dvc: questVC = questVC()
        
        navigationController?.pushViewController(dvc, animated: true)
        
        if descontoButton.isTouchInside{
            dvc.view.backgroundColor = .systemRed
            dvc.salarioLabel.text = " Digite abaixo o salário que quer realizar o Desconto."
            dvc.porcentagemLabel.text = "Digite abaixo a porcentagem de desconto que quer aplicar."
            dvc.porcentagemTextField.placeholder = " Digite o valor do desconto"
            dvc.titleViewLabel.text = "$ Desconto $"
        }else if aumentoButton.isTouchInside{
            dvc.view.backgroundColor = .systemGreen
            dvc.salarioLabel.text = " Digite abaixo o salário que quer realizar o Aumento."
            dvc.porcentagemLabel.text = "Digite abaixo a porcentagem de Aumetno que quer aplicar."
            dvc.titleViewLabel.text = "$ Aumento $"
            dvc.porcentagemTextField.placeholder = " Digite o valor do aumento"
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
                desafioLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
                desafioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                desafioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                
                operacaoLabel.topAnchor.constraint(equalTo: desafioLabel.bottomAnchor, constant: 100),
                operacaoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                operacaoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                aumentoButton.topAnchor.constraint(equalTo: operacaoLabel.bottomAnchor, constant: 10),
                aumentoButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
                aumentoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
                
                descontoButton.topAnchor.constraint(equalTo: aumentoButton.bottomAnchor, constant: 20),
                descontoButton.leadingAnchor.constraint(equalTo: aumentoButton.leadingAnchor),
                descontoButton.trailingAnchor.constraint(equalTo: aumentoButton.trailingAnchor),
                descontoButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -400)
            ])
        }


    
    
    // MARK: - Funções inicializadoras

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setUpAllElements()
        setUpConstraintsScrollView()
        setUpConstraintsView()
    }


}

