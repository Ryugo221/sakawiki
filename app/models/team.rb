class Team < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user, dependent: :destroy
    has_many :players, dependent: :destroy
    mount_uploader :image, ImageUploader
end
