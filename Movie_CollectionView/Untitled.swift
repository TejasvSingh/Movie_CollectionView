//
//  Untitled.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/6/26.
//

struct StringGenerator{
    func generateString(_ num:Int)-> String{
        switch (num % 3 == 0 && num > 0, num % 5 == 0 && num > 0) {
            case (true,true):
                return "FizzBuzz"
            case (false, true):
                return "Buzz"
            case (true, false):
                return "Fizz"
            default:
                return "\(num)"
            }
        }
    }
