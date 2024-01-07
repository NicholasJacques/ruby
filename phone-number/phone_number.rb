module PhoneNumber
  def self.clean(phone_number)
    cleaned_number = phone_number.gsub(/\D/, '')
    if cleaned_number.size == 11
      cleaned_number.match?(/^1[2-9][0-9]{2}[2-9][0-9]{6}$/) ? cleaned_number[1..] : nil
    else
      cleaned_number.match?(/^[2-9][0-9]{2}[2-9][0-9]{6}$/) ? cleaned_number : nil
    end
  end
end