//
//  NotificationView.swift
//  e-wallet
//
//  Created by Nadeera Sampath on 2024-01-07.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    NotificationCard(imageName: "person.crop.circle", title: "You have successfully transferred $23.00 to Sophia.", time: "1 hours ago", backgroundColor: Color.green.opacity(0.3), foregroundColor: Color.green)
                    
                    NotificationCard(imageName: "gift", title: "Congratulations! You have been awarded $5.00 for using our e-wallet", time: "2 hours ago", backgroundColor: Color.green.opacity(0.3), foregroundColor: Color.green)
                    
                    NotificationCard(imageName: "creditcard.fill", title: "A new offer is available for use in Book Nook. Check your offers section for details", time: "3 hours ago", backgroundColor: Color.orange.opacity(0.3), foregroundColor: Color.orange)
                    
                    NotificationCard(imageName: "dollarsign.arrow.circlepath", title: "You have a new transaction of $235.00 from The Jewel Box. Check your account now for details.", time: "5 hours ago", backgroundColor: Color.blue.opacity(0.3), foregroundColor: Color.blue)
                    
                    NotificationCard(imageName: "person.crop.circle", title: "You have successfully transferred $100.00 to Matt.", time: "5 hours ago", backgroundColor: Color.green.opacity(0.3), foregroundColor: Color.green)
                    
                    NotificationCard(imageName: "square.and.arrow.up.trianglebadge.exclamationmark", title: "Your account has reached its daily transaction limit. Upgrade your account to increase the limit", time: "10 hours ago", backgroundColor: Color.red.opacity(0.3), foregroundColor: Color.red)
                    
                    NotificationCard(imageName: "checkmark.circle", title: "Your account has been successfully verified. Enjoy all the features of our e-wallet now", time: "2 days ago", backgroundColor: Color.green.opacity(0.3), foregroundColor: Color.green)
                }
                .listStyle(.grouped)
                .background(.white)
                .listRowSpacing(0.1)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    navigationBarLeading
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarTrailing
                }
            }
            .background(.white)
        }
    }
    
    var navigationBarLeading: some View {
            HStack {
                Image(systemName: "chevron.left")
                Text("Notifications").font(.headline)
                notificationCountBadge
            }
    }
    
    var navigationBarTrailing: some View {
          Button(action: {
              // Action for 'mark all as read'
          }) {
              Text("mark all as read")
                  .foregroundColor(Color.primaryColor)
                  .padding(8)
                  .background(Color.secondaryColor)
                  .cornerRadius(10)
          }
      }
    
    var notificationCountBadge: some View {
          ZStack {
              Circle()
                  .foregroundColor(Color.primaryColor)
                  .frame(width: 20, height: 20)
              Text("2")
                  .foregroundColor(.white)
                  .font(.caption2)
          }
          .offset(x: -10, y: -10)
      }
}

struct NotificationCard: View {
    var imageName: String
    var title: String
    var time: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .commonImageStyle(
                    backgroundColor: backgroundColor,
                    foregroundColor: foregroundColor
                )
                .padding()
                .cornerRadius(8)
                .font(.system(size: 20))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .fontWeight(.regular)
                Text(time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color.white)
    }
}

extension Image {
    func commonImageStyle(backgroundColor: Color, foregroundColor: Color) -> some View {
        self.padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(8)
            .font(.system(size: 20))
    }
}

extension Color {
    static let primaryColor = Color("COLOR_PRIMARY")
    static let secondaryColor = Color("COLOR_TRANSFER")
}

#Preview {
    NotificationView()
}
