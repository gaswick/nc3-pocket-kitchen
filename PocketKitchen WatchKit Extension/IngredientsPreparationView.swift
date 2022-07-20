import SwiftUI

struct IngredientsPreparationView: View {
    var optEgg: String

    var body: some View {
        VStack{
            Text("Ingredients you need to prepare")
                .font(.system(size: 15))
                    .multilineTextAlignment(.center)
            
            List{
                ForEach(recipes[optEgg]!.ingredients, id: \.self) { i in
                    HStack {
                        Text(i[0]).font(.system(size: 13))
                        Spacer()
                        Text(i[1]).font(.system(size: 13))
                    }
                    
                }
            }
            
            NavigationLink("Next",
                           destination: (optEgg == "Scrambled") ?
                            AnyView(CountDownView(optEgg: optEgg)):
                            AnyView(EggOptView(optEgg: optEgg)) )
                .frame(height: 40)
                //.padding(min(.infinity, 20))
                //.foregroundColor(.white)
                .background(.orange)
                .cornerRadius(9)
        }
    }
}

struct IngredientsPreparationView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsPreparationView(optEgg: "Boiled")
    }
}
