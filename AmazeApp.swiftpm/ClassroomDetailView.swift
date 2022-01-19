//
//  ClassroomDetailView.swift
//  AmazeApp
//
//  Created by Mr Jeff on 1/19/22.
//

import SwiftUI

struct ClassroomDetailView: View {
    var classroom: Classroom
    var body: some View {
        VStack {
            Text("Room Number: \(classroom.roomNumber)")
            Text("Capacity: \(classroom.capicity)")
            Text("Student Name: \(classroom.student.name)")
            Text("Student Grade: \(classroom.student.grade)")
            Spacer()
        }
        
    }
}
