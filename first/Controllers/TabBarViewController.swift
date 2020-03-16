//
//  TabBarViewController.swift
//  first
//
//  Created by Mark Chibukhchian on 3/10/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    
    
    let coustmeTabBarView: UIView = {
           
           let view = UIView(frame: .zero)
           view.backgroundColor = .white
           view.layer.cornerRadius = 20
           view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           view.clipsToBounds = true
           view.layer.masksToBounds = false
           view.layer.shadowColor = UIColor.black.cgColor
           view.layer.shadowOffset = CGSize(width: 0, height: -8.0)
           view.layer.shadowOpacity = 0.12
           view.layer.shadowRadius = 10.0
           return view
       }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        setupTabBar()
        addcoustmeTabBarView()
        hideTabBarBorder()



        let centerView = UIView()
        centerView.backgroundColor = #colorLiteral(red: 0, green: 0.6704824567, blue: 0.35842219, alpha: 1)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 32.5
        centerView.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        centerView.layer.applySketchShadow()
        view.addSubview(centerView)
        
   
        tabBar.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
        tabBar.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 15).isActive = true
        centerView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: 65).isActive = true
       


        let centerImage = UIImageView()
        centerImage.image = UIImage(named: "Group 1484")
        centerImage.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(centerImage)
        centerImage.centerXAnchor.constraint(equalTo: centerView.centerXAnchor).isActive = true
        centerImage.centerYAnchor.constraint(equalTo: centerView.centerYAnchor).isActive = true

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coustmeTabBarView.frame = tabBar.frame
    }
    
    private func addcoustmeTabBarView() {
        coustmeTabBarView.frame = tabBar.frame
        view.addSubview(coustmeTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        
    }
    
    
    func setupTabBar() {
        let item1 = (self.tabBar.items?[0])! as UITabBarItem
        item1.image = UIImage(named: "Union 4")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        item1.selectedImage = UIImage(named: "Union 4 ")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        item1.title = ""
        item1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)




        let item3 = (self.tabBar.items?[2])! as UITabBarItem
        item3.image = UIImage(named: "Group 1455")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        item3.selectedImage = UIImage(named: "Group 1455")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        item3.title = ""
        item3.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

    }


}

