//
//  ContentView.swift
//  Learn_with_live_classes_UI
//
//  Created by Sai Krishna on 2/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0){
            headerView()
                .padding(.horizontal, 16)
            ScrollView {
                VStack(spacing: 0){
                        titleArea()
                        liveClassCardView()
                    joinNowButton()
                }
                .padding(.horizontal, 16)
            }.background(Color(hexString: "#F8FAFC"))

        }
    }


func headerView() -> some View {
    
    HStack(spacing: 16) {
        Image("star")
            .renderingMode(.template)
            .foregroundColor(.white)
            .padding(16)
            .frame(width: 32, height: 32)
            .background(Color(hexString: "#476AA2"))
            .cornerRadius(8)
        
        
        Text("Exclusive")
            .font(.title2)
            .fontWeight(.bold)
        Spacer()
    }
    .padding(.vertical, 12)
    .background(Color.white)
    
}
func titleArea() -> some View{
    HStack{
        Text("Learn with live classes")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(Color.black)
            .padding(.vertical, 16)
        Spacer()
    }
}



    func liveClassCardView() -> some View {
        
        ZStack {
            NotchedCardShape()
                .frame(height: 160)
                .foregroundColor(Color(hexString: "#326EA1"))
            VStack(spacing: 0){
                HStack{
                    Text("The Regulatory Framework, Sustainability an…")
                        .foregroundColor(Color.white)
                        .font(.system(size: 11))
                        .padding(.top, 10)
                    Spacer()
                        .overlay{
                            HStack{
                                Text("Live")
                                    .font(.system(size: 11))
                                    .foregroundColor(Color.white)
                                    .bold()
                                // Dot
                            }
                                .frame(width: 50,height: 22)
                                .background(Color(hexString: "#EF4949"))
                                .cornerRadius(18)
                        }
                    
                }
                HStack(spacing: 16) {
                    
                    Image("pic2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 77, height: 77)
                        .clipShape(Circle())
                        .offset(y: -17)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("International Source of authority")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.white)
                        
                        Text("Naveen Kumar Poolambeti")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        
                        Text("9:00 AM - 10:30 AM")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        Spacer()
                    }
                    
                    Spacer()
                }.padding(.top, 16)

            }
            .frame(width: 328, height: 152)
            .padding(.horizontal, 16)
        }
    }
}
struct NotchedCardShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerRadius: CGFloat = 12
        
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: false)
        
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: rect.height - 5 - cornerRadius), radius: cornerRadius, startAngle: .degrees(0), endAngle: .degrees(83), clockwise: false)
        
        path.addArc(center: CGPoint(x: 338, y: 141), radius: 14, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        path.addArc(center: CGPoint(x: 304, y: 147), radius: 20, startAngle: .degrees(-10), endAngle: .degrees(270), clockwise: true)
        
        path.addArc(center: CGPoint(x: 224, y: 147), radius: 20, startAngle: .degrees(-80), endAngle: .degrees(190), clockwise: true)
        path.addArc(center: CGPoint(x: 190, y: 141), radius: 14, startAngle: .degrees(-10), endAngle: .degrees(90), clockwise: false)
        
        path.addLine(to: CGPoint(x: cornerRadius, y: 153))
        path.addArc(center: CGPoint(x: cornerRadius, y: 141), radius: cornerRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        
        path.closeSubpath()
        return path
    }
}

func joinNowButton() -> some View{
    Button(action: {}) {

        HStack{

            Text("Join Now")

                .font(.system(size: 14))
                .bold()
                .foregroundColor(Color(hexString: "#30558E"))
                .frame(width: 114, height: 36)
                .background(Color.white)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color(hexString: "#1C456752").opacity(0.5), lineWidth: 0.5)
                )
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 5)
            
            
        }.offset(x: 84, y: -29)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}
