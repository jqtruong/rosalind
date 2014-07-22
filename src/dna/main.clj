(ns rosalind.dna)

(def sample-dna "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")

(defn count-nts [dna]
  "Loop through string as `seq' to count each base characters. The
  resulting `seq' will be ordered alphabetically upon return."
  (loop [nts {\A 0 \T 0 \C 0 \G 0}
         dna (seq dna)]
    (if dna
      (recur (assoc nts (first dna) (inc (get nts (first dna))))
             (next dna))
      nts)))
