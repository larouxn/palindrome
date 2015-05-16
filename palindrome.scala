def isPalindrome(ls: List[Char]): Boolean = ls == ls.reverse

def canBePalindrome(ls: List[Char]): (Boolean, String) = {
  // Graciously borrowed from solution found on
  // http://stackoverflow.com/questions/11448685/
  //   scala-how-can-i-count-the-number-of-occurrences-in-a-list
  val map = ls.groupBy(identity).mapValues(_.size)

  map count ((entry: (Char, Int)) => entry._2 % 2 != 0) match {
    case n if n > 1 => (false, ls.mkString)
    case _          => {
      val oddsMap  = map filter ((entry: (Char, Int)) => entry._2 % 2 != 0)
      val evensMap = map filter ((entry: (Char, Int)) => entry._2 % 2 == 0)
      var buildStr = ""
      for (entry <- evensMap) {
        for (i <- 1 to entry._2 / 2) {
          buildStr += entry._1
        }
      }

      var single = '\u0000'
      for (entry <- oddsMap) {
        if (entry._2 > 1) {
          for (i <- 1 to entry._2 / 2)
            buildStr += entry._1
        } else {
          single = entry._1
        }
      }

      (true, buildStr + single + buildStr.reverse)
    }
  }
}


if (isPalindrome(args(0).toList)) println(args(0) + " is a palindrome")
else {
  val finalStr = canBePalindrome(args(0).toList) match {
    case (true, ls)  => ls.mkString
    case _           => "impossible"
  }

  println("A palindromic form of " + args(0) + " is " + finalStr)
}
