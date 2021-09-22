require "rails_helper"

RSpec.describe "Plot Index Page" do
  before :each do
    @garden = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: "Large", direction: "East")
    @plot_2 = @garden.plots.create!(number: 2, size: "Medium", direction: "West")

    @tomato = @plot_1.plants.create!(name: "Tomato", description: "Grape tomato", days_to_harvest: 90)
    @squash = @plot_1.plants.create!(name: "Squash", description: "Yellow squash", days_to_harvest: 60)
    @avocado = @plot_2.plants.create!(name: "Avocado", description: "Mexico avocado", days_to_harvest: 120)
  end

  describe "#Story 1" do
    it "displays a list of all plot numbers" do
      visit "/plots"

      expect(page).to have_content("All Plot Numbers")
      expect(page).to have_content(@plot_1.number)
      expect(page).to have_content(@plot_2.number)
    end

    it "displays the names of all that plot's plants under each plot number" do
      visit "/plots"

      within("#plot-#{@plot_1.id}") do
        expect(page).to have_content(@tomato.name)
        expect(page).to have_content(@squash.name)
      end

      within("#plot-#{@plot_2.id}") do
        expect(page).to have_content(@avocado.name)
      end
    end
  end

  describe "#Story 2" do
    it "has a link to remove that plant feom that plot" do
      visit "/plots"

      within("#plant-#{@tomato.id}") do
        expect(page).to have_link("Delete Plant")

        click_on "Delete Plant"

        expect(current_path).to eq("/plots")
      end
      expect(page).to have_no_content(@tomato.name)
      expect(@tomato).to be_a(Plant)
    end
  end
end
