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
        mainView.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.getWeatherButton.addTarget(self, action: #selector(clickedWeatherButton), for: .touchUpInside)
    }


    @objc func clickedWeatherButton(){
        if let cityName = mainView.cityTextField.text {
            self.getweather(city: cityName)
            self.mainView.endEditing(true)
            mainView.cityTextField.isHidden = true
            mainView.maxMinTemperStackView.isHidden = false
            mainView.temperaturesLabel.isHidden = false
            mainView.weatherLabel.isHidden = false
            mainView.cityNameLabel.isHidden = true
        }
    }
    
    func configureView(weatherInformaion: Weather){
        mainView.cityNameLabel.text = weatherInformaion.name
        if let weather = weatherInformaion.weather.first {
            mainView.weatherLabel.text = weather.weatherDescription
        }
        mainView.temperaturesLabel.text = "\(Int(weatherInformaion.main.temp - 273.15))°C"
        mainView.maxTemperLabel.text = "최고:\(Int(weatherInformaion.main.tempMax - 273.15))°C"
        mainView.minTemperLabel.text = "최저:\(Int(weatherInformaion.main.tempMin - 273.15))°C"
    }
    
    
    func getweather(city:String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(APIService.key)") else { return }
        let session = URLSession(configuration: .default)
            session.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
                guard let weatherInformation = try? decoder.decode(Weather.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.configureView(weatherInformaion: weatherInformation)
                }
        }.resume()
    }
    
}

