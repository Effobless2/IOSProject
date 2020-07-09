//
//  MyCollection.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

class MyCollection {
    private var elements: [MyElement];
    var name: String;
    
    init(name: String) {
        self.name = name;
        elements = []
    }
    
    init(name: String, elements: [MyElement]) {
        self.name = name;
        self.elements = elements;
    }
    
    func add(_ element: MyElement) {
        elements.append(element);
    }
    
    func all() -> [MyElement] {
        return elements;
    }
}
