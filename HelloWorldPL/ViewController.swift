//
//  ViewController.swift
//  HelloWorldPL
//
//  Created by Jesus Nieves on 01/03/2020.
//  Copyright © 2020 Jesus Nieves. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {

    let centeredView = UIView()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "This is a Hello World\nwith PureLayout"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "This is planet earth, there is only\none. Take care of him!"
        return label
    }()
    
    lazy var imageImageView: UIImageView = {
        let imageView = UIImageView.newAutoLayout()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "world")
        return imageView
    }()
    
    lazy var brandNameLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.text = "Medium"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
}

extension ViewController: ViewConfigDelegate {
    
    func setupView() {
        self.view.backgroundColor = UIColor(red:0.17, green:0.75, blue:0.97, alpha:1.0)
        self.view.addSubview(self.centeredView)
        self.centeredView.addSubview(self.titleLabel)
        self.centeredView.addSubview(self.descriptionLabel)
        self.centeredView.addSubview(self.imageImageView)
        self.view.addSubview(self.brandNameLabel)
    }
    
    func setupConstraints() {
        self.centeredView.autoPinEdge(toSuperviewEdge: .leading)
        self.centeredView.autoPinEdge(toSuperviewEdge: .trailing)
        self.centeredView.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        self.titleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), excludingEdge: .bottom)
        
        self.descriptionLabel.autoPinEdge(.top, to: .bottom, of: self.titleLabel, withOffset: 28)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        self.descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16)
        
        self.imageImageView.autoPinEdge(.top, to: .bottom, of: self.descriptionLabel, withOffset: 43)
        self.imageImageView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        self.imageImageView.autoSetDimension(.height, toSize: 255)
        
        self.brandNameLabel.autoPinEdge(.top, to: .bottom, of: self.centeredView, withOffset: 16, relation: .greaterThanOrEqual)
        self.brandNameLabel.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16), excludingEdge: .top)
    }
    
}


