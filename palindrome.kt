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
      var builtStringEvens = ""
      var oddCountMap      = map.filter( {entry -> (entry.value % 2 != 0)} )
      var evenCountMap     = map.filterNot( {entry -> (entry.value % 2 != 0)} )

      

      println("done even building")
    }
  }
}
