class Allergen
  def determine_allergies(number)
    allergy_codes = find_allergy_codes(number)
    translate(allergy_codes)
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

  def find_allergy_codes(number)
    allergy_codes = []
    until number == 0
      allergy_codes.push(find_max(number))
      number -= allergy_codes.last
    end
    allergy_codes
  end

  def find_max(number)
    allergies = ALLERGY_TABLE.keys
    max       = nil
    allergies.each do |allergy|
      max = allergy if allergy <= number
    end
    max
  end

  def translate(allergy_codes)
    allergy_codes.map do |allergy|
      ALLERGY_TABLE[allergy]
    end
  end
end
