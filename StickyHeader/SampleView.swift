//
//  SampleView.swift
//  StickyHeader
//
//  Created by user on 03/08/2021.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .frame(width: 300, height: 300, alignment: .topLeading)
//            .offset(x: 0, y: 30.0)
        
        VStack(alignment: .trailing){
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prospect")
                .font(.largeTitle)
        }
        .background(Color.blue)
        .frame(width: 300, height: 300, alignment: .topLeading)
        .background(Color.orange)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
