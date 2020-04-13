class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, unless: :image?

  acts_as_taggable

  mount_uploader :image, ImageUploader
end
