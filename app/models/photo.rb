class Photo < ActiveRecord::Base
	mount_uploader :image, CustomPicUploader
end
