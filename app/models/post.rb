class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :likes,dependent: :destroy



  def get_image
  unless image.attached?
      file_path = Rails.root.join('app/assets/images/mount.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  def self.looks(search,word)
    if search == "perfect_match"
      @book = Book.where("text LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("text LIKE?","#{word}%")
    elsif search == "backword_mach"
      @book = Book.where("text LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("text LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

end
