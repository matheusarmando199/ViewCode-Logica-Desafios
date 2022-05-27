//
//  ViewController.swift
//  desafio002
//
//  Created by Matheus Armando on 26/05/22.
//

import UIKit

class DesafioVC: UIViewController {


    var desafioScreen: DesafioScreen?
    
    override func loadView() {
        desafioScreen = DesafioScreen()
        view = desafioScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desafioScreen?.configTextFieldDelegate(delegate: self)
        desafioScreen?.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension DesafioVC: DesafioScreenProtocol{
    func actionCalcularButton() {
        print("botão ta funfando")
        let rvc:ResultadoVC = ResultadoVC()
        navigationController?.pushViewController(rvc, animated: true)
        
    }
}



extension DesafioVC:UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
