class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  def get_image
  unless images.attached?
      file_path = Rails.root.join('app/assets/images/mount.png')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    images
  end
end
