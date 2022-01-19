//
//  AddClassroomView.swift
//  AmazeApp
//
//  Created by Mr Jeff on 1/18/22.
//

import SwiftUI

struct AddClassroomView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var store: DataStore
    @State private var roomNumber = ""
    @State private var capacity = ""
    @State private var studentName = ""
    @State private var studentGrade = ""
    
    var body: some View {
        VStack {
            TextField("Room Number", text: $roomNumber)   // 1
            TextField("Capacity", text: $capacity)
            TextField("Student Name", text: $studentName)
            TextField("Student Grade", text: $studentGrade)
            
            Button("Done") {
                // Input validation needed
                let student = Student(
                    name: studentName,
                    grade: Int(studentGrade)!
                )
                let classroom = Classroom(
                    roomNumber: Int(roomNumber)!,
                    capicity: Int(capacity)!,
                    student: student
                )
                store.classrooms.append(classroom)
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

//struct AddThingView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddThingView(someThings: .constant(ThingStore()))
//        
//    }
//}
