class Report < ApplicationRecord
  belongs_to :user
  has_one_attached :evidence

  validates :title, :description, :category, presence: true
end
