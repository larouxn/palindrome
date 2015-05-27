(def orig (first *command-line-args*))

(def input (seq (char-array (first *command-line-args*))))

(defn palindrome? [s] (= s (reverse s)))

(def occurrences-map (frequencies input))

(def evens-map (filter (fn [[_, v]] (even? v)) occurrences-map))

(def odds-map (filter (fn [[_, v]] (odd? v)) occurrences-map))

(if (palindrome? input)
  (printf "%s is a palindrome%n" orig)
  (if (> (count (keys odds-map)) 1)
    (printf "%s cannot be made into a palindrome%n" orig)
    (println "dingo"))
)
