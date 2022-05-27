//
//  ResultadoVC.swift
//  desafio002
//
//  Created by Matheus Armando on 27/05/22.
//

import UIKit

class ResultadoVC: UIViewController {

    
    var resultadoScreen: ResultadoScreen?
    
    override func loadView() {
        resultadoScreen = ResultadoScreen()
        view = resultadoScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultadoScreen?.delegate = self
    }
    
}

extension ResultadoVC: ResultadoScreenProtocol{
    func actionRecalcularButton() {
        let dvc:DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
}
