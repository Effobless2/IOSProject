//
//  ElementList.swift
//  IOSProject
//
//  Created by Developer on 09/07/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import SwiftUI

struct ElementList: View {
    @State var elements: [MyElement];
    var body: some View {
        List(self.elements) { element in
            Text("\(element.name)")
        }
    }
}

struct ElementList_Previews: PreviewProvider {
    static var previews: some View {
        ElementList(elements: [])
    }
}
