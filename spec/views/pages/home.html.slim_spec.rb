require 'spec_helper'

describe 'pages/home.html.slim' do
  context 'when not logged in' do
    it 'displays log in link' do
      render
      expect(rendered).to have_link 'Log In', href: new_user_session_path
    end
  end

  context 'when logged in' do
    it 'displays log out link' do
      user = create(:user)
      sign_in user
      render
      expect(rendered).to have_link 'Log Out', href: destroy_user_session_path
    end
  end
end