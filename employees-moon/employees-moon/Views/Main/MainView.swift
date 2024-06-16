import SwiftUI

struct MainView<VM: MainViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        VStack {
            EmployeeSearchView(searchText: $viewModel.searchText)
            
            ZStack {
                buildEmployeeList()
                buildEmptyView()
            }
        }
        .banner(isPresented: $viewModel.showError, style: .refresh, message: .main(.failedRefresh))
        .background(.black)
    }
    
    func buildEmployeeList() -> some View {
        List {
            if viewModel.isLoading {
                ProgressView()
                    .tint(.white)
                    .frame(maxWidth: .infinity, maxHeight: .xs, alignment: .center)
                    .listRowBackground(Color.black)
                    .id(UUID())
            }
            
            ForEach(viewModel.employeeGroups) { group in
                buildGroupView(group)
            }
        }
        .scrollContentBackground(.hidden)
        .refreshable {
            viewModel.event(.onRefresh)
        }
    }
    
    func buildEmptyView() -> some View {
        guard !viewModel.isLoading && viewModel.employeeGroups.isEmpty else {
            return EmptyView().anyView
        }
        
        return Text(verbatim: .main(.noEmployees))
            .appFont(size: .body)
            .anyView
    }
    
    func buildGroupView(_ group: EmployeeGroupDto) -> some View {
        Section(
            header: Text(group.name)
                .appFont(size: .caption)
                .padding(.vertical, .quarck)
        ) {
            ForEach(group.employees) { employee in
                buildEmployeeItem(employee)
                    .listRowHiddenStyle()
            }
        }
        .listRowBackground(Color.black)
    }
    
    func buildEmployeeItem(_ employee: EmployeeModel) -> some View {
        Button {
            viewModel.event(.onEmployeeSelected(employee))
        } label: {
            Text(employee.fname + " " + employee.lname)
                .appFont(size: .body)
                .padding(.xs)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.greyBlack)
        .rounded(radius: .quarck)
        .padding(.vertical, .hairLine)
    }
}
