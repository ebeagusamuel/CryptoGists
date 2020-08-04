require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'John Doe', username: 'Jdoe',
                        profile_image: image_url('img1.jpg'), cover_image: image_url('img2.jpg'))
  end

  # it 'is valid when all the attributes are present and valid' do
  #   expect(subject).to be_valid
  # end

  # it 'is invalid when name is absent' do
  #   subject.name = nil
  #   expect(subject).to_not be_valid
  # end

  # it 'is invalid when length of name is more than 20' do
  #   subject.name = 'Taofeek Olalere Teekaytech Laravel advocate'
  #   expect(subject).to_not be_valid
  # end

  describe 'Associations' do
    it { should have_many(:gists) }
    it { should have_many(:comments) }
    it { should have_many(:followings) }
    it { should have_many(:followers).class_name('Following') }
  end
end
