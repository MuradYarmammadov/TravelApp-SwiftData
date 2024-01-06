//
//  ContentView.swift
//  TravelApp SwiftUI
//
//  Created by Murad Yarmamedov on 07.01.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [DestinationModel]
    @State private var path = [DestinationModel]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(destinations) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading){
                            Text(destination.name)
                                .font(.headline)
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
            .navigationTitle("TravelTracer")
            .navigationDestination(for: DestinationModel.self, destination: EditDestinationView.init)
            .toolbar {
                Button("Add Destination", systemImage: "plus", action: addDestination)
            }
        }
    }
    
    func addDestination() {
        let destination = DestinationModel()
        modelContext.insert(destination)
        path = [destination]
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}

