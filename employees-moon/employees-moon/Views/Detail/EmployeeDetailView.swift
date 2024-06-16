import SwiftUI

struct EmployeeDetailView: View {
    @Binding var isPresented: Bool
    let employee: EmployeeModel
    
    var body: some View {
        ScrollView {
            VStack {
                buildHeaderView()
                buildPersonalInfoView()
                buildContactInfoView()
                buildProjectsView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.xxxs)
        }
        .background(Color.blackOffset)
    }
}

private extension EmployeeDetailView {
    func buildHeaderView() -> some View {
        HStack {
            Text("Employee Details")
                .appFont(font: .medium, size: .h2)
                .padding(.nano)
            Spacer()
            Button {
                isPresented = false
            } label: {
                Image("close")
                    .resizable()
                    .padding(.mini)
                    .background(Color.grey)
                    .frame(width: .md, height: .md)
                    .rounded(radius: .md/2)
            }
        }
        .frame(alignment: .center)
    }
    
    func buildPersonalInfoView() -> some View {
        VStack {
            Text("PERSONAL INFO")
                .appFont(size: .caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .frame(height: .hairLine)
                .background(Color.white.opacity(0.5))
            
            buildInfoField(title: "First Name", value: employee.fname)
            buildInfoField(title: "Last Name", value: employee.lname)
            buildInfoField(title: "Position", value: employee.position)
        }
        .padding(.vertical, .xxs)
    }
    
    func buildContactInfoView() -> some View {
        VStack {
            Text("CONTACT INFO")
                .appFont(size: .caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .frame(height: .hairLine)
                .background(Color.white.opacity(0.5))
            
            buildInfoField(title: "Email", value: employee.contactDetails.email)
            if let phone = employee.contactDetails.phone {
                buildInfoField(title: "Phone", value: phone)
            }
        }
        .padding(.vertical, .xxs)
    }
    
    func buildInfoField(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .appFont(size: .body)
            Spacer()
            Text(value)
                .appFont(font: .medium, size: .body)
        }
        .padding(.vertical, .nano)
    }
    
    func buildProjectsView() -> AnyView {
        guard let projects = employee.projects else {
            return EmptyView().anyView
        }
        
        return VStack {
            Text("WORKED ON")
                .appFont(size: .caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .frame(height: .hairLine)
                .background(Color.white.opacity(0.5))
            
            
            WrappingHStack(
                models: projects,
                horizontalSpacing: .xxs,
                verticalSpacing: .nano
            ) { project in
                Text(project).appFont(font: .medium, size: .body)
            }
            .padding(.horizontal, -.xxxs)
        }
        .padding(.vertical, .xxs)
        .anyView
    }
}
