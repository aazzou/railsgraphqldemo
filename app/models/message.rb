class Message < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
end
