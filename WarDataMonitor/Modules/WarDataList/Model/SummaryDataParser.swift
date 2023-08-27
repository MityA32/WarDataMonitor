//
//  SummaryDataParser.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

class SummaryDataParser {
    
    func parseSummaryPersonnelModelToSummaryPersonnel(_ model: SummaryPersonnelModel) -> SummaryPersonnel {
        let powValue: String
        switch model.pow {
            case .number(let value):
                powValue = "\(value)"
            case .none:
                powValue = "No info"
        }
        
        return SummaryPersonnel(date: model.date.changeDateFormat(),
                                day: model.day,
                                personnel: model.personnel,
                                personnelAbout: model.personnelAbout,
                                pow: powValue)
    }
    
}
