class PatchesController < ApplicationController
  def destroy
    plot = Plot.find(params[:plot_id])
    plant = plot.plants.find(params[:plant_id])
    patch = Patch.find_plant_plot(plot, plant)

    Patch.destroy(patch.id)

    redirect_to "/plots"
  end
end
