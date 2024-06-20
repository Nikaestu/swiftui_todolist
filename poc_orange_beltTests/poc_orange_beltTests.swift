//
//  poc_orange_beltTests.swift
//  poc_orange_beltTests
//
//  Created by Dylan Le Hir on 11/06/2024.
//

import XCTest
@testable import poc_orange_belt
import SwiftUI
import ViewInspector

final class poc_orange_beltTests: XCTestCase {
    
    // Class Task
    func testTaskInitialiation() {
        // Given
        let id = UUID()
        let taskName = "Sport"
        let task = Task(id: id, name: taskName)
        
        // Then
        XCTAssertEqual(task.name, "Sport")
    }
    
    // Component TileView
    // When isOn equals false
    func testTileViewWhenisOnisFalse() {
        // Given
        let id = UUID()
        let taskName = "Sport"
        let task = Task(id: id, name: taskName)
        let isOn = false
        
        // When
        let tileView = TileView(tileItem: task, deleteAction: {}, isOn: isOn)
        
        // Then
        XCTAssertEqual(tileView.isOn, false)
        XCTAssertEqual(tileView.tileItem.name, "Sport")
        XCTAssertEqual(tileView.textColor, .black)
    }
    
    // When isOn equals true
    func testTileViewWhenisOnisTrue() {
        // Given
        let id = UUID()
        let taskName = "Sport"
        let task = Task(id: id, name: taskName)
        let isOn = true
        
        // When
        let tileView = TileView(tileItem: task, deleteAction: {}, isOn: isOn)
        
        // Then
        XCTAssertEqual(tileView.isOn, true)
        XCTAssertEqual(tileView.tileItem.name, "Sport")
        XCTAssertEqual(tileView.textColor, .gray)
    }
    
    // Component TitleView
    func testTitleView() {
        // Given
        let titleName = "Titre"
        
        // When
        let titleView = TitleView(titleName: titleName)
        
        // Then
        XCTAssertEqual(titleView.titleName, "Titre")
    }
    
    // Component ListView
    // Check two elements in the list
    func testListViewWithTwoElements() {
        // Given
        let uuid1 = UUID()
        let name1 = "Tâche"
        let uuid2 = UUID()
        let name2 = "Tâche 2"
        var tasksList = [Task(id: uuid1, name: name1), Task(id: uuid2, name: name2)]
        let bindingTasksList = Binding<[Task]>(
            get: { tasksList },
            set: { _ in }
        )
        
        // When
        let listView = ListView(tasks: bindingTasksList)
        
        // Then
        do {
            let view = try listView.inspect()
            let tileViews = view.findAll(TileView.self)
            
            XCTAssertEqual(tileViews.count, tasksList.count, "The number of tasks in ListView should match")
        } catch {
            XCTFail("Failed to inspect ListView: \(error)")
        }
        
        // When
        let uuid3 = UUID()
        let name3 = "Tâche 3"
        let tasksAddOne = Task(id: uuid3, name: name3)
        
        tasksList.append(tasksAddOne)
        
        // Then
        do {
            let view = try listView.inspect()
            let tileViews = view.findAll(TileView.self)
            
            XCTAssertEqual(tileViews.count, tasksList.count, "The number of tasks in ListView should match")
        } catch {
            XCTFail("Failed to inspect ListView: \(error)")
        }
    }
    
    // Check add one element in the list
    func testListViewWithAddOneElement() {
        // Given
        let uuid1 = UUID()
        let name1 = "Tâche"
        let uuid2 = UUID()
        let name2 = "Tâche 2"
        var tasksList = [Task(id: uuid1, name: name1), Task(id: uuid2, name: name2)]
        let bindingTasksList = Binding<[Task]>(
            get: { tasksList },
            set: { _ in }
        )
        let uuid3 = UUID()
        let name3 = "Tâche 3"
        let tasksAddOne = Task(id: uuid3, name: name3)
        tasksList.append(tasksAddOne)
        
        // When
        let listView = ListView(tasks: bindingTasksList)
        
        // Then
        do {
            let view = try listView.inspect()
            let tileViews = view.findAll(TileView.self)
            
            XCTAssertEqual(tileViews.count, tasksList.count, "The number of tasks in ListView should match")
        } catch {
            XCTFail("Failed to inspect ListView: \(error)")
        }
    }
    
    // Component CreationTaskView
    func testCreationTaskViewWorks() {
        // Given
        var task = Task(id: UUID(), name: "")
                
        // When
        let taskBinding = Binding<Task?>(
            get: { task },
            set: { task = $0 ?? Task(id: UUID(), name: "") }
        )
        
        // Then
        _ = CreationTaskView(task: taskBinding, onSaveTask: { savedTask in
            XCTAssertEqual(savedTask?.name, "Courir")
        })
    }
}
