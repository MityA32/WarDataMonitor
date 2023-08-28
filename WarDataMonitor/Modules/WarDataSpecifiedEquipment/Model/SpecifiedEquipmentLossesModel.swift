//
//  SpecifiedEquipmentLossesModel.swift
//  WarDataMonitor
//
//  Created by Dmytro Hetman on 27.08.2023.
//

import Foundation

class SpecifiedEquipmentLossesModel {
    private let dataFetcher = SummaryDataFetcher()
    var specifiedEquipmentList: [EquipmentType: [SpecifiedEquipment]] = [:]
    var didUpdatedPersonnelInfoList: (() -> Void)?
    
    init() {
        fetchSpecifiedEquipmentLosses()
    }
    
    private func fetchSpecifiedEquipmentLosses() {
        dataFetcher.readJSONFromGitHub(
            username: WarDataRequest.username,
            repository: WarDataRequest.repository,
            branch: WarDataRequest.branch,
            filePath: WarDataRequest.specifiedEquipmentLossesFilePath,
            dataType: SpecifiedEquipmentModel.self,
            completion: { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let success):
                    self.specifiedEquipmentList = Dictionary(grouping: success.map { SpecifiedEquipment(from: $0) }, by: { $0.equipmentType })
                    self.didUpdatedPersonnelInfoList?()
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
                
            })
    }
}
