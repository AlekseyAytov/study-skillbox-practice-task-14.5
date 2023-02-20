//
//  Constants.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 12/27/22.
//

import UIKit

enum Constants {
    enum Colors {
        static var darkBlue: UIColor = UIColor(red: 0.39, green: 0.40, blue: 0.49, alpha: 1.00)
        static var blue: UIColor = UIColor(red: 0.55, green: 0.56, blue: 0.65, alpha: 1.00)
        static var lightBlue: UIColor = UIColor(red: 0.31, green: 0.85, blue: 0.84, alpha: 1.00)
    }
    
    
// How to adding a Custom Font to App -> https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app
    
// Примечание: Ubuntu шрифты только латиница
    enum Fonts {
        static var u30Bold: UIFont? {
            UIFont(name: "Ubuntu-Bold", size: 30 )
        }
        
        static var u30Medium: UIFont? {
            UIFont(name: "Ubuntu-Medium", size: 30 )
        }
        
        static var u24Regular: UIFont? {
            UIFont(name: "Ubuntu-Regular", size: 24 )
        }
        
        static var ui16Semi: UIFont? {
            UIFont(name: "Inter-SemiBold", size: 16 )
        }
        
        static var u16Medium: UIFont? {
            UIFont(name: "Ubuntu-Medium", size: 16 )
        }
        
        static var ui16Regular: UIFont? {
            UIFont(name: "Inter-Regular", size: 16 )
        }
        
        static var ui14Semi: UIFont? {
            UIFont(name: "Inter-SemiBold", size: 14 )
        }
        
        static var ui14Medium: UIFont? {
            UIFont(name: "Inter-Medium", size: 14 )
        }
        
        static var ui14Regular: UIFont? {
            UIFont(name: "Inter-Regular", size: 14 )
        }
        
        static var ui10Regular: UIFont? {
            UIFont(name: "Inter-Regular", size: 10 )
        }
    }
}

let countryNames: [String: [String]] = [
    "Austria": ["Innsbruck", "Linz", "Salzburg", "Vienna"],
    "Belgium": ["Antwerp", "Brussels", "Ghent", "Leuven"],
    "Kazakhstan": ["Aktau", "Almaty", "Astana"],
    "France": ["Lyon", "Marseille", "Nice", "Paris"],
    "Russia": ["Moscow", "Kazan", "Novosibirsk", "Vladivostok", "Yekaterinburg"],
    "Germany": ["Berlin", "Hamburg", "Munich"],
    "Greece": ["Athens", "Patras", "Thessaloniki"],
]


struct City {
    var title: String
    var imageName: String
    var description: String
}

struct Country {
    var title: String
    var imageName: String
    var cities: [City]
}

class TaskOneData {

    func loadData() -> [Country] {
        var elements: [Country] = []
        for item in countryNames {
            elements.append( Country(
                title: item.key,
                imageName: item.key,
                cities: item.value.map {
                    City(title: $0,
                         imageName: $0,
                         description: $0)
                }))
        }
        return elements
    }
}
