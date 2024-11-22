//
//  HomeLayout.swift
//
//  Created by Jeevan Rao on 08/09/24.
//

import SwiftUI

// Demo page where we have all options of grid.

struct HomeLayoutModel {
  let id: Int
  let cardColor: Color
}

let sampleData = [
  HomeLayoutModel(id: 0, cardColor: .cyan),
  HomeLayoutModel(id: 1, cardColor: .orange),
  HomeLayoutModel(id: 2, cardColor: .indigo),
  HomeLayoutModel(id: 3, cardColor: .mint),
  HomeLayoutModel(id: 4, cardColor: .green),
  HomeLayoutModel(id: 5, cardColor: .purple),
  HomeLayoutModel(id: 6, cardColor: .brown),
  HomeLayoutModel(id: 7, cardColor: .yellow),
  HomeLayoutModel(id: 8, cardColor: .red),
  HomeLayoutModel(id: 9, cardColor: .teal)
]

struct HomeLayout: View {
  
  var body: some View {
    
    // Parent Scroll view
    ScrollView {
      
      // Parent VStack
      LazyVStack(alignment: .leading, spacing: 16, pinnedViews: .sectionHeaders) {
        
        FirstSectionView()
        
        SecondSectionView()
        
        ThirdSectionView()
        
      } // parent VStack
      
    } // present scroll view
    .background(Color.gray.opacity(0.1))
    
  }
  
}


// MARK: - Horizontal cards section
struct FirstSectionView: View {
  
  var body: some View {
    Section {
      ScrollView(.horizontal) {
        LazyHStack {
          ForEach(sampleData, id: \.id) { data in
            RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
              .frame(width: 200, height: 120)
              .padding(.horizontal, 4)
              .foregroundStyle(data.cardColor)
              .shadow(radius: 4)
          }
        }
        .padding()
      }
    } header: {
      Text("First Section")
        .font(.headline)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray)
    }
  }
  
}


// MARK: - Grid cards section
struct SecondSectionView: View {
  
  let gridItems = Array(repeating: GridItem(.fixed(100), spacing: 0), count: 2)
  
  var body: some View {
    
    Section {
      
      ScrollView(.horizontal) {
        
        LazyHGrid(rows: gridItems, spacing: 0) {
          
          ForEach(sampleData, id: \.id) { data in
            
            Rectangle()
              .frame(width: 120, height: 100)
              .foregroundStyle(data.cardColor)
          }
        }
      }
      
    } header: {
      Text("Second Section")
        .font(.headline)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray)
    }
  }
  
}

// MARK: - Vertical Cards section
struct ThirdSectionView: View {
  
  var body: some View {
    
    Section {
      
      LazyVStack(alignment: .leading, spacing: 16) {
        ForEach(sampleData, id: \.id) { data in
          
          HStack(alignment: .top, spacing: 10) {
            
            Rectangle()
              .frame(width: 120, height: 100)
              .foregroundStyle(data.cardColor)
            
            Text("Placeholder Text #\(data.id)")
          }
          
          Divider()
          
        }
      }.padding(10)
      
    } header: {
      Text("Third Section")
        .font(.headline)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray)
    }
  }
}

#Preview {
  HomeLayout()
}
