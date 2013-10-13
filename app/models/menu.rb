class Menu < ActiveRecord::Base
  validates :restaurant_name, :description, :image_url, presence: true
  validates :restaurant_name, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:     %r{\.(gif|jpg|png)\Z}i,
    message:  'must be a URL for GIF, JPG or PNG image.'
  }
end
