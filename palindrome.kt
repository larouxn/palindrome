fun isPalindrome(str: List<String>): Boolean {
  return str == str.reverse()
}

fun buildPalindrome(str: String, chList: List<String>): Unit {
  var map = hashMapOf<String, Int>()
  for (c in chList) {
    if (map.get(c) == null) map.put(c, 1)
    else                    map.put(c, map.get(c)+1)
  }

  if (map.count( {entry -> (entry.value % 2 != 0)} ) > 1) {
    println(str + " cannot be made into a palindrome")
  } else {
    val oddsMap  = map.filter( {entry -> entry.value % 2 != 0} )
    val evensMap = map.filter( {entry -> entry.value % 2 == 0} )
    var buildStr = ""
    for (entry in evensMap) {
      for (i in 1..entry.value / 2)
        buildStr += entry.key
    }

    var single = ""
    for (entry in oddsMap) {
      if (entry.value > 1) {
        for (i in 1..entry.value / 2)
          buildStr += entry.key
      } else {
        single = entry.key
      }
    }

    println("A palindromic form of " + str + " is "
      + buildStr + single + buildStr.reverse())
  }
}

fun main(args: Array<String>) {
  val chList = args[0].split("").drop(1)
  if (isPalindrome(chList)) println(args[0] + " is a palindrome")
  else                      buildPalindrome(args[0], chList)
}
