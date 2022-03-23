//
//  ViewController.swift
//  OpenWeather
//
//  Created by mac on 2022/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

