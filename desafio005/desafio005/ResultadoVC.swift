//
//  ResultadoVC.swift
//  desafio005
//
//  Created by Matheus Armando on 06/06/22.
//

import UIKit

class ResultadoVC: UIViewController {
    
    var dataCells: [Data] = []
    
    
    // MARK: - Elementos
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.text = "Resultado"
        tl.textColor = .systemPink
        tl.layer.borderWidth = .leastNormalMagnitude
        tl.font = UIFont.boldSystemFont(ofSize: 27)
        tl.textAlignment = .center
        return tl
    }()
    lazy var resultTableView: UITableView = {
        let rtv = UITableView()
        rtv.translatesAutoresizingMaskIntoConstraints = false
        rtv.backgroundColor = .systemBlue
        rtv.layer.borderWidth = .leastNormalMagnitude
        rtv.layer.cornerRadius = 30
        rtv.separatorColor = .white
        rtv.register(resultcells.self, forCellReuseIdentifier: resultcells.identifier)
        return  rtv
    }()
    lazy var buttonRecalcular: UIButton = {
        let bc = UIButton()
        bc.translatesAutoresizingMaskIntoConstraints = false
        bc.setTitle("Recalcular", for: .normal)
        bc.setTitleColor(.white, for: .normal)
        bc.backgroundColor = .systemPink
        bc.layer.cornerRadius = 8
        bc.layer.borderWidth = .leastNormalMagnitude
        bc.addTarget(self, action: #selector(actionRecacularButton), for: .touchUpInside)
        return bc
    }()
    
    
    // MARK: - Funcionalidades
    
    func setUpBackgroundColor(){
        view.backgroundColor = .white
    }
    @objc func actionRecacularButton(){
        let dvc: DesafioVC = DesafioVC()
        navigationController?.pushViewController(dvc, animated: true)
    }
    func setUpAllElements(){
        view.addSubview(titleLabel)
        view.addSubview(resultTableView)
        view.addSubview(buttonRecalcular)
    }
    func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        resultTableView.delegate = delegate
        resultTableView.dataSource = dataSource
    }
    
    // MARK: - Constraints
    func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            resultTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            resultTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            resultTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            
            buttonRecalcular.topAnchor.constraint(equalTo: resultTableView.bottomAnchor, constant: 15),
            buttonRecalcular.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonRecalcular.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        
        ])
    }
    
    
    
    // MARK: - Ciclos De Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        configTableViewDelegate(delegate: self, dataSource: self)
    }


}

extension ResultadoVC: UITableViewDelegate, UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    dataCells.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: resultcells? = resultTableView.dequeueReusableCell(withIdentifier: resultcells.identifier, for: indexPath) as? resultcells
    cell?.setUpCell(data: dataCells[indexPath.row])
    cell?.backgroundColor = .systemBlue
    return cell ?? UITableViewCell() 
}

}
