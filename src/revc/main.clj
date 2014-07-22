(ns rosalind.revc
  (:require [clojure.string :as string]))

(def sample-strand "AAAACCCGGT")

;;; possible base pairs
;;; TODO move this to a global file
(def bps {\A \T
          \T \A
          \C \G
          \G \C})

(defn revc [strand]
  "Given a map of possible base pairs, loop through the strand string
  to build its reverse component."
  (loop [opp-strand ()
         strand (seq strand)]
    (if strand
      (recur (cons (get bps (first strand)) opp-strand)
             (next strand))
      (apply str opp-strand))))
