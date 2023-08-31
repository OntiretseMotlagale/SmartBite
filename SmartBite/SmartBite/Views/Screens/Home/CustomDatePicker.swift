//
//  CustomDatePicker.swift
//  DatePicker
//
//  Created by Ontiretse Motlagale on 2023/07/19.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        ScrollView {
            VStack (spacing: 35) {
                
                let days: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
                
                HStack (spacing: 20){
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(extractDate()[0])
                            .font(.title2.bold())
                    }
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation {
                            currentMonth -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                    })
                    Button(action: {
                        withAnimation {
                            currentMonth += 1
                        }
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    })
                }
                .padding(.horizontal)
                
                HStack (spacing: 0){
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(extractDate()) { value in

                        cardView(value: value)
                            .background(
                                Capsule()
                                    .fill(Color.blue)
                                    .padding(.horizontal, 8)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0))
                            .onTapGesture {
                                withAnimation {
                                    currentDate = value.date
                                }
                        }
                    }
                }
                
                VStack {
                    Text("Meals")
                        .font(.title2.bold())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let task = tasks.first(where: { task in
                        return isSameDay(date1: task.taskDate, date2: currentDate)
                    }) {
                        
                        ForEach(task.task) { task in
                            VStack (alignment: .leading, spacing: 10) {
                                Text(task.time
                                    .addingTimeInterval(CGFloat.random(in: 0...5000)),
                                     style: .time)
//
//                                Text(task.title)
//                                    .font(.title2.bold())
                                HStack {
                                    Image(task.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                            .padding()
                                        
                                    
                                    VStack (alignment: .leading) {
                                        Text(task.title)
                                            .fontWeight(.bold)
                                    }
                                    Spacer()
                                    VStack {
                                        Text("Calories")
                                            .font(.headline)
                                        Text(String(task.calories))
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                Color.blue.opacity(0.2)
                                    .cornerRadius(10))
                        }
                    }
                    else {
                        Text("No Meal Found")
                    }
                    
                }
                .padding()
            }
            .onChange(of: currentMonth) { newValue in
                currentDate = getCurrentMonth()
        }
        }
    }
    
    @ViewBuilder
    func  cardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate)
                                         ? .white
                                         : Color.black)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate)
                              ? .white
                              : Color.blue)
                        .frame(width: 8, height: 8)
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate)
                                          ? .white
                                          : Color.black)
                        .frame(maxWidth: .infinity)
            
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    func extractDate() -> [String] {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: "")
    }
    func getCurrentMonth() -> Date {
        
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date())
        else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        
       let currentMonth = getCurrentMonth()
       
       var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker(currentDate: .constant(Date()))
    }
}

extension Date {
    
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!

        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
