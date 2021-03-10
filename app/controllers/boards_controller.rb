class BoardsController < ApplicationController
  def index
    @boards = Board.all #boardモデルを使ってデータを取得する
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params) #createメソッドの引数に保存するパラメータを渡すことで保存できる
    redirect_to board ##boardオブジェクトにはデータを作成した時点でIDが付与されている
  end

  def show
    @board = Board.find(params[:id]) #idに対応するBoardオブジェクトを取得することができる
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id]) ##updateアクションの場合はviewを作成せずインスタンス変数をviewに渡す必要がない
    board.update(board_params)
    redirect_to board #/boards/:idのパスにリダイレクトされる（更新処理の後に）
  end

  def destroy
    board = Board.find(params[:id])
    board.delete

    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end