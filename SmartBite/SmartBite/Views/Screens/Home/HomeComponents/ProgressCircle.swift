import SwiftUI
struct ProgressCircle: View {
    @State var progressValues: [Float] = [0.0, 0.0, 0.0, 0.0]
    
    @Binding var breakfastFoods: [Hint]
    
    let ringColors: [Color] = [.yellow, .purple, .green, .red]
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    ProgressBar(progress: self.$progressValues[3], color: ringColors[3])
                        .frame(width: 115.0, height: 100.0)
                        .padding(20.0)
                        .onAppear {
                            self.progressValues[3] = Float(calculateCalories() / 100)
                        }
                }
                
                HStack {
                    Spacer()
                    ProgressBar(progress: self.$progressValues[2], color: ringColors[2])
                        .frame(width: 80.0, height: 120.0)
                        .padding(40.0)
                        .onAppear {
                            self.progressValues[2] = Float(calculateProtein() / 100 )
                        }
                }
                
                HStack {
                    Spacer()
                    ProgressBar(progress: self.$progressValues[1], color: ringColors[1])
                        .frame(width: 60.0, height: 110.0)
                        .padding(50.0)
                        .onAppear {
                            self.progressValues[1] = Float(calculateCarbs() / 100)
                        }
                }
                
                HStack {
                    Spacer()
                    ProgressBar(progress: self.$progressValues[0], color: ringColors[0])
                        .frame(width: 40, height: 80)
                        .padding(60.0)
                        .onAppear {
                            self.progressValues[0] = Float(calculateFat() / 100)
                        }
                }
            }
        }
        
    }
    func calculateCalories() -> Double {
        var total = 0.0
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.enercKcal ?? 0
        }
        return ceil(total)
    }
    
    func calculateFat() -> Double {
        var total = 0.0
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.fat ?? 0
        }
        return ceil(total)
    }
    func calculateCarbs() -> Double {
        var total = 0.0
        
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.chocdf ?? 0
        }
        return ceil(total)
    }
    func calculateProtein() -> Double {
        var total = 0.0
        
        for selectedFood in breakfastFoods {
            total += selectedFood.food?.nutrients?.procnt ?? 0
        }
        return ceil(total)
    }
}


struct ProgressBar: View {
 @Binding var progress: Float
 var color: Color
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.10)
                    .foregroundColor(Color.gray)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                    .rotationEffect(Angle(degrees: -90))
//                    .animation(.easeInOut(duration: 2.0))
            }
        }
    }
}
struct ProgressCircle_Previews: PreviewProvider {
 static var previews: some View {
     ProgressCircle( breakfastFoods: .constant([]))
 }
}
