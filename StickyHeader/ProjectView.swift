//
//  ProjectView.swift
//  StickyHeader
//
//  Created by user on 04/08/2021.
//

import SwiftUI

struct ProjectView: View {
    let project: Project
    
    var body: some View {
        HStack(spacing: 15){
            Circle()
                .fill(project.tintColor)
                .frame(width: 50, height: 100)
                .opacity(0.8)
            
            VStack(alignment: .leading, spacing: 15){
                Text(project.name)
                    .fontWeight(.bold)
                
                Text(project.shortDescription)
                    .foregroundColor(.secondary)
            }
           
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        
       
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(project: projects[0])
    }
}
