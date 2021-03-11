class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]  #各アクションが実行される前にset_target_boardが実行される

  def index
    @boards = Board.page(params[:page]) #boardモデルを使ってデータを取得する
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.create(board_params) #createメソッドの引数に保存するパラメータを渡すことで保存できる、boardオブジェクトにはデータを作成した時点でIDが付与されている
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to board #/boards/:idのパスにリダイレクトされる（更新処理の後に）
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id]) #idに対応するBoardオブジェクトを取得することができる
  end
end