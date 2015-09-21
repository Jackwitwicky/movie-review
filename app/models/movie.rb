class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
