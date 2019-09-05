class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new_bands_url
    end
  end

  def new
    @band = Band.new
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    if band.update(band_params)
      render :show
    else
      flash.now[:messages] = band.errors.full_messages
    end
  end

  def destroy
    band = Band.find(params[:id])
    if band
      band.destroy
      render :index
    else
      flash[:messages] = [ "Unable to delete" ]
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end