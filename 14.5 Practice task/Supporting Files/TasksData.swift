//
//  TasksData.swift
//  14.5 Practice task
//
//  Created by Alex Aytov on 2/20/23.
//

import UIKit

// MARK: - TaskOne Data

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

// MARK: - TaskTwo Data

struct NewsRecordModel {
    let title: String
    let publishedAt: String
}

let models: [NewsRecordModel] = [
    NewsRecordModel(
        title: "Airbus Ventures invests in Tokyo-based ispace",
        publishedAt: "2021-10-25T11:23:09.000Z"
    ),
    NewsRecordModel(
        title: "SpaceX fires up first upgraded Starship engine",
        publishedAt: "2021-10-25T09:13:32.000Z"
    ),
    NewsRecordModel(
        title: "IAI announces new small GEO satellite bus",
        publishedAt: "2021-10-25T08:33:11.000Z"
    ),
    NewsRecordModel(
        title: "Here’s how SpaceX is (probably) going to refuel Starships in space",
        publishedAt: "2021-10-24T19:53:33.000Z"
    ),
    NewsRecordModel(
        title: "Chang Zheng 3B lifts Shijian 21 to orbit",
        publishedAt: "2021-10-24T18:26:25.000Z"
    ),
    NewsRecordModel(
        title: "BepiColombo completes first Mercury flyby, science provides insight into planet’s unique environment",
        publishedAt: "2021-10-24T17:22:02.000Z"
    ),
    NewsRecordModel(
        title: "China launches classified space debris mitigation technology satellite",
        publishedAt: "2021-10-24T10:23:11.000Z"
    ),
    NewsRecordModel(
        title: "Arianespace breaks payload mass record on final Ariane 5 launch before Webb",
        publishedAt: "2021-10-24T08:13:08.000Z"
    ),
    NewsRecordModel(
        title: "Conference seeks to build interest in space among elected officials",
        publishedAt: "2021-10-24T02:23:10.000Z"
    ),
    NewsRecordModel(
        title: "Ariane 5 launches civilian, military satellites; mission to clear way for James Webb launch",
        publishedAt: "2021-10-23T21:10:54.000Z"
    ),
    NewsRecordModel(
        title: "Under watchful eye of NASA, teams prep for final Ariane 5 flight before Webb",
        publishedAt: "2021-10-23T19:13:07.000Z"
    ),
    NewsRecordModel(
        title: "NASA sets Artemis 1 launch for no earlier than February",
        publishedAt: "2021-10-23T03:33:12.000Z"
    ),
    NewsRecordModel(
        title: "L3 Harris wins $120 million contract to upgrade Space Force electronic jammers",
        publishedAt: "2021-10-22T23:13:11.000Z"
    ),
    NewsRecordModel(
        title: "NASA targets February launch for Artemis 1 moon mission",
        publishedAt: "2021-10-22T20:33:07.000Z"
    ),
    NewsRecordModel(
        title: "NASA Commits $28 Million to Underfunded US Jurisdictions",
        publishedAt: "2021-10-22T20:23:00.000Z"
    ),
    NewsRecordModel(
        title: "Ship 20 completes milestone RVac Static Fire – Musk cites ambitious path to launch",
        publishedAt: "2021-10-22T20:09:14.000Z"
    ),
    NewsRecordModel(
        title: "China’s hypersonic vehicle test a ‘significant demonstration’ of space technology",
        publishedAt: "2021-10-22T19:23:10.000Z"
    ),
    NewsRecordModel(
        title: "Space Adventures no longer planning Crew Dragon flight",
        publishedAt: "2021-10-22T19:23:10.000Z"
    ),
    NewsRecordModel(
        title: "NASA Invites Media to Launch of IXPE Mission to Study X-rays in Space",
        publishedAt: "2021-10-22T18:33:00.000Z"
    ),
    NewsRecordModel(
        title: "Ariane 5 launch delayed for more ground systems checks",
        publishedAt: "2021-10-22T16:43:06.000Z"
    )
]

struct NewsRecords {
    let title: String
    let publishedAt: Date
    // здесь свойство dateString для проверки преобразования строки в объект Date
    let dateString: String
}

