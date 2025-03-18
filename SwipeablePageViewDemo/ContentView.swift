//
//  ContentView.swift
//  SwipeablePageViewDemo
//
//  Created by Sergen Gönenç on 18.03.2025.
//

import SwiftUI
import SwipeablePageView

/// The main view of the app,  showcasing the usage of SwipeablePageView.
struct ContentView: View {
    @State private var currentPage = 0
    private let totalPages = 5
    let swipeDirection: SwipeDirection

    var body: some View {
        SwipeablePageView(currentPage: $currentPage, direction: swipeDirection) {
            ForEach(0..<totalPages, id: \.self) { index in
                demoPage(for: index)
            }
        }
    }
    
    /// Returns a demo page view for a given index.
    @ViewBuilder
    private func demoPage(for index: Int) -> some View {
        VStack(spacing: 20) {
            Text("Page \(index + 1)")
                .font(.largeTitle)
                .bold()
                .padding(.top, 60)
            
            Text("This is a sample page demonstrating swipe navigation.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(pageBackgroundColor(for: index))
        .foregroundColor(.white)
    }
    
    /// Provides an alternating background color for demo pages.
    private func pageBackgroundColor(for index: Int) -> Color {
        let colors: [Color] = [.red, .blue, .green, .orange, .purple]
        return colors[index % colors.count]
    }
}

// MARK: - Previews
#Preview("Vertical Swipe") {
    ContentView(swipeDirection: .vertical)
}

#Preview("Horizontal Swipe") {
    ContentView(swipeDirection: .horizontal)
}
