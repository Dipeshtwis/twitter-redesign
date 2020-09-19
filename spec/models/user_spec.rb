require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Association' do
    it { should have_many(:opinions) }
    it { should have_many(:comments) }
    it { should have_many(:follows) }
    it { should have_many(:followers) }
  end

  describe 'Validation' do
    it { should validate_length_of(:username).is_at_least(3) }
    it { should_not validate_length_of(:username).is_at_least(2) }
    it { should validate_length_of(:fullname).is_at_most(20) }
    it { should_not validate_length_of(:fullname).is_at_least(3) }
    it { should validate_uniqueness_of(:username) }
  end
end
