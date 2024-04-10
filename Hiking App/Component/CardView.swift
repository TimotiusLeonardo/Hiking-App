//
//  CardView.swift
//  Hiking App
//
//  Created by Timotius Leonardo Lianoto on 10/04/24.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    // MARK: - Functions
    
    func randomImage() {
        print("The button was pressed")
        print("Status: old image number = \(imageNumber)")
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random number generated = \(randomNumber)")
        } while randomNumber == imageNumber
                    
        imageNumber = randomNumber
        
        print("result: New image number = \(imageNumber)")
        print("THE END")
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                        .foregroundStyle(LinearGradient(colors: [Color.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a sheet
                            print("The button was pressed.")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(colors: [Color("ColorIndigoMedium"), Color("ColorSalmonLight")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                        .frame(width: 256, height: 256)
                    VStack {
                        Image("image-\(imageNumber)")
                            .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                        
                        // MARK: - FOOTER
                        Button {
                            randomImage()
                        } label: {
                            Text("Explore more")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                                .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                        }
                        .padding(.top, 20)
                        .buttonStyle(GradientButton())
                    }
                } //: ZSTACK
            }
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
