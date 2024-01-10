class Nucleotide
  attr_reader :histogram

  def initialize(dna_strand)
    @histogram = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
    dna_strand.each_char do |char|
      @histogram[char] += 1
    end
  end

  def self.from_dna(dna_strand)
    raise ArgumentError if dna_strand.match?(/[^ACTG]/)

    new(dna_strand)
  end

  def count(nucleotide)
    @histogram[nucleotide]
  end

end