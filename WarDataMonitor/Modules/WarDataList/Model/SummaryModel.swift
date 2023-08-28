//
//  SummaryModel.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

final class SummaryModel {
    
    private let dataFetcher = SummaryDataFetcher()
    private let dataParser = SummaryDataParser()
    
    var personnelInfo = [SummaryPersonnel]()
    var equipmentInfo = [SummaryEquipment]()
    var didUpdatedPersonnelInfoList: (() -> Void)?
    
    init() {
        fetchPersonnelInfo()
        fetchEquipmentInfo()
    }
    
    func fetchPersonnelInfo() {
        dataFetcher.readJSONFromGitHub(
            username: WarDataRequest.username,
            repository: WarDataRequest.repository,
            branch: WarDataRequest.branch,
            filePath: WarDataRequest.personnelFilePath,
            dataType: SummaryPersonnelModel.self,
            completion: { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let jsonData):
                    jsonData.forEach {
                        self.personnelInfo.append(self.dataParser.parseSummaryPersonnelModelToSummaryPersonnel($0))
                    }
                    didUpdatedPersonnelInfoList?()
                case .failure(let error):
                    print("Error: \(error)")
                }
            })
    }
    
    func fetchEquipmentInfo() {
        dataFetcher.readJSONFromGitHub(
            username: WarDataRequest.username,
            repository: WarDataRequest.repository,
            branch: WarDataRequest.branch,
            filePath: WarDataRequest.equipmentFilePath,
            dataType: SummaryEquipmentModel.self,
            completion: { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let jsonData):
                    jsonData.forEach {
                        self.equipmentInfo.append(SummaryEquipment(from: $0))
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
            })
    }
}
