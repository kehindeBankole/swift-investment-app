//
//  BalanceCardView.swift
//  RiseNative
//
//  Created by kehinde on 02/01/2024.
//

import SwiftUI



struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .riseTextSoft.opacity(0.2), radius: 100, x: 8, y: 80)
    }
}

struct BalanceCard:View{
    @State var appData : AppData
    
    var body: some View{
        Rectangle()
        
            .cornerRadius(15)
            .frame(height: 192)
            .foregroundColor(.white)
            .overlay(content: {
                VStack{
                    HStack{
                        Group{
                            Text("Total Balance").multilineTextAlignment(.center)
                            
                            Button(action: {
                                appData.showBalance.toggle()
                            }){
                                appData.showBalance ?  Image(systemName: "eye.slash.fill") :     Image(systemName: "eye.fill")
                                
                                
                            }
                            
                        }.font(Font.custom("DMSans-Regular", size: 15))
                            .foregroundColor(Color.riseTextSoft)
                    }.padding(.bottom , 2)
                    
                    
                    if(appData.showBalance){
                        Text(appData.stats!.data.totalBalance , format:.currency(code: "USD"))
                            .font(.custom("TomatoGrotesk-Regular", size: 32))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    }else{
                        Text("***").font(.custom("TomatoGrotesk-Regular", size: 32))
                    }
                    
                    Divider().frame(width: 200).padding(.bottom)
                    
                    HStack{
                        
                        Text("Total Gains ")
                            .font(Font.custom("DMSans-Regular", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.riseTextSoft)
                        
                        Group{
                            
                            Image(systemName: "arrow.up.right").font(.system(size: 13))
                            
                            
                            Text("\(appData.stats!.data.percentageChange.formatted(.number.precision(.fractionLength(2))))%")                                .font(.custom("TomatoGrotesk-Regular", size: 16))
                                .multilineTextAlignment(.center)
                            
                        }.foregroundColor(Color(red: 0.15, green: 0.75, blue: 0.25))
                    }
                    
                }
            })
    }
}


struct InvestingBalanceCard:View{
    @State var appData : AppData
    
    var body: some View{
        Rectangle()
        
            .cornerRadius(15)
            .frame(height: 192)
            .foregroundColor(.white)
            .overlay(content: {
                VStack{
                    HStack{
                        Group{
                            Text("Investing Balance").multilineTextAlignment(.center)
                            
                            Button(action: {
                                appData.showBalance.toggle()
                            }){
                                appData.showBalance ?  Image(systemName: "eye.slash.fill") :     Image(systemName: "eye.fill")
                                
                                
                            }
                            
                        }.font(Font.custom("DMSans-Regular", size: 15))
                            .foregroundColor(Color.riseTextSoft)
                    }.padding(.bottom , 2)
                    
                    
                    if(appData.showBalance){
                        Text(appData.stats!.data.investmentBalance , format:.currency(code : "USD"))
                            .font(.custom("TomatoGrotesk-Regular", size: 32))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    }else{
                        Text("***").font(.custom("TomatoGrotesk-Regular", size: 32))
                    }
                    
                    Divider().frame(width: 200).padding(.bottom)
                    
                    HStack{
                        
                        Text("Total Gains")
                            .font(Font.custom("DMSans-Regular", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.riseTextSoft)
                        
                        Group{
                            
                           Image(systemName: "arrow.up.right").font(.system(size: 13))
                            
                            
                            Text("\(appData.stats!.data.percentageChange.formatted(.number.precision(.fractionLength(2))))%")
                                .font(.custom("TomatoGrotesk-Regular", size: 16))
                                .multilineTextAlignment(.center)
                            
                        }.foregroundColor(Color(red: 0.15, green: 0.75, blue: 0.25))
                    }
                    
                }
            })
    }
}


struct WalletBalanceCard:View{
    @State var appData : AppData
    @Binding var currentTab:Tabs
    
    var body: some View{
        Rectangle()
        
            .cornerRadius(15)
            .frame(height: 192)
            .foregroundColor(.white)
            .overlay(content: {
                VStack{
                    HStack{
                        Group{
                            Text("Wallet Balance").multilineTextAlignment(.center)
                            
                            Button(action: {
                                appData.showBalance.toggle()
                            }){
                                appData.showBalance ?  Image(systemName: "eye.slash.fill") :     Image(systemName: "eye.fill")
                                
                                
                            }
                            
                        }.font(Font.custom("DMSans-Regular", size: 15))
                            .foregroundColor(Color.riseTextSoft)
                    }.padding(.bottom , 2)
                    
                    
   
                    if(appData.showBalance){
                        Text(appData.wallet!.data.wallet.balance , format:.currency(code : "USD")).font(.custom("TomatoGrotesk-Regular", size: 32))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    }else{
                        Text("***").font(.custom("TomatoGrotesk-Regular", size: 32))
                    }
                     
                    
                    Divider().frame(width: 200).padding(.bottom)
                    
                    Button(action: {
                        currentTab = .wallet
                    }, label:{
                        Text("Open Wallet")
                            .font(Font.custom("DMSans-Regular", size: 15))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.riseTextSoft)
                    })
                    
                }
            })
    }
}


struct BalanceCardView: View {
    @State var currentView = 1
    @Binding var currentTab:Tabs
    @State var isLoading = false
    @Environment(AppData.self) private var appData
    
    var body: some View {
        VStack{
            if(isLoading){
                SkeletonLoaderView()
                    .frame(maxWidth : .infinity)
                 .frame( height: 192)
            }else{
                
                Rectangle()
                    .cornerRadius(15)
                    .frame(height: 192)
                    .modifier(ShadowModifier())
                    .foregroundColor(.white)
                    .overlay(content: {
                        VStack{
                            TabView(selection: $currentView,
                                    content:  {
                                if(appData.stats != nil){
                                    BalanceCard(appData : appData).tag(1)
                                    InvestingBalanceCard(appData : appData).tag(2)
                                }
                                if(appData.wallet != nil){
                                    WalletBalanceCard(appData : appData, currentTab: $currentTab).tag(3)
                                }
                       
                                
                            }).tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).cornerRadius(20)
                            
                               HStack{
                                   ForEach( 0 ..< 3 , id:\.self){index  in
                                       let isActive = index == currentView - 1
                                       Rectangle().fill(isActive ? Color.riseActiveCard : Color.textSoft).opacity(isActive ? 1 : 0.2).frame(width: index == currentView-1 ? 12 : 5 , height: 5).cornerRadius(20).animation(.default, value: isActive)
                                   }
                               }.padding(.bottom)
                        }
                    })
                
                
                
             
            }
        }.task {
      
                do{
                    if(appData.stats == nil){
                        isLoading = true
                    }
                        
                 
                    let data : WalletModel? =  try await makeApiCall(endpoint: baseUrl + "/users/\(String(describing: appData.profile?.id))/get-wallet", method: .get)
                    if let walletData = data{
                        appData.wallet = walletData
                    }
                }catch{
              
                }
        
        }.task {
         
                do{
                    if(appData.stats == nil){
                        isLoading = true
                    }
                        
                 
                    let data : StatsModel? =  try await makeApiCall(endpoint: baseUrl + "/auth/stats", method: .get)
                    if let statsData = data{
                        appData.stats = statsData
                    }
                    isLoading = false
                }catch{
                 
                }

        }
    }
}

