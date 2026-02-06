//
//  Calculator.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/5/26.
//

struct Calculator{
    func sum(_ a: Double?, _ b: Double?) -> Double{
        return (a ?? 0) + (b ?? 0)
    }
    func sub(a: Double?, b: Double?) -> Double{
        return (a ?? 0) - (b ?? 0)
    }
    func multiply(a: Double?, b: Double?) -> Double{
        return (a ?? 0) * (b ?? 0)
    }
    func divide(a: Double?, b: Double?) -> Double{
        if(b ?? 0) == 0{
            return 0
        }
        return (a ?? 0) / b!
    }

}
