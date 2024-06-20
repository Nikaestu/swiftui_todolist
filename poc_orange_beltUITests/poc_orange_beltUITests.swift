//
//  poc_orange_beltUITests.swift
//  poc_orange_beltUITests
//
//  Created by Dylan Le Hir on 11/06/2024.
//

import XCTest

final class poc_orange_beltUITests: XCTestCase {

    func testTextFieldUpdatesAndDisplaysTile() {
            // Lancer l'application
            let app = XCUIApplication()
            app.launch()

            // Assurez-vous que vous êtes sur l'écran correct
            // Si nécessaire, naviguez jusqu'à l'écran contenant le TextField

            // Trouver le TextField et cliquer dessus
            let textField = app.textFields["Entrer le nom de la tâche"]
            XCTAssertTrue(textField.exists, "Le TextField n'existe pas")
            textField.tap()

            // Entrer le texte "Courir"
            textField.typeText("Courir")

            // Appuyer sur le bouton Sauvegarder
            let saveButton = app.buttons["Sauvegarder"]
            XCTAssertTrue(saveButton.exists, "Le bouton Sauvegarder n'existe pas")
            saveButton.tap()

            // Attendre l'apparition de la tuile avec le texte "Courir"
            let tile = app.staticTexts["Courir"]
            let exists = NSPredicate(format: "exists == true")

            expectation(for: exists, evaluatedWith: tile, handler: nil)
            waitForExpectations(timeout: 5, handler: nil)

            // Vérifier que la tuile avec le texte "Courir" existe
            XCTAssertTrue(tile.exists, "La tuile avec le texte 'Courir' n'existe pas")
        }
}
