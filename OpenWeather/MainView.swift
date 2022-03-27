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
        i.setTitleColor(UIColor.darkGray, for: .normal)
        i.setTitle("날씨가져오기", for: .normal)
       return i
    }()
    
    let stackView: UIStackView = {
       let i = UIStackView()
        i.axis = .vertical
        i.spacing  = 16
        i.alignment = .center
        return i
    }()
    
    let cityLabel: UILabel = {
        let i = UILabel()
        i.text = "서울"
        i.sizeToFit()
        i.textColor = .darkGray
        i.font = UIFont.systemFont(ofSize: 25)
        return i
    }()
    
    let weatherLabel: UILabel = {
       let i = UILabel()
        i.text = "맑음"
        i.textColor = .darkGray
        i.font = UIFont.systemFont(ofSize: 20)
        return i
    }()
    
    let temperaturesLabel : UILabel = {
        let i = UILabel()
        i.text = "23.1°C"
        i.textColor = .darkGray
        i.font = UIFont.systemFont(ofSize: 40, weight: .black)
        return i
    }()
    
    let maxMinTemperStackView : UIStackView = {
        let i = UIStackView()
        i.axis = .horizontal
        i.spacing = 80
        i.distribution = .equalSpacing
        return i
    }()
    
    let maxTemperLabel : UILabel = {
       let i = UILabel()
        i.text = "최고"
        i.textColor = .darkGray
        i.font = UIFont.systemFont(ofSize: 16)
        return i
    }()
    
    let minTemperLabel: UILabel = {
        let i = UILabel()
        i.text = "최저"
        i.textColor = .darkGray
        i.font = UIFont.systemFont(ofSize: 16)
        return i
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setupView() {
        
        [maxTemperLabel,minTemperLabel].forEach {
            maxMinTemperStackView.addArrangedSubview($0)
        }
        
        [cityLabel,weatherLabel,temperaturesLabel,maxMinTemperStackView].forEach{
            stackView.addArrangedSubview($0)
        }
        
        [getWeatherButton, stackView].forEach{
            self.addSubview($0)
        }
        
     
        
        
    }
    
    func setupConstraints() {
        
        getWeatherButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(32)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(getWeatherButton.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
    }
    
    
    
    
}
