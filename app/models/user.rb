class User < ApplicationRecord
  def thumbnail
    return self.image.variant(resize: '100x100')
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end