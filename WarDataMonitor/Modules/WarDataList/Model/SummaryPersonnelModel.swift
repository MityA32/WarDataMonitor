//
//  SummaryPersonnelModel.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

struct SummaryPersonnelModel: Codable {
    
    let date: String
    var day: Int
    let personnel: Int
    let personnelAbout: String
    let pow: POWQuantityInfo
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case personnelAbout = "personnel*"
        case pow = "POW"
    }
    
}

extension SummaryPersonnelModel {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try values.decode(String.self, forKey: .date)
        self.day = try values.decode(Int.self, forKey: .day)
        self.personnel = try values.decode(Int.self, forKey: .personnel)
        self.personnelAbout = try values.decode(String.self, forKey: .personnelAbout)
        if let pow = try? values.decode(Int?.self, forKey: .pow) {
            self.pow = .number(pow)
        } else {
            self.pow = .none
        }
    }
    
    func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(date, forKey: .date)
           try container.encode(day, forKey: .day)
           try container.encode(personnel, forKey: .personnel)
           try container.encode(personnelAbout, forKey: .personnelAbout)
           switch pow {
               case .number(let value):
                   try container.encode(value, forKey: .pow)
               case .none:
                   break
           }
       }
    
}
