//
//  ForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Wonhee on 2021/01/22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    private let weatherImageWidth: CGFloat = 30
    
    // MARK: - UI Property
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = WeatherString.basic
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = WeatherString.basic
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.widthAnchor.constraint(equalToConstant: weatherImageWidth).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.0).isActive = true
        return imageView
    }()

    // MARK: - init func
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpForecastStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        resetUI()
    }
    
    // MARK: - setting UI func
    private func setUpForecastStack() {
        let containerStack = UIStackView()
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.axis = .horizontal
        contentView.addSubview(containerStack)
        containerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        containerStack.addArrangedSubview(dateLabel)
        containerStack.addArrangedSubview(temperatureLabel)
        containerStack.addArrangedSubview(weatherImageView)
    }
    
    func setUpUI(with forecast: ForecastItem?) {
        // TODO: add image
        dateLabel.text = forecast?.dateTimeToString
        guard let averageTemperature = forecast?.temperature.averageTemperature else {
            return resetUI()
        }
        temperatureLabel.text = String(format: WeatherString.averageTemperatureFormat, averageTemperature)
    }
    
    private func resetUI() {
        dateLabel.text = WeatherString.basic
        temperatureLabel.text = WeatherString.basic
    }
}
