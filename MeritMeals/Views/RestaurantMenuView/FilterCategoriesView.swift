import SwiftUI

struct FilterCategoriesView: View {
    var filters: [String]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    Text(filter)
                        .foregroundColor(.black)
                        .padding()
                        .frame(height: 40)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(24)
                }
            }
            .padding()
        }
    }
}
