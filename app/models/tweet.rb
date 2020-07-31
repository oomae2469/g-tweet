class Tweet < ApplicationRecord
  validates :text, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :users, through: :likes

  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
