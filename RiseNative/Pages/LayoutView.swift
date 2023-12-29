//
//  LayoutView.swift
//  RiseNative
//
//  Created by kehinde on 29/12/2023.
//

import SwiftUI

struct LayoutView: View {
    @State private var currentTab = Tabs.home
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack{
            TabView(selection: $currentTab,
                    content:  {
                Home().tag(Tabs.home)
                PlanView().tag(Tabs.plans)
                WalletView().tag(Tabs.wallet)
                FeedView().tag(Tabs.feed)
                AccountView().tag(Tabs.more)
            })
            CustomTab(currentTab: $currentTab)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LayoutView()
}
