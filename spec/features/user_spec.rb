require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @usr1 = User.create(username: 'deep', fullname: 'Deepesh Kumar')
    @usr2 = User.create(username: 'twister', fullname: 'Wingsform')
    visit '/sign_in'
    fill_in 'session_username', with: 'deep'
    click_button 'Login'
  end

  it 'visit own profile page' do
    visit profile_path(@usr1.username)
    expect(page).to have_text('ALL BOOKS SUGGESTED BY DEEPESH KUMAR')
  end

  it 'visit other profile page' do
    visit 'users/twister'
    expect(page).to have_text('ALL BOOKS SUGGESTED BY WINGSFORM')
  end

  it 'follow a user which has profile page open' do
    visit 'users/twister'
    expect(page).to have_text('0 Following')
    find('a.follow_me').click
    expect(page).to have_text('1 Following')
  end

  it 'should logout' do
    click_link 'Sign out'
    expect(current_path).to eql(sign_in_path)
  end
end
