class SoundsController < ApplicationController
  def index
    @sounds = Sound.all
  end

  def new
    @sound = Sound.new
  end

  def show
    @sound = Sound.find(params[:id])
  end

  def create
    @sound = Sound.new(sound_params)

    if @sound.save
      check = ReadInWav.run(@sound.attachment)
      check2 = ReadInWav.meta(@sound.attachment)
      redirect_to sounds_path, notice: "New sound '#{@sound.name}' has been uploaded."
    else
      render "new"
    end
  end

  def append
    
  end  

  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy
    redirect_to sounds_path, notice: "The sound '#{@sound.name}' has been deleted."
  end

  # def read_in
  #   Soundster::SoundToImage params[:sound_url]
  # end




  private
  def sound_params
    params.require(:sound).permit(:name, :description, :attachment)
  end
end
