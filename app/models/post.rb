class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :image

  def get_image
  unless image.attached?
      file_path = Rails.root.join('app/assets/images/mount.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image
  end
end
