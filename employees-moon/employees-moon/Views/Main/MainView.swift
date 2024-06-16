import SwiftUI

struct MainView<VM: MainViewModel>: View {
    @ObservedObject var viewModel: VM
    
    var body: some View {
        VStack {
            buildEmployeeList()
        }
        .background(.black)
    }
    
    func buildEmployeeList() -> some View {
        List {
            ForEach(viewModel.state.employeeGroups) { group in
                buildGroupView(group)
            }
        }
        .scrollContentBackground(.hidden)
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
