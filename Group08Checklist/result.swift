import Foundation
import SwiftUI
struct ResultView: View {
    let toggledCount: Int
    let uncheckedItems: [String]
    
    private var score: Int {
        var score = 0
        
        var x = 0.0
        var y = 0.0
        var temp = 0.0
        x = Double(toggledCount)
        y = Double(toggledCount + uncheckedItems.count)
        if y != 0 {
            temp = (x / y) * 100
        }
        score = Int(temp)
        
        return score
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Summary").font(.system(size: 25)).foregroundColor(Color.black)) {
                VStack {
                    Text("Safety Score").font(.largeTitle).padding()
                    Text("\(score)").font(.system(size: 75)).bold().foregroundColor(Color.black)
                    Text("Unchecked Items").font(.largeTitle).padding()
                    Text("\(uncheckedItems.count)").font(.system(size: 75)).bold().foregroundColor(Color.red)
                    Text("Checked Items").font(.largeTitle).padding()
                    Text("\(toggledCount)").font(.system(size: 75)).bold().foregroundColor(Color.blue).padding()
                }
            }
            
            Section(header: Text("Unchecked Lists").font(.system(size: 25)).foregroundColor(Color.black)) {
                ForEach(uncheckedItems.indices, id: \.self) { index in
                    Text("\(index + 1). " + uncheckedItems[index])
                        .font(.body)
                        .foregroundColor(.primary)
                    Text("")
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
            
            
        }
        .padding()
    }
}

