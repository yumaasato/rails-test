Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boards, only: [:index, :new, :create, :show, :edit, :update] ##複数のルーティングが定義される
end
