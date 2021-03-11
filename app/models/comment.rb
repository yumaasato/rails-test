class Comment < ApplicationRecord
  belongs_to :board # #commentはboardに紐づく（多のCommentの方に1のモデルを紐付ける）
  validates :name, presence: true, length: { maximum: 10 }
  validates :comment, presence: true, length: { maximum: 1000 } #presence: trueで入力必須になる
end
