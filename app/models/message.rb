class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image
  # validates :content, presence: true
  validates :content, presence: true, unless: :was_attached?
  # unless:のおかげで画像がなければ(false)バリエーションの検証を行うことになる?
  def was_attached?
    self.image.attached?
    # 画像があればture,なければfalseを返す
  end
end
