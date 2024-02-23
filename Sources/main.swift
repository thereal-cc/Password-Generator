import Foundation

func generatePassword(_ passwordLen: Int, _ lowerCaseSelect: Bool, _ upperCaseSelect: Bool, _ numbersSelect: Bool, _ specialsSelect: Bool) -> String {
    // Declare Vars
    let lowerCase: String = "abcdefghijklmnopqrstuvwxyz"
    let upperCase: String = "ABCDEFGHIJKLMNOPQRSTUZWXYZ"
    let numbers: String = "0123456789"
    let specialChars: String = "!@#$%^&*()"
    var availableChars: String = ""
    var password: String = ""

    // Add to available chars
    if lowerCaseSelect { availableChars += lowerCase }
    if upperCaseSelect { availableChars += upperCase }
    if numbersSelect { availableChars += numbers }
    if specialsSelect { availableChars += specialChars }

    // If No Options are selected
    if availableChars.count == 0 {
        print("Error: Need to Select at least one option")
        exit(EXIT_FAILURE)
    }

    // For each letter in password, add random char from availableChars
    for _ in 0..<passwordLen {
        let randomIndex = Int.random(in: 0..<availableChars.count)
        password.append(availableChars[availableChars.index(availableChars.startIndex, offsetBy: randomIndex)])
    }

    return password
}

func main() {
    print("Swift Password Generator")

    // Password Len
    print("Password Length: ", terminator: "")
    guard let lenString = readLine(), let passLen = Int(lenString), passLen > 0 else {
        print("Invalid Input. Please enter a positive integer.")
        return
    }

    // Lowercase
    print("Do you want to use lowercase letters? (y/n): ", terminator: "")
    guard let lowerString = readLine()?.lowercased(), lowerString == "y" || lowerString == "n" else {
        print("\nInvalid Input. Please enter 'y' or 'n'.")
        return
    }
    let lowers = lowerString == "y"

    // Uppercase
    print("Do you want to use lowercase letters? (y/n): ", terminator: "")
    guard let upperString = readLine()?.lowercased(), upperString == "y" || upperString == "n" else {
        print("\nInvalid Input. Please enter 'y' or 'n'.")
        return
    }
    let uppers = upperString == "y"

    // Numbers
    print("Do you want to use numbers (y/n): ", terminator: "")
    guard let numString = readLine()?.lowercased(), numString == "y" || numString == "n" else {
        print("\nInvalid Input. Please enter 'y' or 'n'.")
        return
    }
    let numbers = numString == "y"

    // Special Characters
    print("Do you want to use special chars (y/n): ", terminator: "")
    guard let specialString = readLine()?.lowercased(), specialString == "y" || specialString == "n" else {
        print("\nInvalid Input. Please enter 'y' or 'n'.")
        return
    }
    let specials = specialString == "y"
    
    let genPassword = generatePassword(passLen, lowers, uppers, numbers, specials);
    print("Here's your generated password: \(genPassword)")
    print("Thank you for using!")
    
    return
}

main()