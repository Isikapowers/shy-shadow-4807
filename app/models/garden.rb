class Garden < ApplicationRecord
  has_many :plots

  def plants_harvest_less_than_100
    plots.select('plants.name, count(plants.id) as plant_count')
         .distinct
         .joins(:plants)
         .where('plants.days_to_harvest < ?', 100)
         .group('plants.name')
         .order('plant_count DESC')
  end
end
