//
//  StorageController.swift
//  AmazeApp
//
//  Created by Mr Jeff on 1/17/22.
//

import Foundation


final class DataStore: ObservableObject {
    @Published var classrooms: [Classroom]
    
    init() {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                               in: .userDomainMask).first {
            let filenameWithPath = documentDirectory.appendingPathComponent(jsonStringFileName)
            do {
                let jsonString = try String(contentsOf: filenameWithPath, encoding: .utf8)
                if let dataFromJsonString = jsonString.data(using: .utf8) {
                    let classrooms = try JSONDecoder().decode([Classroom].self,
                                                                from: dataFromJsonString)
                    self.classrooms = classrooms
                } else { self.classrooms = [] }
            }
            catch { self.classrooms = [] }
        } else { self.classrooms = [] }
    }
}



