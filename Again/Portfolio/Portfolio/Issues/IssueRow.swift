//
//  IssueRow.swift
//  Portfolio
//
//  Created by Seymen Nadir Elmas on 14.10.2024.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationLink(value: viewModel.issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(viewModel.iconOpacity)
                    .accessibilityIdentifier(viewModel.iconIdentifier)

                VStack(alignment: .leading) {
                    Text(viewModel.issueTitle)
                        .font(.headline)
                        .lineLimit(1)

                    Text(viewModel.issueTagsList)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(viewModel.creationDate)
                        .accessibilityLabel(viewModel.accessibilityCreationDate)
                        .font(.subheadline)

                    if viewModel.completed {
                        Text("CLOSED")
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
        .accessibilityHint(viewModel.accessibilityHint)
        .accessibilityIdentifier(viewModel.issueTitle)
    }

    init(issue: Issue) {
        let viewModel = ViewModel(issue: issue)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

#Preview {
    IssueRow(issue: .example)
}
