import SwiftUI
struct SearchBarView: View {
    
    @StateObject var viewModel = NetworkManager()
    @State private var selectedFood: Hint?
    @State var showSheet = false
    
    @Binding var foodItems: [Hint]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchData, id: \.food?.foodID) { name in
                    Button(action: {
                       selectedFood = name
                       showSheet.toggle()
                        
                    }) {
                        ListSearchView(hint: name)

                    }
                }
                .listRowSeparator(.hidden)
//                .listRowBackground(Color.clear)
            }
            .listStyle(.grouped)
            .overlay {
                if viewModel.searchText.isEmpty {
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                        Text("No results")
                            .font(.system(size: 30, weight: .semibold))
                        Text("Search for available food items via the search bar above")
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                    }.opacity(0.5)
                }
            }
            .navigationTitle("Menu")
            .sheet(isPresented: $showSheet) {
                Sheet(selectedFood: selectedFood) {
                    if let selectedFood = selectedFood {
                        foodItems.append(selectedFood)
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Find Food")
        .onChange(of: viewModel.searchText) { newValue in
            viewModel.fetchData(foodName: newValue)
        }
                .onChange(of: viewModel.searchText) { newValue in
                    if newValue.isEmpty {
                        viewModel.searchData.removeAll()
                    }
            }
    }
//
}
//struct SearchForFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView()
//    }
//}

//import SwiftUI
//struct SearchBarView: View {
//
//    @StateObject var viewModel = NetworkManager()
//    @State private var selectedFood: Hint?
//    @State var showSheet = false
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(viewModel.searchData, id: \.food?.foodID) { name in
//                    Button(action: {
//                        selectedFood = name
//                        showSheet.toggle()
//
//                    }) {
//                        ListSearchView(hint: name)
//
//                    }
//                }
//                .listRowSeparator(.hidden)
//                .listRowBackground(Color.clear)
//
//            }
//            .listStyle(.grouped)
//            .overlay {
//                if viewModel.searchText.isEmpty {
//                    VStack{
//                        Image(systemName: "magnifyingglass")
//                            .resizable()
//                            .frame(width: 30.0, height: 30.0)
//                        Text("No results")
//                            .font(.system(size: 30, weight: .semibold))
//                        Text("Search for available food items via the search bar above")
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                    }.opacity(0.5)
//                }
//            }
//            .navigationTitle("Menu")
//            .sheet(isPresented: $showSheet) {
//                Sheet(selectedFood: $selectedFood)
//            }
//        }
//        .searchable(text: $viewModel.searchText, prompt: "Find Food")
//        .onChange(of: viewModel.searchText) { newValue in
//            viewModel.fetchData(foodName: newValue)
//        }
//        .onChange(of: viewModel.searchText) { newValue in
//            if newValue.isEmpty {
//                viewModel.searchData.removeAll()
//            }
//        }
//    }
//
//}
//
//struct SearchForFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView()
//    }
//}
