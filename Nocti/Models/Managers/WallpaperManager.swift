//
//  WallpaperManager.swift
//  Nocti
//
//  Created by Brandon Potts on 9/25/25.
//

// import AppKit
//
// final class WallpaperManager {
//    static let shared = WallpaperManager()
//    private init() {}
//
//    private let defaultsKey = "SavedWallpapersByDisplayID"
//
//    // MARK: - Public API
//
//    /// Save current wallpaper URL + options for all displays
//    func backupCurrentWallpapers() {
//        var payload: [String: [String: Any]] = [:]  // displayID -> { bookmarkData, options }
//
//        for screen in NSScreen.screens {
//            guard let displayID = screen.displayID else { continue }
//
//            let options = NSWorkspace.shared.desktopImageOptions(for: screen) ?? [:]
//            if let url = NSWorkspace.shared.desktopImageURL(for: screen) {
//                // Create a security-scoped bookmark so we can reopen later (sandbox-friendly)
//                do {
//                    let bookmark = try url.bookmarkData(options: [.withSecurityScope],
//                                                        includingResourceValuesForKeys: nil,
//                                                        relativeTo: nil)
//                    payload["\(displayID)"] = [
//                        "bookmarkData": bookmark,
//                        "options": options
//                    ]
//                } catch {
//                    // Fallback: store a plain path if bookmark fails (non-sandbox apps)
//                    payload["\(displayID)"] = [
//                        "path": url.path,
//                        "options": options
//                    ]
//                }
//            } else {
//                // No image URL (e.g., solid color). We can still keep options.
//                payload["\(displayID)"] = [
//                    "options": options
//                ]
//            }
//        }
//
//        UserDefaults.standard.set(payload, forKey: defaultsKey)
//    }
//
//    /// Set a new wallpaper for all displays (or pass a specific screen list if desired)
//    func setWallpaperForAllDisplays(to url: URL, keepPerDisplayOptions: Bool = true) throws {
//        for screen in NSScreen.screens {
//            var opts = NSWorkspace.shared.desktopImageOptions(for: screen) ?? [:]
//            if !keepPerDisplayOptions {
//                // Provide sensible defaults
//                opts[NSWorkspace.DesktopImageOptionKey.imageScaling] = NSImageScaling.scaleProportionallyUpOrDown.rawValue
//                opts[NSWorkspace.DesktopImageOptionKey.allowClipping] = false
//            }
//
//            try NSWorkspace.shared.setDesktopImageURL(url, for: screen, options: opts)
//        }
//    }
//
//    /// Restore previously saved wallpapers (per display)
//    func restorePreviousWallpapers() {
//        guard let payload = UserDefaults.standard.dictionary(forKey: defaultsKey) as? [String: [String: Any]] else { return }
//
//        for screen in NSScreen.screens {
//            guard let displayID = screen.displayID,
//                  let entry = payload["\(displayID)"] else { continue }
//
//            let options = (entry["options"] as? [NSWorkspace.DesktopImageOptionKey: Any]) ?? [:]
//
//            // Resolve URL from bookmark (preferred) or plain path
//            if let bookmark = entry["bookmarkData"] as? Data {
//                do {
//                    var isStale = false
//                    let url = try URL(resolvingBookmarkData: bookmark,
//                                      options: [.withSecurityScope],
//                                      relativeTo: nil,
//                                      bookmarkDataIsStale: &isStale)
//                    let started = url.startAccessingSecurityScopedResource()
//                    defer { if started { url.stopAccessingSecurityScopedResource() } }
//
//                    try NSWorkspace.shared.setDesktopImageURL(url, for: screen, options: options)
//                } catch {
//                    // If resolving bookmark fails, try path fallback
//                    if let path = entry["path"] as? String {
//                        do {
//                            try NSWorkspace.shared.setDesktopImageURL(URL(fileURLWithPath: path), for: screen, options: options)
//                        } catch {
//                            // Couldn’t restore this display; continue
//                        }
//                    }
//                }
//            } else if let path = entry["path"] as? String {
//                do {
//                    try NSWorkspace.shared.setDesktopImageURL(URL(fileURLWithPath: path), for: screen, options: options)
//                } catch {
//                    // Couldn’t restore this display; continue
//                }
//            } else {
//                // No URL saved (e.g., solid color previously). We can’t directly set a pure color with this API.
//                // User could be prompted to pick an image, or you could generate a 1x1 color image file and set that.
//            }
//        }
//    }
// }
//
//// MARK: - Helpers
//
// private extension NSScreen {
//    /// Stable per-screen identifier suitable for dictionary keys
//    var displayID: CGDirectDisplayID? {
//        guard let num = deviceDescription[NSDeviceDescriptionKey("NSScreenNumber")] as? NSNumber else { return nil }
//        return CGDirectDisplayID(truncating: num)
//    }
// }
//
// private extension NSWorkspace {
//    /// Swifty throwing wrapper (AppKit’s version uses NSErrorPointer)
//    func setDesktopImageURL(_ url: URL, for screen: NSScreen, options: [NSWorkspace.DesktopImageOptionKey: Any]) throws {
//        var err: NSError?
//        try setDesktopImageURL(url, for: screen, options: options)
//        if let err { throw err }
//    }
// }
