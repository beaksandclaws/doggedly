require 'rails_helper'

RSpec.describe Users::SessionsController do
  describe 'POST #create' do

    context 'when password is invalid' do
      it 'renders the page with error' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = create(:user)

        post :create, session: { email: user.email, password: 'invalid' }

        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/^Invalid email or password./)
      end
    end

    context 'when password is valid' do
      it 'sets the user in session and redirects to homepage' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = create(:user)

        post :create, session: { email: user.email, password: user.password }

        expect(response.status).to eq 200
      end
    end
  end
end
