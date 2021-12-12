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

for row in reportData {
    let arr = Array(row)
    data.append(arr)
    
}

var gammaRate = ""
for i in 0 ... data[0].count - 1 {
    var clm = [Character]()
    
    for ii in 0 ... data.count - 1 {
        clm.append(data[ii][i])
    }
    
    let zeroCount = clm.filter { $0 == "0"}.count
    let oneCount = clm.filter { $0 == "1"}.count
    
    if zeroCount > oneCount {
        gammaRate += "0"
    } else if oneCount > zeroCount {
        gammaRate += "1"
    } else {
        
    }
}
print(gammaRate)

