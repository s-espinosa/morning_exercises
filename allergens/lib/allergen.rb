class Allergen
  def determine_allergies(number)
    allergies = []
    until number == 0
      allergies.push(find_max(number))
      number -= allergies.last
    end
    allergies.map do |allergy|
      ALLERGY_TABLE[allergy]
    end
  end

  def find_max(number)
    allergies = ALLERGY_TABLE.keys
    max       = nil
    allergies.each do |allergy|
      if allergy <= number
        max = allergy
      end
    end
    max
  end

  private
  ALLERGY_TABLE = {
    1 => "eggs",
    2 => "peanuts",
    4 => "shellfish",
    8 => "strawberries",
    16 => "tomatoes",
    32 => "chocolate",
    64 => "pollen",
    128 => "cats"
  }
end
