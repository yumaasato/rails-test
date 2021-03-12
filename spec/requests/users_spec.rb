# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET /users/new' do

#     it 'レスポンスコードが200であること' do
#       get new_user_path
#       expect(response.status).to eq 200
#     end

#     it '新しいuserオブジェクトがビューに渡されること' do
#       get new_user_path
#       expect(response.body).to include user
#     end
#   end

#   describe 'POST /users' do

#     it 'マイページにリダイレクトされること' do
#       expect(post :create, params: params).to redirect_to(mypage_path)
#     end
#   end
# end
