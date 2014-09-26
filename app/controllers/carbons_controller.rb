class CarbonsController < ApplicationController
  def index
    @carbons = Carbon.all
  end

  def new
    @carbon = Carbon.new
  end

  def create
    @carbon = Carbon.new(carbon_params)
    
    if @carbon.save
      redirect_to carbons_path, notice: "New image '#{@carbon.title}' has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @carbon = Carbon.find(params[:id])
    @carbon.destroy
    redirect_to carbons_path, notice: "The image '#{@carbon.title}' has been deleted."
  end

  private
  def carbon_params
    params.require(:carbon).permit(:title, :description, :attachment)
  end
end
