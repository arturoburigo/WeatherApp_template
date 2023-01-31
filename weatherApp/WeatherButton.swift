import SwiftUI

struct ChangeDayTimeButton: View {
    
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
            Text(buttonText)
                .frame(width: 280, height: 50)
                .font(.system(size: 20, weight: .bold))
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
    }
}

