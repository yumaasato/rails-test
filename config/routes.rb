Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'boards', to: 'boards#index' # get “boards”→ getメソッドで/boardsにリクエストが来た場合, to: ”boards#index”→ BoardsControllerメソッド（アクション）が呼ばれるように定義している。
  
  get 'boards/new', to: 'boards#new'
end
