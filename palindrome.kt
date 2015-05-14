fun isPalindrome(str: List<String>): Boolean {
  return str == str.reverse()
}

fun main(args: Array<String>) {
  val chList = args[0].split("").drop(1)
  if (isPalindrome(chList))
    println(args[0] + " is a palindrome")
  else {
    var map = hashMapOf<String, Int>()
    for (c in chList) {
      if (map.get(c) == null) map.put(c, 1)
      else                    map.put(c, map.get(c)+1)
    }

    if (map.count( {entry -> (entry.value % 2 != 0)} ) > 1) {
      println(args[0] + " cannot be made into a palindrome")
    } else {
      var builtString  = ""
      var oddCountMap  = map.filter( {entry -> (entry.value % 2 != 0)} )
      var evenCountMap = map.filterNot( {entry -> (entry.value % 2 != 0)} )

      for (entry in evenCountMap) {
        builtString += entry.key
        map.put(entry.key, entry.value-1)
      }

      // 1) if there is one, decrement count of odd-#'d char and put it in a string
      // 2) make a string out of n/2 instances of the even-#'d characters, add it to
      // the beginning
      builtString += builtString.reverse()
      println("A palindromic form of this word is " + builtString)
    }
  }
}
