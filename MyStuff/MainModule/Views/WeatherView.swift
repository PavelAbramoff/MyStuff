//
//  WeatherView.swift
//  MyStuff
//
//  Created by apple on 2/19/24.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherIconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textColor = .gray
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 2
        label.font = .robotoMedium14()
        label.textColor = .specialGray
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        addSubview(weatherIconImageView)
        addSubview(weatherStatusLabel)
        addSubview(weatherDiscriptionLabel)
    }
    
    func updateImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        weatherIconImageView.image = image
    }
    
    func updateLabels(model: WeatherModel) {
        weatherStatusLabel.text = model.weather[0].myDescription + " " +  "\(model.main.temperatureCesius)°C"
        switch model.weather[0].weatherDescription {
            case "clear sky":
                weatherDiscriptionLabel.text = "Good weather for outdoor training"

        case "few clouds":
            weatherDiscriptionLabel.text = "Good weather for outdoor training"
        case "scattered clouds":
            weatherDiscriptionLabel.text = "Good weather for outdoor training"
        case "broken clouds":
            weatherDiscriptionLabel.text = "Good weather for outdoor training"
        case "shower rain":
            weatherDiscriptionLabel.text = "Good weather for training in the houme"
        case "rain":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
        case "thunderstorm":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
        case "snow":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
        case "mist":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
        case "overcast clouds":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
        case "moderate rain":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
        case "light rain":
            weatherDiscriptionLabel.text = "The best weather for training in the gym"
            default:
            weatherDiscriptionLabel.text = "No data"
        }
    }
}

//MARK: - Set Contraints

extension WeatherView {

    private func setConstraints() {

        NSLayoutConstraint.activate([
            //weatherIconImageView
            weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                           constant: -10),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 60),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            //weatherStatusLabel
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                        constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor,
                                                         constant: -10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20),

            //weatherDiscriptionLabel
            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor,
                                                         constant: 0),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                             constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor,
                                                              constant: -10),
            weatherDiscriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                            constant: -5)
        ])
    }
}




