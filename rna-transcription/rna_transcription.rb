class Complement
  DNA_COMPLEMENTS = {"G" => "C", "C" => "G", "T" => "A", "A" => "U"}
  
  def self.of_dna(nucleotides)
    complements = []
    nucleotides.each_char do |nucleotide|
      complements.push(DNA_COMPLEMENTS[nucleotide])
    end
    return complements.join
  end
end