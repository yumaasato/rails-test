class Comment < ApplicationRecord
  belongs_to :board # #commentはboardに紐づく（多のCommentの方に1のモデルを紐付ける）
end
