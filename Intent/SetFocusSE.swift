//
//  SetFocusSE.swift
//  Customize Search Engine
//
//  Created by Cizzuk on 2025/01/24.
//

import AppIntents

@available(iOS 16.0, macOS 13.0, *)
struct SetFocusSE : SetFocusFilterIntent {
    static var title: LocalizedStringResource = "Set Search Engine"
    static var description: LocalizedStringResource = "Sets a Custom Search Engine to be used during this Focus."
    
    @Parameter(title: "URL", description: "Blank to disable CSE", default: "")
        var cseURL: String
    
    @Parameter(title: "Disable Percent-encoding", default: false)
        var disablePercentEncoding: Bool
    
    @Parameter(title: "Max Query Length", description: "Blank to disable", default: nil)
        var maxQueryLength: Int?
    
    @Parameter(title: "Quick Search", default: nil)
        var useQuickCSE: Bool?
    
    @Parameter(title: "Emoji Search", default: nil)
        var useEmojiSearch: Bool?
    
    var displayRepresentation: DisplayRepresentation {
        var subtitle = LocalizedStringResource("")
        
        if self.cseURL == "" {
            if useQuickCSE ?? false || useEmojiSearch ?? false {
                subtitle = LocalizedStringResource("Disable Default Search Engine")
            } else {
                subtitle = LocalizedStringResource("Disable CSE")
            }
        } else {
            subtitle = LocalizedStringResource("\(self.cseURL)")
        }
        
        return DisplayRepresentation(title: SetFocusSE.title, subtitle: subtitle)
    }
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
