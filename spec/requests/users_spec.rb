# spec/controllers/users_controller_spec.rb
require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
    it 'returns a JSON response with a list of users' do
      user = FactoryBot.create(:user)
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'GET #show' do
    it 'returns a success response' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.to_param }
      expect(response).to be_truthy
    end
    it 'returns a JSON response with the user' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.to_param }
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect do
          post :create, params: { user: FactoryBot.create(:user) }
        end.to change(User, :count).by(1)
      end
      it 'renders a JSON response with the new user' do
        user =  FactoryBot.create(:user)
        post :create, params: { user: user }
        expect(response).to be_truthy
      end
    end
    
    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        post :create, params: { user: { email: 'invalid-email' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  
  describe 'PUT #update' do
    
    it 'updates the requested user if user is admin' do
      user = FactoryBot.create(:user)
      user.name = 'Updated Name'
      put :update, params: { id: user.to_param, user: user }
      expect(user.name).to eq('Updated Name')
    end
    it 'renders a JSON response with the updated user' do
      user = FactoryBot.create(:user)
      put :update, params: { id: user.to_param, user: user }
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = FactoryBot.create(:user)
      expect do
        delete :destroy, params: { id: user.to_param }
      end.to change(User, :count).by(-1)
    end
  end
  
  it 'renders a JSON response with a success message' do
    user = FactoryBot.create(:user)
    delete :destroy, params: { id: user.to_param }
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to have_key('message')
  end
end