class TaskTwoData {
    var formatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = Constants.DateFormat.forSection
        return formatter
    }()
    
    func loadData() -> [String: [NewsRecords]] {
        // формируем массив из объектов типа NewsRecords
        let arrayNewsRecords = models.map {
            NewsRecords(title:       $0.title,
                        publishedAt: $0.publishedAt.toDate(.isoDateTimeMilliSec) ?? Date(timeIntervalSince1970: 0),
                        dateString:  $0.publishedAt
            )
        }
        
        let elements = Dictionary(grouping: arrayNewsRecords) {
            // ключами словаря будут строки, полученные от formatter (задаётся Constants.DateFormat.forSection)
            formatter.string(from: $0.publishedAt)
        }
        return elements
    }
}

extension String {
        public enum DateFormatType {
        
        /// The ISO8601 formatted year "yyyy" i.e. 1997
        case isoYear
        
        /// The ISO8601 formatted year and month "yyyy-MM" i.e. 1997-07
        case isoYearMonth
        
        /// The ISO8601 formatted date "yyyy-MM-dd" i.e. 1997-07-16
        case isoDate
        
        /// The ISO8601 formatted date and time "yyyy-MM-dd'T'HH:mmZ" i.e. 1997-07-16T19:20+01:00
        case isoDateTime
        
        /// The ISO8601 formatted date, time and sec "yyyy-MM-dd'T'HH:mm:ssZ" i.e. 1997-07-16T19:20:30+01:00
        case isoDateTimeSec
        
        /// The ISO8601 formatted date, time and millisec "yyyy-MM-dd'T'HH:mm:ss.SSSZ" i.e. 1997-07-16T19:20:30.45+01:00
        case isoDateTimeMilliSec
        
        /// The dotNet formatted date "/Date(%d%d)/" i.e. "/Date(1268123281843)/"
        case dotNet
        
        /// The RSS formatted date "EEE, d MMM yyyy HH:mm:ss ZZZ" i.e. "Fri, 09 Sep 2011 15:26:08 +0200"
        case rss
        
        /// The Alternative RSS formatted date "d MMM yyyy HH:mm:ss ZZZ" i.e. "09 Sep 2011 15:26:08 +0200"
        case altRSS
        
        /// The http header formatted date "EEE, dd MM yyyy HH:mm:ss ZZZ" i.e. "Tue, 15 Nov 1994 12:45:26 GMT"
        case httpHeader
        
        /// A generic standard format date i.e. "EEE MMM dd HH:mm:ss Z yyyy"
        case standard
        
        /// A custom date format string
        case custom(String)
        
        /// The local formatted date and time "yyyy-MM-dd HH:mm:ss" i.e. 1997-07-16 19:20:00
        case localDateTimeSec
        
        /// The local formatted date  "yyyy-MM-dd" i.e. 1997-07-16
        case localDate
        
        /// The local formatted  time "hh:mm a" i.e. 07:20 am
        case localTimeWithNoon
        
        /// The local formatted date and time "yyyyMMddHHmmss" i.e. 19970716192000
        case localPhotoSave
        
        case birthDateFormatOne
        
        case birthDateFormatTwo
        
        ///
        case messageRTetriveFormat
        
        ///
        case emailTimePreview
        
        var stringFormat:String {
          switch self {
          //handle iso Time
          case .birthDateFormatOne: return "dd/MM/YYYY"
          case .birthDateFormatTwo: return "dd-MM-YYYY"
          case .isoYear: return "yyyy"
          case .isoYearMonth: return "yyyy-MM"
          case .isoDate: return "yyyy-MM-dd"
          case .isoDateTime: return "yyyy-MM-dd'T'HH:mmZ"
          case .isoDateTimeSec: return "yyyy-MM-dd'T'HH:mm:ssZ"
          case .isoDateTimeMilliSec: return "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
          case .dotNet: return "/Date(%d%f)/"
          case .rss: return "EEE, d MMM yyyy HH:mm:ss ZZZ"
          case .altRSS: return "d MMM yyyy HH:mm:ss ZZZ"
          case .httpHeader: return "EEE, dd MM yyyy HH:mm:ss ZZZ"
          case .standard: return "EEE MMM dd HH:mm:ss Z yyyy"
          case .custom(let customFormat): return customFormat
            
          //handle local Time
          case .localDateTimeSec: return "yyyy-MM-dd HH:mm:ss"
          case .localTimeWithNoon: return "hh:mm a"
          case .localDate: return "yyyy-MM-dd"
          case .localPhotoSave: return "yyyyMMddHHmmss"
          case .messageRTetriveFormat: return "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
          case .emailTimePreview: return "dd MMM yyyy, h:mm a"
          }
        }
 }
        
