require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation comment test' do
    it { should validate_presence_of(:content) }

    it do
      should validate_length_of(:content)
        .is_at_most(200)
        .with_message('maximum 200 characters allowed.')
    end
  end
end
