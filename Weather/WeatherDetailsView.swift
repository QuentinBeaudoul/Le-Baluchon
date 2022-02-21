//
//  WeatherDetailsView.swift
//  Weather
//
//  Created by Quentin Beaudoul on 18/02/2022.
//

import LoadableViews
import Extension

class WeatherDetailsView: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var sunriseImageView: UIImageView!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetImageView: UIImageView!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!

    func fillView(weatherContainer: WeatherContainer) {
        cityLabel.text = weatherContainer.name

        descriptionLabel.text = weatherContainer.weather.first?.description

        latLabel.text = "Lat: \(weatherContainer.coord.lat)"
        lonLabel.text = "Lon: \(weatherContainer.coord.lon)"

        temperatureLabel.text = "\(weatherContainer.temperatures.temp.toInt())°"
        minTemperatureLabel.text = "Min. \(weatherContainer.temperatures.tempMin.toInt())°"
        maxTemperatureLabel.text = "Max. \(weatherContainer.temperatures.tempMax.toInt())°"

        let sunriseHour = Date(timeIntervalSince1970: weatherContainer.sys.sunrise + weatherContainer.timezone).getFormattedHour()
        let sunsetHour = Date(timeIntervalSince1970: weatherContainer.sys.sunset + weatherContainer.timezone).getFormattedHour()

        sunriseLabel.text = sunriseHour
        sunsetLabel.text = sunsetHour

        guard let weatherCondition = weatherContainer.weather.first?.getWeatherCondition() else { return }

        switch weatherCondition {
        case .clearSky:
            weatherImageView.image = R.image.clearSky()
        case .fewClouds:
            weatherImageView.image = R.image.fewClouds()
        case .scatteredClouds:
            weatherImageView.image = R.image.scatteredClouds()
        case .brokenClouds:
            weatherImageView.image = R.image.brokenClouds()
        case .overcastClouds:
            weatherImageView.image = R.image.brokenClouds()
        case .showerRain:
            weatherImageView.image = R.image.showerRain()
        case .rain:
            weatherImageView.image = R.image.rain()
        case .freezingRain:
            weatherImageView.image = R.image.snow()
        case .thunderStorm:
            weatherImageView.image = R.image.thunderStorm()
        case .snow:
            weatherImageView.image = R.image.snow()
        case .mist:
            weatherImageView.image = R.image.mist()
        case .smoke:
            weatherImageView.image = R.image.mist()
        case .haze:
            weatherImageView.image = R.image.mist()
        case .dust:
            weatherImageView.image = R.image.mist()
        case .fog:
            weatherImageView.image = R.image.mist()
        case .sand:
            weatherImageView.image = R.image.mist()
        case .ash:
            weatherImageView.image = R.image.mist()
        case .squall:
            weatherImageView.image = R.image.mist()
        case .tornado:
            weatherImageView.image = R.image.mist()
        case .unknow:
            break
        }
    }
}
