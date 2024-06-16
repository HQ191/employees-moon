import SwiftUI

struct EmployeeSearchView: View {
    @Binding var searchText: String
    
    private var isClearButtonVisible: Bool {
        !searchText.isEmpty
    }
    
    var body: some View {
        VStack {
            buildTitleView()
            buildSearchBar()
        }
        .padding(.xxxs)
        .background(Color.blackOffset)
        .frame(maxWidth: .infinity)
    }
}

private extension EmployeeSearchView {
    func buildTitleView() -> some View {
        ZStack(alignment: .leading) {
            Text(verbatim: .main(.title))
                .appFont(font: .medium, size: .h2)
                .padding(.nano)
                .frame(maxWidth: .infinity)
            
            Image(image: .employeeIcon)
                .resizable()
                .frame(width: .xxxl, height: .xs)
        }
    }
    
    func buildSearchBar() -> some View {
        HStack {
            Image(image: .search)
                .resizable()
                .frame(width: .xs, height: .xs)
            
            TextField("", text: $searchText)
                .accentColor(.white)
                .foregroundStyle(.white)
                .placeholder(when: searchText.isEmpty) {
                    Text(verbatim: .main(.searchByName)).foregroundColor(.white)
                }
            
            if isClearButtonVisible {
                Button {
                    searchText = ""
                } label: {
                    Image(image: .close)
                        .resizable()
                        .frame(width: .xxxs, height: .xxxs)
                }
            }
        }
        .padding(.nano)
        .frame(maxWidth: .infinity)
        .background(Color.grey)
        .rounded(radius: .micro)
        .overlay(
            RoundedRectangle(cornerRadius: .micro)
                .stroke(
                    searchText.isEmpty ? Color.clear : Color.yellow,
                    lineWidth: .hairLine
                )
        )
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
