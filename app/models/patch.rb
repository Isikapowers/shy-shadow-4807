class Patch < ApplicationRecord
  belongs_to :plant
  belongs_to :plot

  def self.find_plant_plot(plot_id, plant_id)
    where(plot_id: plot_id, plant_id: plant_id).first
  end
end
