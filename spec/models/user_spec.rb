require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'John Doe', username: 'JDoe') }

  it 'is invalid when any attrbute is absent' do
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    subject.profile_image.attach(io: File.open('spec/support/test_images' + '/img1.jpg'),
                                 filename: 'img1.jpg', content_type: 'image/jpg')
    subject.cover_image.attach(io: File.open('spec/support/test_images' + '/img2.jpg'),
                               filename: 'img2.jpg', content_type: 'image/jpg')
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:gists) }
    it { should have_many(:comments) }
    it { should have_many(:followings) }
    it { should have_many(:followers).class_name('Following') }
  end
end
