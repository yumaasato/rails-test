class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :board, foreign_key: true # #外部キー制約をつける→boardsテーブルに存在しないIDはcommentのboardとして保存できない
      t.string :name, null: false # #空の状態で保存できない
      t.text :comment, null: false

      t.timestamps
    end
  end
end
