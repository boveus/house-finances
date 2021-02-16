class Asset < ActiveRecord::Base
  belongs_to :representative
  validates :name, presence: true, uniqueness: {case_insensitive: true}
  validates :date, presence: true
  validates :dollar_amount, presence: true

  def max_dollar_amount
    dollar_amount.split("-").last.to_i
  end

  def min_dollar_amount
    dollar_amount.split("-").first.to_i
  end

  #TODO extract to presenter

  def year
    Date.parse(date).year
  end

  def display_dollar_amount
    "$#{dollar_amount.split('-').join('-$')}"
  end

  def link
    "https://disclosures-clerk.house.gov/public_disc/ptr-pdfs/#{year}/#{reference}"
  end
end