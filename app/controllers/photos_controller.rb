class PhotosController < ApplicationController

before_action :find_photo, only: [:show, :destroy]

def index
	@photos = Photo.all
end

def destroy
	@photo.delete
	flash[:danger] = "Photo destroyed!"
	redirect_to photos_path
end


def new
	@photo = Photo.new
end

def create
	@photo = Photo.create(photo_params)
	flash[:success] = "Photo successfully uploaded!"
	redirect_to @photo
end

def show
	
end

private
	def photo_params
		params.require(:photo).permit(:title, :image, :remote_image_url)
	end

	def find_photo
		@photo = Photo.find(params[:id])
	end

end
