class Shot < ApplicationRecord  
    acts_as_votable
    is_impressionable
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :comments, dependent: :destroy
    def default_image
        "https://via.placeholder.com/150x150?text=Default+Image"
    end
end
