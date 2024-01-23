//
//  HomeViewController.swift
//  OVOLayoutClone
//
//  Created by Shagara F Nasution on 17/01/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeView = HomeView()
    
    // TODO: Update with ovo logo image
    private lazy var ovoLiteralLogo: UILabel = {
        let label = UILabel()
        label.text = "OVO"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.purpleOVOMain
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // TODO: Update to have different background color while button tapped
    private lazy var rightBarItemButton: UIButton = {
        let image = UIImage(
            systemName: "percent",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 14,
                weight: .bold
            )
        )
        
        let buttonHeight: CGFloat = 30
        
        let button = UIButton()
        button.setTitle("Promo", for: .normal)
        button.setTitleColor(.purpleOVOMain, for: .normal)
        button.setBackgroundImage(.pixel(ofColor: .white05), for: .normal)
        button.setBackgroundImage(.pixel(ofColor: .purpleOVOMain01), for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(
            ofSize: 12,
            weight: .bold
        )
        button.addTarget(
            self,
            action: #selector(tapRightBarItemButton),
            for: .touchUpInside
        )
        button.setImage(image, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0, right: 8
        )
        button.frame = CGRect(
            x: 0,
            y: 0,
            width: 92,
            height: buttonHeight
        )
        button.layer.cornerRadius = buttonHeight/2
        button.layer.masksToBounds = true
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        view.addSubview(homeView)
        addConstraints()
    }
    
    private func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .blueSmoked
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            customView: ovoLiteralLogo
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            customView: rightBarItemButton
        )
      
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    @objc
    private func tapRightBarItemButton() {
        print("pressed right bar item button")
    }
    
}
