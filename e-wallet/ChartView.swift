//
//  ChartView.swift
//  e-wallet
//
//  Created by Nadeera Sampath on 2024-01-07.
//

import Charts
import SwiftUI

struct MountPrice: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
}

struct ChartView: View {
    @State private var selectedRange: String = "Jan - May"
    @State private var selectedOption: Int = 0
    @State var selectedMonth: String?
    
    let data: [MountPrice] = [
        MountPrice(mount: "Jan", value: 5),
        MountPrice(mount: "Feb", value: 4),
        MountPrice(mount: "Mar", value: 7),
        MountPrice(mount: "Apr", value: 15),
        MountPrice(mount: "May", value: 14),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("Spending")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                    .padding(.top)
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)
                    .padding(.top)
                Spacer()
                
                Menu {
                    Button("Jan - May", action: { selectedRange = "Jan - May" })
                    Button("Jun - Dec", action: { selectedRange = "Jun - Dec" })
                } label: {
                    HStack {
                        Text(selectedRange)
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .center) {
                Text("Total spending")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("$260,459")
                    .font(.system(size: 28, weight: .bold))
            }
            .padding([.top, .leading, .trailing])
            
            
            VStack {
                Chart(data) {
                    LineMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Color("COLOR_PRIMARY"))
                    .symbol() {
                       Circle()
                        .fill(.white)
                       .frame(width: 8, height: 8)
                    }
                    .symbolSize(30)
                    PointMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                    )
                    .foregroundStyle(Color("COLOR_PRIMARY"))
                }
                .frame(height: 250)
                .chartYAxis(.hidden)
                
            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Spending limit")
                            .font(.headline)
                        Text("Monthly transaction limit")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("$290,349")
                        .font(.headline)
                    if selectedOption == 1 {
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(Color("COLOR_PRIMARY"))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .shadow(radius: selectedOption == 1 ? 1 : 0)
                .onTapGesture {
                    selectedOption = 1;
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("Monthly budget")
                            .font(.headline)
                        Text("For June")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("$280,248")
                        .font(.headline)
                    if selectedOption == 2 {
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(Color("COLOR_PRIMARY"))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .shadow(radius: selectedOption == 2 ? 1 : 0)
                .onTapGesture {
                    selectedOption = 2;
                }
            }
            .padding()
            
            VStack {
                HStack {
                    Text("History")
                        .font(.headline)
                        .fontWeight(.bold)
                       
                    Spacer()
                       
                    Button(action: {
                        // Action for See all
                    }) {
                        Text("See all")
                            .foregroundColor(.black)
                    }
                }
                   
                HStack(spacing: 16) {
                    VStack {
                        HStack {
                            Text("Transaction")
                                .font(.caption)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .font(.caption)
                        }
                        HStack {
                            Text("320+")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "handbag.fill")
                                .foregroundColor(Color("COLOR_PRIMARY"))
                        }.padding(.top)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("COLOR_TRANSFER")))
                       
                    VStack {
                        HStack {
                            Text("Bills")
                                .font(.caption)
                            Spacer()
                            Text("June 2022")
                                .font(.caption)
                        }
                        HStack {
                            Text("$356")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "doc.text.fill")
                                .foregroundColor(Color("COLOR_EWALLET_ICON"))
                        }.padding(.top)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("COLOR_EWALLET")))
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ChartView()
}
