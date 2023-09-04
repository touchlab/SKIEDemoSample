import SwiftUI
import shared

struct CalculatorView: View {
    @StateObject private var computation = Computation()
    
    var body: some View {
        VStack {
            Text(computation.readout)
                .font(.title)
                .padding()
            HStack {
                Text("1")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "1")
                    }
                Text("2")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "2")
                    }
                Text("3")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "3")
                    }
                Text("+")
                    .font(.body.weight(.bold))
                    .foregroundColor((computation.op is OperationType.Plus) ? .orange : .blue)
                    .onTapGesture {
                        computation.input(inputValue: "+")
                    }
                    .padding()
            }
            HStack {
                Text("4")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "4")
                    }
                Text("5")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "5")
                    }
                Text("6")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "6")
                    }
                Text("-")
                    .font(.body.weight(.bold))
                    .foregroundColor((computation.op is OperationType.Minus) ? .orange : .blue)
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "-")
                    }
            }
            HStack {
                Text("7")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "7")
                    }
                Text("8")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "8")
                    }
                Text("9")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "9")
                    }
                Text("*")
                    .font(.body.weight(.bold))
                    .foregroundColor((computation.op is OperationType.Multiply) ? .orange : .blue)
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "*")
                    }
           }
            HStack {
                Text("0")
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "0")
                    }
                Text(".")
                    .font(.body.weight(.bold))
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: ".")
                    }
                Text("<")
                    .font(.body.weight(.bold))
                    .foregroundColor(.blue)
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "<")
                    }
                Text("/")
                    .font(.body.weight(.bold))
                    .foregroundColor((computation.op is OperationType.Divide) ? .orange : .blue)
                    .padding()
                    .onTapGesture {
                        computation.input(inputValue: "/")
                    }
            }
            HStack {
            Text("CLR")
                .foregroundColor(.blue)
                .padding()
                .onTapGesture {
                    computation.input(inputValue: "C")
                }
            Text("=")
                .font(.body.weight(.bold))
                .foregroundColor(.blue)
                .padding()
                .onTapGesture {
                    computation.input(inputValue: "=")
                }
            }

        }
    }
}

struct ContentViewSKIE_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
