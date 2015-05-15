def isPalindrome(ls: List[Char]): Boolean = ls == ls.reverse

def canBePalindrome(ls: List[Char]): (Boolean, List[Char]) = {
  // Graciously borrowed from solution found on
  // http://stackoverflow.com/questions/11448685/
  //   scala-how-can-i-count-the-number-of-occurrences-in-a-list
  val map = ls.groupBy(identity).mapValues(_.size)

  map count ((entry: (Char, Int)) => entry._2 % 2 == 0) match {
    case n if n > 1 => (false, ls)
    case _          => (true, ls)
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
