//
//  HomeView.swift
//  e-wallet
//
//  Created by Nadeera Sampath on 2024-01-07.
//

import SwiftUI

struct Activity: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var amount: String
    var iconName: String
}

struct HomeView: View {
    let items = 1 ... 3

    let rows = [
        GridItem(.fixed(50))
    ]
    
    let activities: [Activity] = [
        Activity(title: "Apple Pay", date: "21 Jun 2022 12:00 PM", amount: "-$1,350.00", iconName: "applelogo"),
        Activity(title: "Receive money", date: "20 Jun 2022 1:00 PM", amount: "+$850.00", iconName: "arrow.down.circle"),
        Activity(title: "College", date: "19 Jun 2022 4:00 PM", amount: "-$3000.00", iconName: "graduationcap"),
        Activity(title: "Internet", date: "19 Jun 2022 4:00 PM", amount: "-$49.99", iconName: "internaldrive.fill"),
        Activity(title: "Netflix", date: "19 Jun 2022 4:00 PM", amount: "-$9.99", iconName: "movieclapper"),
        Activity(title: "Starbucks", date: "19 Jun 2022 4:00 PM", amount: "-$5.00", iconName: "mug"),
        Activity(title: "LA Fitness", date: "19 Jun 2022 4:00 PM", amount: "-$34.99", iconName: "gym.bag"),
        Activity(title: "LADWP Bill", date: "19 Jun 2022 4:00 PM", amount: "-$220.00", iconName: "drop")
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Welcome, John")
                    .font(.title)
                Text("👋")
                    .font(.title)
                    .padding()
                
                Spacer()
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, alignment: .center) { // You can adjust the number of rows as needed
                    ForEach(items, id: \.self) { _ in
                        card()
                    }
                }
                .frame(height: 150)
            }.background(Color.white)
            
   
            categories()
            
            Spacer()
            
            HStack {
                Text("Activities")
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("See all")
                    .fontWeight(.medium)
            }.padding()
            
            List {
                ForEach(activities) { activity in
                    HStack {
                        Image(systemName: activity.iconName)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                        VStack(alignment: .leading) {
                            Text(activity.title)
                                .font(.headline)
                            Text(activity.date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(activity.amount)
                            .foregroundColor(.black)
                    }
                }
            }
            .listStyle(.plain)
            .listRowSpacing(0.1)
            .background(Color.white)
           
        }
    }

    private func card() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("VISA")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Total balance")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("$360,459")
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 20)
                    .foregroundColor(.white)
            }
            .padding()

            Spacer()

            HStack {
                Text("**** **** **** 7654")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text("12/22")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
        .frame(width: 300, height: 150)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color("COLOR_PRIMARY")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
    }
    
    private func categories() -> some View {
        HStack {
            // Transfer
            VStack {
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .foregroundColor(Color("COLOR_TRANSFER_ICON"))
                    .background(Color("COLOR_TRANSFER"))
                    .cornerRadius(15)
                Text("Transfer")
                    .font(.caption)
            }
            
            Spacer()
            
            // E-wallet
            VStack {
                Image(systemName: "wallet.pass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .foregroundColor(Color("COLOR_EWALLET_ICON"))
                    .background(Color("COLOR_EWALLET"))
                    .cornerRadius(15)
                Text("E-wallet")
                    .font(.caption)
            }
            
            Spacer()
            
            // Bill
            VStack {
                Image(systemName: "doc.text.magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color("COLOR_BILL"))
                    .cornerRadius(15)
                Text("Bill")
                    .font(.caption)
            }
            
            Spacer()
            
            // More
            VStack {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color("COLOR_MORE"))
                    .cornerRadius(15)
                Text("More")
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    HomeView()
}