 func toDate(_ format: DateFormatType = .isoDate) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.stringFormat
        let date = dateFormatter.date(from: self)
        return date
  }
 }

// MARK: - TaskThree Data

struct NewsWithLocationModel {
    let name: String
    let description: String
    let location: String
}

let modelsThree: [NewsWithLocationModel] = [
    NewsWithLocationModel(
        name: "2017 NASA Astronaut class graduation ceremony 2017 NASA Astronaut class graduation ceremony",
        description: "NASA will honor the first class of astronaut candidates to graduate under the Artemis program at 10:30 a.m. EST Friday, Jan. 10, at the agency’s Johnson Space Center in Houston. After completing more than two years of basic training, these candidates will become eligible for spaceflight, including assignments to the International Space Station, Artemis missions to the Moon, and ultimately, missions to Mars.",
        location: "NASA's Johnson Space Center, Houston, TX, USA"
    ),
    NewsWithLocationModel(
        name: "70th International Astronautical Congress",
        description: "The International Astronautical Congress is a yearly conference where key figures in the space industry meet and showcase/discuss events in the spaceflight industry.\r\n\r\nThe event lasts starts on 21st October and lasts a week. Some of the panels will be live streamed for free on NASA TV.",
        location: "Washington D.C, United States"
      ),
    NewsWithLocationModel(
        name: "8th meeting of the National Space Council",
        description: "US Vice President Mike Pence will convene the 8th meeting of the National Space Council at NASA's Kennedy Space Center on December 9 at 12:30 p.m. ET. \r\n\r\nThe meeting will be livestreamed on NASA TV.",
        location: "Kennedy Space Center"
    ),
    NewsWithLocationModel(
        name: "Apollo 11th 50th Anniversary - Lunar Landing",
        description: "The United States' Apollo 11 was the first crewed mission to land on the Moon, on 20 July 1969. To date, the United States is the only country to have successfully conducted crewed missions to the Moon, with the last departing the lunar surface in December 1972.\r\n\r\nA total of twelve men have landed on the Moon. This was accomplished with two US pilot-astronauts flying a Lunar Module on each of six NASA missions across a 41-month period starting 20 July 1969 UTC, with Neil Armstrong and Buzz Aldrin on Apollo 11, and ending on 14 December 1972 UTC with Gene Cernan and Jack Schmitt on Apollo 17. Cernan was the last to step off the lunar surface.",
        location: "Lunar Surface"
    ),
    NewsWithLocationModel(
        name: "Apollo 12: 50th Anniversary Coverage",
        description: "Apollo 12 50th anniversary has a commemorative stream for the launch beginning at 11am EST. \r\n\r\nThe launch will take place at 11:42am.\r\n\r\n\"The second Apollo crew built on the work of the first. In addition to continuing Apollo's lunar exploration tasks they deployed the Apollo Lunar Surface Experiments Package, a set of investigations left on the Moon's surface to gather data. On their way to the Moon, the Apollo 12 crew conducted an orbital maneuver that let them land in the Moon's Western Hemisphere, so they could recover portions of a lander that had been on the moon for two years.\" - NASA",
        location: "NASA TV"
    ),
    NewsWithLocationModel(
        name: "Arianespace VV17 failure press conference",
        description: "8 minutes after liftoff of Vega mission VV17, following the first ignition of the engine of the Avum upper stage, a deviation of trajectory was identified, entailing the loss of the mission. There will be a press conference Tuesday, November 17th, 2020 at 10:00 am Kourou time / 2:00 pm Paris time.",
        location: "Guyana Space Center, Kourou, French Guiana"
    ),
    NewsWithLocationModel(
        name: "BepiColombo Earth Flyby",
        description: "The ESA-JAXA BepiColombo mission made a close approach of Earth on April 10, 2020 at 04:25 UTC. Gravity assist flybys are needed to set the spacecraft on course for Mercury orbit.",
        location: "Earth"
    )
]

class TaskThreeData {
    
    func loadData() -> [NewsWithLocationModel] {
        modelsThree
    }
}
