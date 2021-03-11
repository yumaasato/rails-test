# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :board_tag_relations, dependent: :delete_all #destoryでデータを削除する場合にdependentの操作が有効になる
  has_many :boards, through: :board_tag_relations #中間テーブルであるboard_tag_relationsを経由するための設定
end
