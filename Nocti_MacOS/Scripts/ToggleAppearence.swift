//
//  ToggleAppearence.swift
//  Nocti
//
//  Created by Brandon Potts on 10/3/25.
//

import Cocoa

func setDarkMode() {
    let script = """
    tell application "System Events"
        tell appearance preferences
            set dark mode to true
        end tell
    end tell
    """
    executeAppleScript(script)
}

func setLightMode() {
    let script = """
    tell application "System Events"
        tell appearance preferences
            set dark mode to false
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
        } else {
            print("Script executed successfully")
        }
    }
}
