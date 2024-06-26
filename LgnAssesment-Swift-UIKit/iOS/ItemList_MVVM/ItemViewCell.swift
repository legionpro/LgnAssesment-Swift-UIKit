//
//  ItemViewCell.swift
//  iOS
//
//  Created by Oleh Poremskyy on 04.06.2024.
//

import UIKit
import Kingfisher

class ItemViewCell: UICollectionViewCell  {
    var item: ItemDataModel? {
        didSet {
            nameLbl.text = item?.name
            self.itemImage.loadAndSetup(url: item?.webImageUrl ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardCellShadow()
        setupCell()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Contact Name", size: 22)
        lbl.textColor = UIColor.init(white: 0.3, alpha: 0.4)
        return lbl
    }()

    lazy var itemImage: UIImageView = {
        let profileImg = UIImage(systemName: "house.circle")
        let renderedImg = profileImg!.withTintColor(.gray, renderingMode: .alwaysOriginal)
        let imv = UIImageView(image: renderedImg )
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    
    private func setupCell() {
        self.backgroundView?.addSubview(itemImage)
        self.backgroundView?.addSubview(nameLbl)

        NSLayoutConstraint.activate([
            itemImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            itemImage.widthAnchor.constraint(equalToConstant: 60),
            itemImage.heightAnchor.constraint(equalToConstant: 60),

            nameLbl.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            nameLbl.widthAnchor.constraint(equalToConstant: 150),
            nameLbl.heightAnchor.constraint(equalToConstant: 50),

        ])
        
    }
    
    
    override var isHighlighted: Bool {
        didSet{
            var transform = CGAffineTransform.identity
            if isHighlighted {
               transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
            
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
                self.transform = transform
            })
        }
    }
    
    func setupCardCellShadow() {
         backgroundView = UIView()
         addSubview(backgroundView!)
         backgroundView?.backgroundColor     = .white
         backgroundView?.layer.cornerRadius  = 9
         backgroundView?.layer.shadowOpacity = 0.2
         backgroundView?.layer.shadowOffset  = .init(width: 4, height: 10)
         backgroundView?.layer.shadowRadius  = 9

         layer.borderColor  = UIColor.gray.cgColor
         layer.borderWidth  = 0.1
         layer.cornerRadius = 9
         self.layoutIfNeeded()
     }
    
}
