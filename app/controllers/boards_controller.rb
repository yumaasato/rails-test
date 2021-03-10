class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]  #各アクションが実行される前にset_target_boardが実行される

  def index
    @boards = Board.page(params[:page]) #boardモデルを使ってデータを取得する
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params) #createメソッドの引数に保存するパラメータを渡すことで保存できる
    redirect_to board ##boardオブジェクトにはデータを作成した時点でIDが付与されている
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to board #/boards/:idのパスにリダイレクトされる（更新処理の後に）
  end

  def destroy
    @board.delete

    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id]) #idに対応するBoardオブジェクトを取得することができる
  end
end