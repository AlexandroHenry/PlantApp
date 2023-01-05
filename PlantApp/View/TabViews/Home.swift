//
//  Home.swift
//  PlantApp
//
//  Created by Seungchul Ha on 2023/01/05.
//

import SwiftUI

struct Home: View {
	
	// MARK: View Properties
	@State var currentIndex: Int = 0
	
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(spacing: 15) {
				HeaderView()
				
				SearchView()
				
				PlantsView()
			}
			.padding(15)
			// MARK: Tab Bar Padding (Since Tab View is In the ZStack)
			.padding(.bottom, 50)
		}
    }
	
	@ViewBuilder
	func HeaderView() -> some View {
		HStack {
			VStack(alignment: .leading, spacing: 8) {
				Text("Welcome 🔥")
					.font(.title)
				Text("alaxhenry")
					.font(.title.bold())
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			
			Button {
				
			} label: {
				Image(systemName: "bell")
					.font(.title3)
					.fontWeight(.semibold)
					.foregroundColor(.black)
					.padding(17)
					.background {
						RoundedRectangle(cornerRadius: 10, style: .continuous)
							.fill(.white)
					}
					// MARK: Badge
					.overlay(alignment: .topTrailing) {
						Text("1")
							.font(.caption)
							.fontWeight(.semibold)
							.foregroundColor(.white)
							.padding(6)
							.background {
								Circle()
									.fill(Color("Green"))
							}
							.offset(x: 5, y: -10)
					}
			}
		}
	}
	
	@ViewBuilder
	func SearchView() -> some View {
		HStack(spacing: 15) {
			HStack(spacing: 15) {
				Image("Search")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 24, height: 24)
				
				Divider()
					.padding(.vertical, -6)
				
				TextField("Search", text: .constant(""))
			}
			.padding(15)
			.background {
				RoundedRectangle(cornerRadius: 10, style: .continuous)
					.fill(.white)
			}
			
			Button {
				
			} label: {
				Image("Filter")
					.resizable()
					.renderingMode(.template)
					.aspectRatio(contentMode: .fit)
					.foregroundColor(.white)
					.frame(width: 22, height: 22)
					.padding(15)
					.background {
						RoundedRectangle(cornerRadius: 10, style: .continuous)
							.fill(.black)
					}
			}
		}
		.padding(.top, 15)
	}
	
	// MARK: Plant Carousel
	@ViewBuilder
	func PlantsView() -> some View {
		VStack(alignment: .leading, spacing: 15) {
			HStack(alignment: .center, spacing: 15) {
				Image("Grid")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 13, height: 13)
				
				Text("Most Popular")
					.font(.title3)
					.fontWeight(.semibold)
					.frame(maxWidth: .infinity, alignment: .leading)
				
				Button("Show All") {
					
				}
				.font(.caption)
				.foregroundColor(.gray)
			}
			.padding(.leading, 5)
			
			// MARK: Snap Carousel
			CustomCarousel(index: $currentIndex, items: plants, spacing: 25, cardPadding: 90, id: \.id) { plant, size in
				
			}
			.frame(height: 380)
			.padding(.top, 20)
			.padding(.horizontal, 10)
		}
		.padding(.top, 22)
	}
	
	// MARK: Plant Card View
	@ViewBuilder
	func PlantCardView(plant: Plant, size: CGSize) -> some View {
		ZStack {
			LinearGradient(colors: [Color("Card Top"), Color("Card Bottom")], startPoint: .topLeading, endPoint: .bottomTrailing)
				.clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
		}
	}
	
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
