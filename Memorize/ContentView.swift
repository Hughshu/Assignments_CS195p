//
//  ContentView.swift
//  Memorize
//
//  Created by Hugh Shu on 30/9/2022.
//


//todo button & shuffle
import SwiftUI

var vehicals = ["🚊", "🚀", "🚁", "🚗", "✈️", "🚲", "🚜", "🛴", "🚋", "🚍", "🚢", "🚝", "🚔", "🚑", "⛵️", "🚂", "🚞", "🛻", "🏍️", "⛴️", "🚎", "🚐", "🚤", "🛺"]
var animals = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮"]
var flags = ["🏳️‍⚧️","🇺🇳","🇩🇿","🇦🇫","🇦🇷","🇦🇪","🇦🇼","🇴🇲","🇦🇿","🇪🇬","🇪🇹","🇮🇪"]

func widthThatBestFits(cardCount: Int) -> CGFloat {
    var bestWidth: CGFloat
    
    
    
    return bestWidth
}

struct ContentView: View {

    @State var emojis: Array<String> = animals
    
    
    var body: some View {
        
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView{
                // try if here
                let random = Int.random(in: 4..<emojis.count)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<random], id: \.self){ emoji in //random appearing cards number
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
            }
            
            HStack{
                Spacer()
                logoView(logoImage: "car", logoName: "Vehicals")
                    .onTapGesture {
                        emojis = vehicals.shuffled()
                    }
                Spacer()
                logoView(logoImage: "globe.asia.australia", logoName: "Animals")
                    .onTapGesture {
                        emojis = animals.shuffled()
                    }
                Spacer()
                logoView(logoImage: "flag", logoName: "Flags")
                    .onTapGesture {
                        emojis = flags.shuffled()
                    }
                Spacer()
            }
            
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else
            {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        .foregroundColor(.red)
        
    }
}

//present botton logo
struct logoView: View {

    var logoImage: String
    var logoName: String
    
    var body: some View{
        VStack{
            Image(systemName: logoImage)
                .font(.largeTitle)
            Text(logoName)
                .font(.caption)
        }
        .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
