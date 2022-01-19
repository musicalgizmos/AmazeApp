import SwiftUI

let jsonStringFileName = "myJsonString.json"

@main
struct MyApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject var store = DataStore()

    func makeJSONstring() -> String? {
        do {
            let encodedData = try JSONEncoder().encode(store.classrooms)
            let jsonString = String(data: encodedData,
                                    encoding: .utf8)
            return jsonString
        } catch { return nil } // Error
    }
    
    func saveJSONtoDisc() {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                               in: .userDomainMask).first {
            let filenameWithPath = documentDirectory.appendingPathComponent(jsonStringFileName)
            do {
                try makeJSONstring()?.write(to: filenameWithPath,
                                     atomically: true,
                                     encoding: .utf8)
            } catch { // Error
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .active {
                    } else if newPhase == .inactive {
                        saveJSONtoDisc()
                    } else if newPhase == .background {
                    }
                }
        }
    }
}

