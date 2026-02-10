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
        
        ZStack(alignment: .bottomTrailing) {
            NotchedCardShape()
                .foregroundColor(Color(hexString: "#326EA1"))
                .frame(height: 152)
            
            VStack(spacing: 0){
                HStack{
                    Text("The Regulatory Framework, Sustainability an…")
                        .foregroundColor(Color.white)
                        .font(.system(size: 11))
                        .padding(.top, 10)
                    Spacer()
                    
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
            .padding(.horizontal, 16)
            
            joinNowButton()
            
            
            
        }.overlay(alignment: .topTrailing) {
            
            HStack(spacing: 4) {
                Text("Live")
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .bold()
                
                Image("dot")
            }
            .frame(width: 50, height: 22)
            .background(Color(hexString: "#EF4949"))
            .cornerRadius(18)
            .padding(.top, 12)
            .padding(.trailing, 12)
        }
    }
    
    @ViewBuilder
    func joinNowButton() -> some View{
        if UIDevice.current.userInterfaceIdiom == .pad {
            Button(action: {}) {
                HStack{
                    Text("Join Now")
                    
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color(hexString: "#30558E"))
                        .frame(width: 106, height: 36)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color(hexString: "#1C456752").opacity(0.5), lineWidth: 0.5)
                        )
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 5)
                }
                .offset(x: -62, y: 10)
            }
        }else if UIDevice.current.userInterfaceIdiom == .phone {
            Button(action: {}) {
                HStack{
                    Text("Join Now")
                    
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(Color(hexString: "#30558E"))
                        .frame(width: 106, height: 36)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color(hexString: "#1C456752").opacity(0.5), lineWidth: 0.5)
                        )
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 5)
                }
                .offset(x: -34, y: 14)
            }
        }
    }
}


struct NotchedCardShape: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerRadius: CGFloat = 12
        let width = rect.width
        let height = rect.height
        
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: cornerRadius))
        
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)
        
        path.addArc(center: CGPoint(x: width - cornerRadius, y: cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(0),
                    clockwise: false)
        
        path.addArc(center: CGPoint(x: width - cornerRadius, y: height - cornerRadius - 5),
                    radius: cornerRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(83),
                    clockwise: false)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            path.addArc(center: CGPoint(x: width - 43, y: height - 17),
                        radius: 12,
                        startAngle: .degrees(90),
                        endAngle: .degrees(-200),
                        clockwise: false)
            
            path.addArc(center: CGPoint(x: width - 72, y: height - 18),
                        radius: 15,
                        startAngle: .degrees(-20),
                        endAngle: .degrees(270),
                        clockwise: true)
            
            path.addArc(center: CGPoint(x: width - 158, y: height - 18),
                        radius: 15,
                        startAngle: .degrees(-99),
                        endAngle: .degrees(205),
                        clockwise: true)
            
            path.addArc(center: CGPoint(x: width - 187, y: height - 19),
                        radius: 12,
                        startAngle: .degrees(24),
                        endAngle: .degrees(90),
                        clockwise: false)
        } else if UIDevice.current.userInterfaceIdiom == .phone{
            path.addArc(center: CGPoint(x: width - 20, y: height - 19),
                        radius: 14,
                        startAngle: .degrees(90),
                        endAngle: .degrees(-200),
                        clockwise: false)
            
            path.addArc(center: CGPoint(x: width - 51, y: height - 5),
                        radius: 20,
                        startAngle: .degrees(-20),
                        endAngle: .degrees(270),
                        clockwise: true)
            
            path.addArc(center: CGPoint(x: width - 124, y: height - 5),
                        radius: 20,
                        startAngle: .degrees(-89),
                        endAngle: .degrees(205),
                        clockwise: true)
            
            path.addArc(center: CGPoint(x: width - 155, y: height - 19),
                        radius: 14,
                        startAngle: .degrees(-20),
                        endAngle: .degrees(90),
                        clockwise: false)
        }
        
        path.addArc(center: CGPoint(x: cornerRadius, y: height - cornerRadius - 6.55),
                    radius: cornerRadius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(180),
                    clockwise: false)
        
        path.closeSubpath()
        
        return path
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
