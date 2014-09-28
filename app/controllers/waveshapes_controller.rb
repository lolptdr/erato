class WaveshapesController < ApplicationController

  def index
    @waveshapes = Waveshape.all
  end

  def new
    @waveshape = Waveshape.new
  end

  def show
    @waveshape = Waveshape.find(params[:id])
  end

  def create
    @waveshape = Waveshape.new(waveshape_params)

    if @waveshape.save
      # waveshape_sister = Waveform.generate(
      #   @waveshape.attachment,
      #   @waveshape.attachment.filename.sub!(/(?<=\.)[^.]*/, 'png'),
      # )
      # p @waveshape_sister
      redirect_to waveshapes_path, notice: "New waveshape '#{@waveshape.name}' has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @waveshape = Waveshape.find(params[:id])
    @waveshape.destroy
    redirect_to waveshapes_path, notice: "The waveshape '#{@waveshape.name}' has been deleted."
  end

  private
  def waveshape_params
    params.require(:waveshape).permit(:name, :description, :attachment)
  end
end
