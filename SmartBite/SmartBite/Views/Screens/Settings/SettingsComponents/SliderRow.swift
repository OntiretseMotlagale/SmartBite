import SwiftUI

struct SliderRow: View {
   @Binding var value: Double
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(color)
                    .frame(width: 20, height: 20)
                Text(title)
                Spacer()
                Text("\(value, specifier: "%.0f")")
                    .foregroundColor(.blue)
                    .padding(.horizontal)
            }
            Slider(value: $value, in: 0...10000, step: 1, onEditingChanged: { editing in
            })
            .accentColor(color)
        }.padding(.horizontal)
    }
}

struct SliderRow_Previews: PreviewProvider {
    static var previews: some View {
        SliderRow(value: .constant(0.0), title: "Calories", color: .blue)
    }
}
