//
//  MainView.swift
//  PlantApp
//
//  Created by Seungchul Ha on 2023/01/05.
//

import SwiftUI

struct MainView: View {
    
    // MARK: View Properties
    @State var currentTab: Tab = .home
    @Namespace var animation
    
    init() {
        // MARK: For Hiding Native Tab Bar
        // As of Xcode 14.1 Beta .toolbar(.hidden) is broken for Native SwiftUI TabView
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentTab) {
                Home()
                    .setTabBarBackground(color: Color("BG"))
                    .tag(Tab.home)
                
                Text("Scan")
                    .setTabBarBackground(color: Color("BG"))
                    .tag(Tab.scan)
                
                Text("Files")
                    .setTabBarBackground(color: Color("BG"))
                    .tag(Tab.folder)
                
                Text("Cart")
                    .setTabBarBackground(color: Color("BG"))
                    .tag(Tab.cart)
            }
            TabBar()
        }
		.ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    // MARK: Custom Tab Bar
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Image(tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.5))
                    .offset(y: currentTab == tab ? -30 : 0)
                    .background(content: {
                        if currentTab == tab {
                            Circle()
                                .fill(.black)
                                .scaleEffect(2.5)
                                .shadow(color: .black.opacity(0.3), radius: 8, x: 5, y: 10)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                                .offset(y: currentTab == tab ? -30 : 0)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        currentTab = tab
                    }
            }
        }
        .padding(.horizontal, 15)
        .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.65), value: currentTab)
        .background {
            // MARK: Custom Corner
            CustomerCorner(corners: [.topLeft, .topRight], radius: 25)
                .fill(Color("Tab"))
                .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Extension for Setting Tab View Background
extension View {
    @ViewBuilder
    func setTabBarBackground(color: Color) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                color
                    .ignoresSafeArea()
            }
    }
}
