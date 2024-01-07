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
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date, displayedComponents: [.date])
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Definitely").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            HStack {
                TextField("Add a new sight in \(destination.name)",
                          text: $newSightName)
                Button("Add", action: addSight)
            }
            
            Section("Sights") {
                ForEach(destination.sights) { sight in
                    Text(sight.name)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else {return}
        
        withAnimation {
            let sight = SightModel(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
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
