//
//  EditDestinationView.swift
//  TravelApp SwiftUI
//
//  Created by Murad Yarmamedov on 07.01.24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    @Bindable var destination: DestinationModel
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Definitely").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: DestinationModel.self, configurations: config)
        let example = DestinationModel(name: "Example", details: "BLA BLA BLA something meaningfull description here")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
