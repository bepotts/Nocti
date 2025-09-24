//
//  Utils.swift
//  Nocti
//
//  Created by Brandon Potts on 9/23/25.
//

import AppKit

func setWallpaper(to url: URL) throws {
    for screen in NSScreen.screens {
        try NSWorkspace.shared.setDesktopImageURL(
            url,
            for: screen,
            options: [
                NSWorkspace.DesktopImageOptionKey.imageScaling:
                    NSImageScaling.scaleProportionallyUpOrDown.rawValue,
                NSWorkspace.DesktopImageOptionKey.allowClipping: true,
            ]
        )
    }
}
