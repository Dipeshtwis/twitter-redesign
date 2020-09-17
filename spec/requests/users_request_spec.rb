require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #sign_in' do
    before { get sign_in_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it { should render_template('new') }
  end

  describe 'GET #index' do
    before { get root_path }

    it { should redirect_to(sign_in_path) }
  end
end
