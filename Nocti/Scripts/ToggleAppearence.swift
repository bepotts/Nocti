//
//  ToggleAppearence.swift
//  Nocti
//
//  Created by Brandon Potts on 10/3/25.
//

import Cocoa

func toggleDarkMode() {
    let script = """
    tell application "System Events"
        if not (running) then launch
        delay 1
        tell appearance preferences
            set dark mode to true
        end tell
    end tell
    """
    executeAppleScript(script)
}

func toggleLightMode() {
    let script = """
    tell application "System Events" 
        tell appearance preferences
            set dark mode to true
        end tell
    end tell
    """
    executeAppleScript(script)
}

func executeAppleScript(_ script: String) {
    if let appleScript = NSAppleScript(source: script) {
        var error: NSDictionary?
        appleScript.executeAndReturnError(&error)
        if let error = error {
            print("AppleScript error: \(error)")
        }
    }
}
