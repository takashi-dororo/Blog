class Post < ApplicationRecord
  belongs_to :user
  # 投稿された順番を降順に指定
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, length: { maximum: 20 }
  validates :content, presence: true
end
