class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, presence: true, numericality: {only_integer:true, minimum: 0}
  validate :must_carry_men_or_women_apparel

  def must_carry_men_or_women_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "Must carry mens or womens apparel")
    end
  end

end
