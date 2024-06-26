//
//  ContentView.swift
//  microhabitat
//
//  Created by Daiki Takano on 2024/05/06.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var context

  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default
  ) private var items: FetchedResults<Item>

  var body: some View {
    NavigationView {
      List {
        ForEach(items) { item in
          NavigationLink {
            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
          } label: {
            Text(item.timestamp!, formatter: itemFormatter)
          }
        }
        .onDelete(perform: deleteItems)
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        ToolbarItem {
          Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
    }
  }

  private func addItem() {
    withAnimation {
      let newItem = Item(context: context)
      newItem.timestamp = Date()

      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(context.delete)

      do {
        try context.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

#Preview {
  ContentView()
    .environment(
      \.managedObjectContext,
      PersistenceController.preview.container.viewContext
    )
}

