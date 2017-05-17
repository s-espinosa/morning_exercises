require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/allergen'

class AllergenTest < Minitest::Test
  def test_it_can_determine_a_person_is_allergic_to_eggs
    allergen = Allergen.new
    actual   = allergen.determine_allergies(1)
    expected = ["eggs"]

    assert_equal(expected, actual)
  end

  def test_it_can_find_a_price_is_right_max
    allergen = Allergen.new
    actual   = allergen.send(:find_max, 65)
    expected = 64

    assert_equal(expected, actual)
  end

  def test_it_can_deal_with_eggs_and_peanuts
    allergen = Allergen.new
    actual   = allergen.determine_allergies(3)
    expected = ["peanuts", "eggs"]

    assert_equal(expected, actual)
  end

  def test_it_can_deal_with_peanuts_and_chocolate
    allergen = Allergen.new
    actual   = allergen.determine_allergies(34)
    expected = ["chocolate", "peanuts"]

    assert_equal(expected, actual)
  end

  def test_it_can_translate_codes_to_allergies
    allergen = Allergen.new
    actual   = allergen.send(:translate, [4, 64])
    expected = ["shellfish", "pollen"]

    assert_equal expected, actual
  end

  def test_it_can_find_allergy_codes
    allergen = Allergen.new
    actual   = allergen.send(:find_allergy_codes, 65)
    expected = [64, 1]

    assert_equal expected, actual
  end
end
