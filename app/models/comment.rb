class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200,
                                                too_long: 'maximum 200 characters allowed.' }

  belongs_to :user
  belongs_to :opinion
end
