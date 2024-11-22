import SwiftUI

struct RecipeFinderView: View {
    @State private var searchText: String = ""
    @State private var recipes: [String] = ["Pasta", "Pizza", "Salad"]
    @State private var showAddRecipeSheet: Bool = false
    @State private var newRecipe: String = ""
    @State private var selectedRecipe: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    TextField("Search Recipes", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .vertical])

                    Button(action: {
                        showAddRecipeSheet.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.green)
                    }
                    .padding(.trailing)
                }

                // Recipe List
                if filteredRecipes.isEmpty {
                    VStack {
                        Image(systemName: "magnifyingglass.circle")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)

                        Text("No recipes found!")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                } else {
                    List {
                        ForEach(filteredRecipes, id: \.self) { recipe in
                            HStack {
                                Text(recipe)
                                    .font(.headline)

                                Spacer()

                                Button(action: {
                                    selectedRecipe = recipe
                                }) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }

                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Recipe Finder")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddRecipeSheet) {
                AddRecipeSheet(recipes: $recipes)
            }
            .sheet(item: $selectedRecipe) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }

    // Filtered Recipes Based on Search
    private var filteredRecipes: [String] {
        recipes.filter {
            searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
        }
    }
}

// Add Recipe Sheet
struct AddRecipeSheet: View {
    @Binding var recipes: [String]
    @State private var newRecipe: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Recipe Name", text: $newRecipe)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    if !newRecipe.isEmpty {
                        recipes.append(newRecipe)
                        newRecipe = ""
                    }
                }) {
                    Text("Add Recipe")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }

                Spacer()
            }
            .navigationTitle("Add New Recipe")
            .navigationBarItems(trailing: Button("Close") {
                newRecipe = ""
            })
        }
    }
}

// Recipe Detail View
struct RecipeDetailView: View {
    var recipe: String

    var body: some View {
        VStack {
            Text(recipe)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Text("Details and preparation steps for \(recipe) will go here.")
                .font(.body)
                .padding()

            Spacer()
        }
        .navigationTitle("Recipe Details")
    }
}

// Preview
struct RecipeFinderView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFinderView()
    }
}
