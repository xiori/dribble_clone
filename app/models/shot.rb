class Shot < ApplicationRecord  
    is_impressionable
    mount_uploader :image, ImageUploader
    belongs_to :user

    def default_image
        "https://via.placeholder.com/150x150?text=Default+Image"
    end
end
