require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'opinion Association' do
    it { should belong_to(:author) }
  end
end
