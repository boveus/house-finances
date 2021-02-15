class Representative < ActiveRecord::Base
  has_many :assets
  validates :name, presence: true, uniqueness: {case_insensitive: true}
  validates :district, presence: true

  def self.richest_rep
    max = self.all.max_by do |rep| 
      rep.max_assets
    end
    [max.id, max.name, max.asset_references, max.asset_names, max.total_assets_value]
  end

  def total_assets_value
    "$#{min_assets.to_s(:delimited)}-$#{max_assets.to_s(:delimited)}"
  end

  def min_assets
    assets.map(&:min_dollar_amount).reduce(:+)
  end

  def max_assets
    assets.map(&:max_dollar_amount).reduce(:+)
  end

  def asset_references
    assets.pluck(:reference).uniq
  end

  def asset_names
    assets.pluck(:name).uniq
  end
end