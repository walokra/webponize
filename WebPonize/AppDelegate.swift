import Cocoa
import Settings

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    static var statusList: [Status] = []
    static var queue = OperationQueue()
    
    lazy var mainWindowController = MainWindowController()
    lazy var preferencesWindowController = SettingsWindowController(
        panes: [
            GeneralPreferenceViewController()
        ],
        style: .toolbarItems
    )
    
    override init() {
        super.init()

        AppDelegate.queue.maxConcurrentOperationCount = 1
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindowController.showWindow(self)
        mainWindowController.alignToCenter()
    }
        
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func application(_ application: NSApplication, open urls: [URL]) {
        ConvertManager.openSavePanel(for: mainWindowController.window!, target: urls)
    }
    
    @IBAction
    func preferencesMenuItemActionHandler(_ sender: NSMenuItem) {
        preferencesWindowController.show()
    }
}

