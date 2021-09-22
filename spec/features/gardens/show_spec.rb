require "rails_helper"

RSpec.describe "Garden Show Page" do
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
  end

  describe "#Story 3" do
    it "displays a list of unique plants with less than 100 days to harvest that are included in that garden's plots" do
      visit "/gardens/#{@garden.id}"

      expect(page).to have_content("Plants in plots with less than 100 days:")
      expect(page).to have_content(@tomoto)
      expect(page).to have_content(@squash.name)
      expect(page).to have_no_content(@tomato_2)
      expect(page).to have_no_content(@avocado)
      expect(page).to have_no_content(@cucumber)
    end
  end
end
