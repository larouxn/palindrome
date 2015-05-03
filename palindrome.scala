def isPalindrome(ls: List[Char]): Boolean =
  (ls take (ls.length / 2)) == ((ls takeRight (ls.length / 2)).reverse)

def canBePalindrome(ls: List[Char]): (Boolean, List[Char]) = {
  var canBe = false
  var validPerm = List[Char]()

  for (perm <- ls.permutations.toArray; if !canBe) {
    canBe = isPalindrome(perm)
    if (canBe)
      validPerm = perm
  }

  (canBe, validPerm)
}
println(
  if (isPalindrome(args(0).toList)) args(0) + " is a palindrome"
  else "A palindromic form of " + args(0) + " is " + (
          if (!canBePalindrome(args(0).toList)._1) "impossible"
          else (canBePalindrome(args(0).toList)._2).mkString)
)
