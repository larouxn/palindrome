(def orig (first *command-line-args*))
(def input (seq (char-array (first *command-line-args*))))

(defn palindrome? [s] (= s (reverse s)))
(defn string-from-map [[k, v]] (apply str (take (quot v 2) (repeat k))))

(def occurrences-map (frequencies input))
(def evens-map (filter (fn [[_, v]] (even? v)) occurrences-map))
(def odds-map  (filter (fn [[_, v]] (odd?  v)) occurrences-map))
(def odds-rest (filter (fn [[_, v]] (> v 1)) odds-map))

(def string-from-evens (apply str (map string-from-map evens-map)))
(def string-from-odds  (apply str (map string-from-map odds-rest)))
(def single (apply str (keys (filter (fn [[_, v]] (= v 1)) odds-map))))

(if (palindrome? input)
  (printf "%s is a palindrome%n" orig)
  (if (> (count (keys odds-map)) 1)
    (printf "%s cannot be made into a palindrome%n" orig)
    (printf "A palindromic form of %s is %s%n" orig (apply str (concat string-from-evens string-from-odds single (reverse string-from-evens))))
  )
)
