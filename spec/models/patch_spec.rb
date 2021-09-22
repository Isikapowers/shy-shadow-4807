require 'rails_helper'

RSpec.describe Patch do
  before :each do
    @garden = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden_2 = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: "Large", direction: "East")
    @plot_2 = @garden.plots.create!(number: 2, size: "Medium", direction: "West")
    @plot_3 = @garden_2.plots.create!(number: 3, size: "Large", direction: "East")

    @tomato = @plot_1.plants.create!(name: "Tomato", description: "Grape tomato", days_to_harvest: 90)
    @tomato_2 = @plot_1.plants.create!(name: "Tomato", description: "Grape tomato", days_to_harvest: 90)
    @squash = @plot_1.plants.create!(name: "Squash", description: "Yellow squash", days_to_harvest: 60)
    @avocado = @plot_2.plants.create!(name: "Avocado", description: "Mexico avocado", days_to_harvest: 120)
    @cucumber = @plot_3.plants.create!(name: "Cucumber", description: "Cool cucumber", days_to_harvest: 70)

    Patch.create!(plot: @plot_1, plant: @tomato)
  end

  describe 'relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
  end

  describe "class methods" do
    it "can find plant and plot in a patch" do
      expect(Patch.find_plant_plot(@plot_1, @tomato)).to be_a(Patch)
    end
  end
end
