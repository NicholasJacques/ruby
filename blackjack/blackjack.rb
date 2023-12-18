module Blackjack
  CARD_VALUES = {
    "ace" => 11,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "jack" => 10,
    "queen" => 10,
    "king" => 10,
  }

  def self.parse_card(card)
    CARD_VALUES.fetch(card, 0)
  end

  def self.sum_cards(card1, card2)
    parse_card(card1) + parse_card(card2)
  end

  def self.card_range(card1, card2)
    case sum_cards(card1, card2)
    when 4..11
      "low"
    when 12..16
      "mid"
    when 17..20
      "high"
    when 21
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    case
    when card1 == "ace" && card2 == "ace"
      "P"
    when card_range(card1, card2) == "blackjack"
      if ["ace", "king", "queen", "jack", "ten"].include?(dealer_card)
        "S"
      else
        "W"
      end
    when card_range(card1, card2) == "high"
      "S"
    when card_range(card1, card2) == "mid"
      if parse_card(dealer_card) >= 7
        "H"
      else
        "S"
      end
    when card_range(card1, card2) == "low"
      "H"
    end
  end
end
