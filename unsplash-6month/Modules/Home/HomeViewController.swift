//
//  HomeViewController.swift
//  unsplash-6month
//
//  Created by Telegey Nurbekova on 15/08/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeView: HomeView = {
        let view = HomeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUp()
        setupNavItem()
        fetchAndDisplayPhotos()
    }

    func setUp() {
        setUpSubviews()
        setUpConstraints()
    }

    func setUpSubviews() {
        view.addSubview(homeView)
    }

    private func setupNavItem() {
        navigationItem.hidesBackButton = true
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate(
            [
                homeView.topAnchor.constraint(equalTo: view.topAnchor),
                homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }

    private func fetchAndDisplayPhotos() {
        NetworkService.shared.fetchUnsplashPhotos { [weak self] photoDetails in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard let photoDetails = photoDetails else { return }
                self.homeView.updatePictures(with: photoDetails)
            }
        }
    }
}
