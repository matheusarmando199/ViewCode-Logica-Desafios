//
//  resultcells.swift
//  desafio005
//
//  Created by Matheus Armando on 06/06/22.
//

import UIKit

class resultcells: UITableViewCell {

    static let identifier: String = "resultcells"
    
    // MARK: - elementos
    
    lazy var resultLabelCell: UILabel = {
        let rlc = UILabel()
        rlc.translatesAutoresizingMaskIntoConstraints = false
        rlc.text = ""
        rlc.font = UIFont.boldSystemFont(ofSize: 15)
        return rlc
    }()
    
    // MARK: - Funcionalidades
    
    func setUpAllElements(){
        addSubview(resultLabelCell)
    }
    
    public func setUpCell(data: Data){
        resultLabelCell.text = data.resultado
        resultLabelCell.backgroundColor = .systemBlue
        resultLabelCell.textAlignment = .center
        resultLabelCell.textColor = .white
        
    }
    // MARK: - constraints
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            resultLabelCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            resultLabelCell.centerXAnchor.constraint(equalTo: centerXAnchor)

        
        
        ])
    }
    
    
    // MARK: - Inicializadores
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpAllElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
