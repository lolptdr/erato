class WaveformsController < ApplicationController
  def index
    @waveforms = Waveform.all
  end

  def new
    @waveform = Waveform.new
  end

  def show
    @waveform = Waveform.find(params[:id])
  end

  def create
    @waveform = Waveform.new(sound_params)

    if @waveform.save
      check = ReadInWav.run(@waveform.attachment)
      check2 = ReadInWav.meta(@waveform.attachment)
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
