class WaveformsController < ApplicationController

  def index
    @waveforms = Waveform.all
  end

  def new
    @waveform = Waveform.new
    @waveform_sister = Wave

  end

  def show
    @waveform = Waveform.find(params[:id])
  end

  def create
    @waveform = Waveform.new(waveform_params)

    if @waveform.save
      redirect_to waveforms_path, notice: "New waveform '#{@waveform.name}' has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @waveform = Waveform.find(params[:id])
    @waveform.destroy
    redirect_to waveforms_path, notice: "The waveform '#{@waveform.name}' has been deleted."
  end

  private
  def waveform_params
    params.require(:waveform).permit(:name, :description, :attachment)
  end
end
