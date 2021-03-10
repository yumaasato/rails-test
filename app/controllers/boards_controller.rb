class BoardsController < ApplicationController
  def index
    @boards = Board.all #boardモデルを使ってデータを取得する
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params) #createメソッドの引数に保存するパラメータを渡すことで保存できる
    binding.pry
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end