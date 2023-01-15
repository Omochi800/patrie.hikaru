class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :follower,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :followed,class_name:"Relationship",foreign_key:"followed_id",dependent: :destroy

  has_many :following_user,through: :follower,source: :followed
  has_many :follower_user,through: :followed,source: :follower



  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/jinnbutu.png')
      profile_image.attach(io: File.open(file_path), filename: 'jinnbutu.png', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    following_user.include?(user)
  end
end
