(ns rosalind.rna
  (:require [clojure.string :as string]))

(def sample-strand "GATGGAACTTGACTACGTAAATT")

(defn transcribe-strand [strand]
  "Simple =clojure.string/replace= method use on \T to \U."
  (string/replace strand #"T" "U"))
