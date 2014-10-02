class UploadsController < ApplicationController
  include Transloadit::Rails::ParamsDecoder

  def index
    @uploads = Upload.all
  end
  def new
    @upload = Upload.new
  end

  def create
    Rails.logger.info("PARAMS: #{params[:transloadit].inspect}")

    @upload = Upload.new(upload_params)
    # Transloadit API params hash:
    # params[:transloadit][:results][:waveform].each do |output|
      # puts output[:name]
      # puts output[:url]
    # end 
    @upload["audio_attachment"] = params[:transloadit][:uploads][0][:url]
    output = params[:transloadit][:results][:waveform]
    @upload["name"] =  output[0]["name"]
    @upload["attachment"] = output[0]["url"] # Regex \/([^\/]+)$ for file name path
    binding.pry
    if @upload.save
      redirect_to uploads_path, notice: "New waveform '#{@upload.name}' has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to uploads_path, notice: "The upload '#{@upload.name}' has been deleted."
  end

  def upload_params
    params.require(:upload).permit(:name, :description, :attachment)
  end
end
