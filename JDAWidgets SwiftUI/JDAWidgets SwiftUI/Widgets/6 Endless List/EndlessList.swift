//
//  EndlessList.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 26/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//  Ref : https://www.donnywals.com/implementing-an-infinite-scrolling-list-with-swiftui-and-combine/?utm_campaign=%20SwiftUI%20Weekly&utm_medium=email&utm_source=Revue%20newsletter

import SwiftUI
 
struct EndlessList: View {
    
    @StateObject var dataSource = EndlessListViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(dataSource.items, id: \.id) { item in
                    
                        Text(item.id)
                            .font(.subheadline)
                            .onAppear {
                                dataSource.loadMoreContentIfNeeded(currentItem: item)
                            }
                            .frame(minWidth: 100, maxWidth: .infinity)
                            .padding(.all, 10)
                            .padding(.vertical, 50)
                            .background(item.color)
 
                 
                }

                if dataSource.isLoadingPage {
                    ProgressView()
                }
            }
        }
    }
}

struct EndlessList_Previews: PreviewProvider {
    static var previews: some View {
        EndlessList()
    }
}
