//
//  Classroom.swift
//  AmazeApp
//
//  Created by Mr Jeff on 1/18/22.
//

import Foundation

struct Classroom: Identifiable, Codable {
    let id = UUID()
    var roomNumber: Int
    var capicity: Int
    var student: Student
}

