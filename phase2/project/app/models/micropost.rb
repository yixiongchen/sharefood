class Micropost < ActiveRecord::Base
    serialize :list_of_user_id,Array
    belongs_to :user
    validates :content,  presence: true, length: { maximum: 150 }
    validates :location,  presence: true, length: { maximum: 150 }
    mount_uploader :picture, PictureUploader
    validates :foodtype,  presence: true, length: { maximum: 50 }
    default_scope {order('microposts.created_at DESC')}
end
