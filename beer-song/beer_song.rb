module BeerSong 
  def self.recite(beers, recitations)
    result = []
    recitations.times do
      case
        when beers > 1
          result << "#{beers} bottles of beer on the wall, #{beers} bottles of beer.\nTake one down and pass it around, #{beers - 1} #{pluralize_bottle(beers - 1)} of beer on the wall.\n"
        when beers == 1
          result << "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
        when beers == 0
          result << "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
          break
      end
      beers = beers - 1
    end
    result.join("\n")
  end

  def self.pluralize_bottle(count)
    return count == 1 ? "bottle" : "bottles"
  end
end