(def input (seq (char-array (first *command-line-args*))))
(defn palindrome? [s] (= s (reverse s)))
(printf "%s%n" (palindrome? input))
