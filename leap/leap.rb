module Year
  def self.leap?(year)
    if (year % 4 == 0)
      if (year % 100 == 0)
        if (year % 400 != 0)
          return false
        end
      end
      true
    end
  end
end