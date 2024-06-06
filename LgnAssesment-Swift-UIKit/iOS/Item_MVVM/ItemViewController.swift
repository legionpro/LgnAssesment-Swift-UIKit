//
//  ItemViewController.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import UIKit
import Kingfisher

class ItemViewController: UIViewController {
    lazy var customView = ItemView(viewModel: viewModel)
    private let viewModel: ItemViewModel
    
    override func loadView() {
        view = customView
    }
    
    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}


final class ItemView: UIView {
    private let viewModel: ItemViewModel
    private let containerView   = UIView()
    
    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        containerView.backgroundColor = .lightGray
        addSubview(containerView)
        setupCell()
        self.imageView.loadAndSetup(url: self.viewModel.item.webImageUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let img = UIImage(systemName: "mountain.2")
        let renderedImg = img!.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: renderedImg)
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.3
        return imageView

    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = self.viewModel.item.name
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var descriptionText: UITextView = {
        var textview = UITextView()
        textview.layer.borderWidth = 1
        textview.layer.borderColor = UIColor.gray.cgColor
        textview.text = self.viewModel.item.description
        textview.textColor = .black
        textview.backgroundColor = .white
        return textview
    }()
}


extension ItemView {
    private func setUpLabelConstrains() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: label.superview!.topAnchor, constant: 8).isActive = true
        label.leftAnchor.constraint(equalTo: label.superview!.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: label.superview!.rightAnchor, constant: -10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    private func setImageViewConstrains() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: imageView.superview!.topAnchor, constant: 80).isActive = true
        imageView.centerXAnchor.constraint(equalTo: imageView.superview!.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func setTextViewConstrains() {
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: descriptionText.superview!.bottomAnchor, constant: -20).isActive = true
        descriptionText.leftAnchor.constraint(equalTo: descriptionText.superview!.leftAnchor, constant: 10).isActive = true
        descriptionText.rightAnchor.constraint(equalTo: descriptionText.superview!.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupCell() {
        containerView.addSubview(label)
        containerView.addSubview(imageView)
        containerView.addSubview(descriptionText)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        setUpLabelConstrains()
        setImageViewConstrains()
        setTextViewConstrains()
    }
}
