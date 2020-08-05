require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'John', username: 'Doe') }
  
  it 'is valid with valid attributes' do
    user.profile_image.attach(io: File.open('/spec/support/test_images/img1'), filename: 'img1.jpg')
    user.cover_image.attach(io: File.open('/spec/support/test_images/img2'), filename: 'img2.jpg')
    user.save
    expect(user).to be_valid
  end

  # describe 'Associations' do
  #   it { should have_many(:gists) }
  #   it { should have_many(:comments) }
  #   it { should have_many(:followings) }
  #   it { should have_many(:followers).class_name('Following') }
  # end
end
