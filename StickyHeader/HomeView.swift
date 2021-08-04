//
//  HomeView.swift
//  StickyHeader
//
//  Created by user on 03/08/2021.
//

import SwiftUI

struct TopBar: View {
    let maxHeight: CGFloat
    let topEdge: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Image("rajan")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(10)
            
            Text("Rajan Twanabashu")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            Text("With years of experience in software development for various platform such as mobile application development (iOS, android, react native), java, php, and embedded c for embedded system have made me pretty sound at choosing right architect, design and platform for any software solution.")
                .font(.body)
                .foregroundColor(Color.white.opacity(0.8))
            
        }
        .padding()
        .opacity(Double(getOpacoty()))
        //.background(Color.red)
        //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .frame(maxWidth: .infinity)
        .frame(height:  getHeaderHeight()  , alignment: .bottomLeading)
        .background(
            CustomCorner(corners: [.bottomRight], radius: getCornerRadius()).fill(Color.orange)
        )
        
    }
    
    func getHeaderHeight()-> CGFloat {
        let topHeight = maxHeight + offset
        
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getOpacoty()-> CGFloat {
       
        let progress = -offset / 70
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1

    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value =  1 - progress
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
}

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
struct HomeView: View {
    let maxHeight: CGFloat =  UIScreen.main.bounds.height / 2.0
    let topEdge: CGFloat
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                //Top Nav View
                GeometryReader { reader in
                    TopBar(maxHeight: maxHeight, topEdge: topEdge, offset:$offset)
                        .overlay(
                            HStack {
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                })
                                
                                Image("rajan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .opacity(Double(topBarTitleOpacity()))
                                
                                Text("Rajan Twanabashu")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(Double(topBarTitleOpacity()))
                                    
                                Spacer()
                                
                                
                                
                            }
                            .frame(height: 80 + topEdge)
                            .foregroundColor(Color.white)
                            .padding(.horizontal)
                            , alignment: .top
                        )
                }
                .frame(height: maxHeight)
                //--fixing top scroll offset
                .offset(x: 0, y: -offset)
                .zIndex(1)
                
                VStack {
                    ForEach(projects, id: \.self) { project in
                        ProjectView(project: project)
                    }
                }
                
                
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        //--setting coordinate space
        .coordinateSpace(name: "SCROLL")
    }
    
    func topBarTitleOpacity() -> CGFloat {
        let progress = -(offset + 70) / (maxHeight - (80 + topEdge))
        
        return progress
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
