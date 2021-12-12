import Foundation

func loadData() -> String{
    do {
        return try String(contentsOfFile: "/Users/moritzdiedenhofen/Documents/Daten/input.txt")
    } catch {
        return ""
    }
}

let content = loadData()
var reportData = content.split(separator: "\n")
var data = [[Character]]()
var index = 0

let oxygenRating = getRating(typ: ratingType.oxygen)
let scrubberRating = getRating(typ: ratingType.scrubber)

let lifeSupportRating = oxygenRating * scrubberRating
print(lifeSupportRating)

func getRating(typ: ratingType) -> Int {

    index = 0
    fillData()
    
    while data.count != 1 {
        let numberToKeep = searchForNumber(dat: data, searchIndex: index, typ: typ)
        data = removeLines(keep: numberToKeep, searchIndex: index)
        index += 1
    }
    
   return GetIntegerFromBit(value: String(data[0]))
}

func fillData() {
    data.removeAll()
    for row in reportData {
        let arr = Array(row)
        data.append(arr)
    }
}

func removeLines(keep: Int, searchIndex: Int) -> [[Character]] {
    
    for i in stride(from: data.count - 1, to: -1, by: -1){
        if String(data[i][searchIndex]) != String(keep) {
            data.remove(at: i)
        }
    }
    return data
}

func searchForNumber(dat: [[Character]], searchIndex: Int, typ: ratingType) -> Int {
    var clm = [Character]()
    
    for i in 0 ... dat.count - 1 {
        clm.append(dat[i][searchIndex])
    }
    
    let zeroCount = clm.filter { $0 == "0"}.count
    let oneCount = clm.filter { $0 == "1"}.count
    
    if typ == ratingType.oxygen {
        if zeroCount > oneCount {
            return 0
        } else if oneCount > zeroCount {
            return 1
        } else {
            return 1
        }
        
        
    } else if typ == ratingType.scrubber {
        if zeroCount > oneCount {
            return 1
        } else if oneCount > zeroCount {
            return 0
        } else {
            return 0
        }
        
    }
    return 0
}

func GetIntegerFromBit(value: String) -> Int {
    if let v = Int(value, radix: 2) {
        return v
    }
    return -1
}

enum ratingType {
    case oxygen
    case scrubber
}
