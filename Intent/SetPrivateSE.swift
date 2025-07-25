//
//  SetPrivateSE.swift
//  Customize Search Engine
//
//  Created by Cizzuk on 2025/01/24.
//

import Foundation
import AppIntents

struct SetPrivateSE: AppIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "SetPrivateSE"
    static var title: LocalizedStringResource = "Set Private Search Engine"
    static var description: LocalizedStringResource = "Sets a Custom Private Search Engine on CSE."
    
    @Parameter(title: "URL", description: "Blank to disable", default: "")
        var cseURL: String
    
    @Parameter(title: "Disable Percent-encoding", default: false)
        var disablePercentEncoding: Bool
    
    @Parameter(title: "Max Query Length", description: "Blank to disable", default: nil)
        var maxQueryLength: Int?

    func perform() async throws -> some IntentResult {
        let userDefaults = CSEDataManager.userDefaults
        if cseURL.isEmpty {
            userDefaults.set(false, forKey: "usePrivateCSE")
        } else {
            userDefaults.set(true, forKey: "usePrivateCSE")
        }
        
        let cseData = CSEDataManager.CSEData(
            url: cseURL,
            disablePercentEncoding: disablePercentEncoding,
            maxQueryLength: maxQueryLength
        )
        
        CSEDataManager.saveCSEData(cseData, .privateCSE)
        
        return .result()
    }
}
