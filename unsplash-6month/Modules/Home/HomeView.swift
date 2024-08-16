//
//  HomeView.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
}

class HomeView: BaseView {
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let unsplashLabel: UILabel = {
        let view = UILabel()
        view.text = "Unsplash"
        view.font = .boldSystemFont(ofSize: 32)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private let picturesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    private let categories = [
        Category(categoryName: "Editorial"),
        Category(categoryName: "Wallpapers"),
        Category(categoryName: "Macro Moments"),
        Category(categoryName: "Nature"),
        Category(categoryName: "3D Renders"),
        Category(categoryName: "Travel"),
        Category(categoryName: "Architecture & Interior"),
        Category(categoryName: "Film"),
        Category(categoryName: "Archival")
    ]
    
    private var pictures: [PhotoDetails] = []

    weak var delegate: HomeViewDelegate?
    
    func updatePictures(with newPictures: [PhotoDetails]) {
        self.pictures = newPictures
        self.picturesCollectionView.reloadData()
    }
    
    override func setUp() {
        super.setUp()
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(
            CategoriesCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseId
        )
        
        picturesCollectionView.dataSource = self
        picturesCollectionView.register(
            PicturesCollectionViewCell.self,
            forCellWithReuseIdentifier: PicturesCollectionViewCell.reuseId
        )
        categoriesCollectionView.delegate = self
        picturesCollectionView.delegate = self
    }
    
    override func setUpSubviews() {
        super.setUpSubviews()
        addSubview(logoImage)
        addSubview(unsplashLabel)
        addSubview(categoriesCollectionView)
        addSubview(picturesCollectionView)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        NSLayoutConstraint.activate(
            [
                logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
                logoImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                logoImage.heightAnchor.constraint(equalToConstant: 35),
                logoImage.widthAnchor.constraint(equalToConstant: 35),
                
                unsplashLabel.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
                unsplashLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                unsplashLabel.heightAnchor.constraint(equalToConstant: 35),
                
                categoriesCollectionView.topAnchor.constraint(equalTo: unsplashLabel.bottomAnchor, constant: 24),
                categoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                categoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                categoriesCollectionView.heightAnchor.constraint(equalToConstant: 24),
                
                picturesCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 12),
                picturesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
                picturesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
                picturesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ]
        )
    }
    
}

extension HomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return categories.count
        } else {
            return pictures.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath) as! CategoriesCollectionViewCell
            cell.fill(with: categories[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PicturesCollectionViewCell.reuseId, for: indexPath) as! PicturesCollectionViewCell
            cell.fill(with: pictures[indexPath.row])
            return cell
        }
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            let categoryName = categories[indexPath.item].categoryName
            let font = UIFont.systemFont(ofSize: 16)
            let attributes: [NSAttributedString.Key: Any] = [.font: font]
            let size = (categoryName as NSString).size(withAttributes: attributes)
            
            let width = size.width + 20
            return CGSize(width: width, height: 32)
        } else {
            let screenWidth = UIScreen.main.bounds.width - 20
            let imageHeight = screenWidth * 5 / 4
            return CGSize(width: screenWidth, height: imageHeight)
        }
    }
}

