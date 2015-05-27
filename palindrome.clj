(def orig (first *command-line-args*))
(def input (seq (char-array (first *command-line-args*))))
(defn palindrome? [s] (= s (reverse s)))
(def occurrences-map (frequencies input))
(def evens-map (filter (fn [[_, v]] (even? v)) occurrences-map))
(def odds-map (filter (fn [[_, v]] (odd? v)) occurrences-map))

(defn string-from-map [k, v] (apply str (take (quot v 2) (repeat k))))

(defn get-single [k, _] k)

; build full string with (apply str 1 2 3)
; iterate through pairs with (doseq [[k, v] map-name] ())
; final print = (printf "A palindromic form of %s is %s%n" orig (build-string s-evens s-odds single))

(if (palindrome? input)
  (printf "%s is a palindrome%n" orig)
  (if (> (count (keys odds-map)) 1)
    (printf "%s cannot be made into a palindrome%n" orig)
    (printf "A palindromic form of %s is %s%n" orig orig)
  )
)
