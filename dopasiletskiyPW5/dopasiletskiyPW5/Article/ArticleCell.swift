//
//  TableViewCell.swift
//  dopasiletskiyPW5
//
//  Created by Даниил Пасилецкий on 12.11.2021.
//

import UIKit

class ArticleCell: UITableViewCell {

     func setupArticle() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(image)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
         titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -self.frame.width/2).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
         descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -self.frame.width/2).isActive = true
        image.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.width/2 + 120 ).isActive = true
         image.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
         image.widthAnchor.constraint(equalToConstant: self.frame.width/2).isActive = true
         image.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
         image.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    let titleLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.boldSystemFont(ofSize: 15)
        control.numberOfLines = 3
        control.textColor = UIColor.black //lightGray
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    let  descriptionLabel: UILabel = {
        let control = UILabel()
        control.numberOfLines = 6
        control.font = UIFont.systemFont(ofSize: 10)
        control.textColor = UIColor.black //lightGray
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
    let image: UIImageView = {
        let control = UIImageView()
        control.backgroundColor = .red
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    

}
