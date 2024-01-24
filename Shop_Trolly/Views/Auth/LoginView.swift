import SwiftUI

struct LoginView: View {
    @Binding var email: String
    @Binding var password: String
    @State private var showForgetPwdView: Bool = false
    @State private var isOn = false
    var body: some View {
        VStack{
            HStack {
                Text("Welcome Back!")
                    .foregroundColor(Color(hex: "#152354"))
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 40)
            
            HStack {
                Text("Enter password to get back your account")
                Spacer()
            }
            .padding(.horizontal, 40)
            .foregroundColor(.secondary)
            
            ZStack {
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    Image(systemName: "applelogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                    
                    Text("  Continue with Apple")
                        .foregroundColor(Color(hex: "#152354"))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                
                //.buttonStyle(MyButtonStyle()) // Apply the custom button style
            }
            .frame(maxWidth: .infinity)
            
            .background(Color.white)
            .padding(.top, 20)
            .padding(.horizontal, 40)
            .shadow(radius: 2)
            .padding(.bottom,30)
            HStack {
                Text("Email")
                Spacer()
            }.padding(.horizontal, 40)
                .foregroundColor(.secondary)
                .bold()
            CustomTF(hint: "Enter your email ", value: $email).padding(.horizontal, 40)
            HStack {
                Text("Password")
                Spacer()
            }
            .padding(.horizontal, 40)
            .padding(.top, 30)
            .foregroundColor(.secondary)
            .bold()
            CustomTF( hint: "Enter your password ",isPassword: true, value: $password).padding(.horizontal, 40).padding(.top, 2)
            HStack {
                Spacer()
                Button("Forgot Password?") {
                    // Forgot password action
                    showForgetPwdView.toggle()
                }
            }
            .padding(.horizontal, 40)
            .foregroundColor(.secondary)
            Toggle(isOn: $isOn) {
                Text("Remember me")
                    .foregroundColor(Color(hex: "#152354"))
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            .padding(.top,20)
            Button(action: {
                // Action to perform when the button is tapped
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.themeSecondary)
            .padding(.horizontal, 40)
            .padding(.top,20)
            .padding(.bottom,50)
            
        }
        .sheet(isPresented: $showForgetPwdView, content: {
            ForgetPwdView(email: .constant(""))
                .presentationDetents([.height(400)])
                .presentationCornerRadius(30)
        })
    }
      

}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(Color(hex: "#152354"))

                configuration.label
                Spacer()
            }.padding(.horizontal, 40)
        })
    }
}

// Preview code
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
