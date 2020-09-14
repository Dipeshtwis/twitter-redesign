class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :text, presence: :true, length: { minimum: 4, maximum: 300}
  scope :order_by_most_recent, -> { includes(:author).order(created_at: :desc) }
end
