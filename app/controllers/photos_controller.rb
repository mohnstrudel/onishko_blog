class PhotosController < ApplicationController

def index
	@photos = Photo.all
end

def new
	@photo = Photo.new
end

def create
	@photo = Photo.create(photo_params)
	redirect_to @photo
end

def show
	@photo = Photo.find(params[:id])
end

private
	def photo_params
		params.require(:photo).permit(:title, :image, :remote_image_url)
	end

end
