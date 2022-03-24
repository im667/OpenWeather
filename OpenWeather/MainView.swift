//
//  View.swift
//  OpenWeather
//
//  Created by mac on 2022/03/23.
//

import UIKit
import SnapKit

class MainView: UIView,BaseViewRepresentable {
    
    let getWeatherButton : UIButton = {
        let i = UIButton()
   
        i.setTitle("날씨가져오기", for: .normal)
        
        
       return i
    }()
    func setupView() {
        <#code#>
    }
    
    func setupConstraints() {
        <#code#>
    }
    
    
    
    
}
