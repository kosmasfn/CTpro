//
//  ViewController.swift
//  CTpro
//
//  Created by kosmas on 10/11/23.
//

import UIKit
import CleverTapSDK


class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("View Product", for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpUI()
        self.button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
    }
    
    private func setUpUI(){
//        self.view.backgroundColor
        self.view.addSubview(button)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func onButtonTapped(){
        recordUserEventWithProperties()
        recordOnUserLogin()
    }
    
    
    private func recordUserEventWithProperties() {
        let props = [
            "Product ID": 1,
            "Product Image": "https://d35fo82fjcw0y8.cloudfront.net/2018/07/26020307/customer-success-clevertap.jpg",
            "Product Name": "CleverTap",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Product viewed", withProps: props)
    }
    
    private func recordOnUserLogin(){
        let profile = [
            "Name": "Kosmas",             // String or number
            "Email": "clevertap+kosmasfn@gmail.com",    // Email address of the user
            "Phone": "+628122117521",      // Phone (with the country code, starting with +)
            "Gender": "M"
        ] as [String : Any]

        CleverTap.sharedInstance()?.onUserLogin(profile)
    }

}

