//
//  PicturesCollectionViewCell.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

class PicturesCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "plicturesCell"
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 0
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = .clear
        setUp()
    }
    
    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        contentView.addSubview(mainImage)
        contentView.addSubview(artistNameLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                mainImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                artistNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                artistNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            ]
        )
    }
    
    func fill(with item: PhotoDetails) {
        artistNameLabel.text = item.artistName
        
        NetworkService.shared.loadImage(from: item.imageUrl) { [weak self] image, width, height in
            DispatchQueue.main.async {
                self?.mainImage.image = image
                if width > 0 {
                    let aspectRatio = height / width
                    self?.mainImage.heightAnchor.constraint(equalTo: (self?.mainImage.widthAnchor)!, multiplier: aspectRatio).isActive = true
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
