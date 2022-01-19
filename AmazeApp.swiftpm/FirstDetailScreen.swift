//
//  File.swift
//  AmazeApp
//
//  Created by Mr Jeff on 12/22/21.
//

import SwiftUI

struct FirstDetailScreen: View {
    @EnvironmentObject private var store: DataStore
    @State private var showAddClassroom = false
    
    var body: some View {
            VStack(spacing: 20) {
                if store.classrooms.isEmpty {
                    Text("Add Classrooms")
                        .foregroundColor(.gray)
                }
                List {
                    ForEach(store.classrooms) { classroom in
                        NavigationLink(destination:ClassroomDetailView(classroom: classroom)) {
                            Text(classroom.student.name)
                        }
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $showAddClassroom) {
                AddClassroomView()
            }
            .navigationTitle("Classrooms")
            .toolbar {
              ToolbarItem {
                // swiftlint:disable:next multiple_closures_with_trailing_closure
                Button(action: { showAddClassroom.toggle() }) {
                  Image(systemName: "plus.circle")
                    .font(.title)
                }
              }
            }
    }
}
