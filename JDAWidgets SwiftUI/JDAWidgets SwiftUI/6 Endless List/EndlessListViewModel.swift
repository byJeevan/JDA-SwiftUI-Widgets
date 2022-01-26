//
//  EndlessListViewModel.swift
//  JDAWidgets SwiftUI
//
//  Created by Jeevan Rao on 26/01/22.
//  Copyright © 2022 JDA. All rights reserved.
//

import Foundation
import SwiftUI

class EndlessListViewModel: ObservableObject {
    @Published var items = [ListItem]()
    @Published var isLoadingPage = false
    private var currentPage = 0
    private var canLoadMorePages = true
    
    init() {
        loadMoreContent()
    }
    
    func loadMoreContentIfNeeded(currentItem item: ListItem?) {
        guard let item = item else {
            loadMoreContent()
            return
        }
        
        let thresholdIndex = items.index(items.endIndex, offsetBy: -5)
        if items.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadMoreContent()
        }
    }
    
    private func loadMoreContent() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        
        isLoadingPage = true
        loadContents()
    }
    
    // MARK: - Optional implementation for Demo
    func loadContents() {
        /// --- Here mocking fetch data. Tipically this would be API request and response callbacks ----
        let maxPageLimit = 10
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoadingPage = false
            self.currentPage += 1
            self.canLoadMorePages = self.currentPage != maxPageLimit
            self.items += self.generateDatasource()
            print("Loaded Page Number : \(self.currentPage) with total items \(self.items.count)")
            
        }
    }
    
    func generateDatasource() -> [ListItem] {
        var listItem = [ListItem]()
        let itemPerPageLimit = 8
        (0...itemPerPageLimit).forEach { _ in
            listItem.append(ListItem())
        }
        return listItem
    }
}
