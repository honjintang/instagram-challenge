require 'rails_helper'

feature 'liking turtlegrams' do

    before do
      vivien = User.create(email: 'viv@viv.com', password: '123456', id: 1)
      Turtlegram.create(caption: 'Shelly', image: File.new(File.join(Rails.root,"public/uploads/turtle.jpg")), user: vivien, id: 2)
    end

    scenario 'user can like a photo' do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'torty@gmail.com')
      fill_in('Password', with: '123456')
      fill_in('Password confirmation', with: '123456')
      click_button('Sign up')
      click_link 'Like Photo'
      expect(page).to have_content '1 like'
    end

end
