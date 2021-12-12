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
var analysisData = [[Character]]()

for data in reportData {
 analysisData.append(Array(String(data)))
}


for i in 0...4 {
    var ones = 0
    var zeros = 0
    
    for data in (analysisData) {
        
        let num = String(Array(data)[i])
        
        if num == "1" {
            ones += 1
        } else {
            zeros += 1
        }
    }
    
    if  ones > zeros {
        removeLines(startingWith: "0", position: i)
    } else if zeros > ones {
        removeLines(startingWith: "1", position: i)
    } else {
        removeLines(startingWith: "1", position: i)
    }
    
}


printData()


func removeLines(startingWith:String, position:Int){
    
    for i in stride(from: analysisData.count - 1, to: 0, by: -1) {
        if analysisData[i][position] == Character(startingWith) {
          //  print("removed \(analysisData.remove(at: i))")
            analysisData.remove(at: i)
        }
    }
    //printData()
}

func printData() {
    for data in analysisData {
        print("current content \(data)")
    }
}


