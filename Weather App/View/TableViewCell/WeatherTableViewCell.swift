//
//  WeatherTableViewCell.swift
//  Weather App
//
//  Created by Aizaz Abbasi on 19/02/2022.
//

import UIKit
class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var temp_minLbl: UILabel!
    @IBOutlet weak var temp_maxLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    
    @IBOutlet weak var iconImg: UIImageView!
    
    var weatherDay : Daily?{
        didSet {
            dayLbl.text = "\(weatherDay?.temp.day ?? 0)"
            tempLbl.text = "\(weatherDay?.temp.min ?? 0)"
            temp_minLbl.text = "\(weatherDay?.temp.min ?? 0)"
            temp_minLbl.text = "\(weatherDay?.temp.max ?? 0)"
            humidityLbl.text = "\(weatherDay?.humidity ?? 0)"
            iconImg.image = UIImage(named: weatherDay?.weather[0].icon ?? "01n")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
