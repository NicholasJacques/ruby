class InvalidCodonError < StandardError; end

module Translation
    POLYPEPTIDES = {
        'AUG' => 'Methionine',
        'UUU' => 'Phenylalanine',
        'UUC' => 'Phenylalanine',
        'UUA' => 'Leucine',
        'UUG' => 'Leucine',
        'UCU' => 'Serine',
        'UCC' => 'Serine',
        'UCA' => 'Serine',
        'UCG' => 'Serine',
        'UAU' => 'Tyrosine',
        'UAC' => 'Tyrosine',
        'UGU' => 'Cysteine',
        'UGC' => 'Cysteine',
        'UGG' => 'Tryptophan',
    }
    POLYPEPTIDES.default_proc = proc {|_, k| raise InvalidCodonError.new("#{k} is not a valid codon.")}
    STOP_CODONS = %w[UAA UAG UGA]

    def self.of_rna(strand)
        result = []
        strand.chars.each_slice(3).map(&:join).each do |codon|
            break if STOP_CODONS.include?(codon)
            result << POLYPEPTIDES[codon]
        end
        result
    end
end