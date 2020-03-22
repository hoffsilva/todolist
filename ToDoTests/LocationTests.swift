//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Hoff Henry Pereira da Silva on 19/03/20.
//  Copyright © 2020 EBANX. All rights reserved.
//

import XCTest
import MapKit

@testable import ToDo
class LocationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Init_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_Init_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "",
                                coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        XCTAssertEqual(first, second)
    }

    func test_Locations_WhenLatitudeDiffers_AreNoteEqual() {
        assertLocationNotEquealWith(
            firstName: "Foo", firstLonLat: (0, 1), secondName: "Foo", secondLongLat: (0, 0))
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNoteEqual() {
        assertLocationNotEquealWith(
            firstName: "Foo", firstLonLat: (1, 0), secondName: "Foo", secondLongLat: (0, 0))
    }
    
    func test_Locations_WhenOnlyOneHasCoordinate_ArenotEqual() {
        assertLocationNotEquealWith(
        firstName: "Foo", firstLonLat: (0, 0), secondName: "Foo", secondLongLat: nil)
    }
    
    func test_Locations_WhenNamesDiffers_AreNotEqual() {
        assertLocationNotEquealWith(
        firstName: "Foo", firstLonLat: nil, secondName: "Bar", secondLongLat: nil)
    }
    
    func assertLocationNotEquealWith(firstName: String, firstLonLat: (Double, Double)?, secondName: String, secondLongLat: (Double, Double)?, line: UInt = #line) {
        var firstCoord: CLLocationCoordinate2D? = nil
        
        if let firstLongLat = firstLonLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0, longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName, coordinate: firstCoord)
        
        var secondCoord: CLLocationCoordinate2D? = nil
        
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0, longitude: secondLongLat.1)
        }
        
        let secondLocation = Location(name: secondName, coordinate: secondCoord)
        
        XCTAssertNotEqual(firstLocation, secondLocation, String(line))
    }
    
}
