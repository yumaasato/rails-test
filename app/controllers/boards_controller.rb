class BoardsController < ApplicationController
  def index
    @boards = Board.all #boardモデルを使ってデータを取得する
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params) #createメソッドの引数に保存するパラメータを渡すことで保存できる
  end

  def show
    @board = Board.find(params[:id]) #idに対応するBoardオブジェクトを取得することができる
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end