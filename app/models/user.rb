class User < ApplicationRecord
  def thumbnail
    return self.image.variant(resize: '100x100')
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users, foreign_key: 'user_id'
  has_many :groups, through: :group_users

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end
