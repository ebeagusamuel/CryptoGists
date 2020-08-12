require 'rails_helper'

RSpec.describe Gist, type: :model do
  it 'is valid with valiid attributes' do
    sub = Gist.new(author_id: user.id, text: 'This is a test post')
    expect(sub).to be_valid
  end

  it 'is invalid when body is blank' do
    sub = Gist.new(author_id: user.id)
    expect(sub).to_not be_valid
  end

  it 'is invalid when body length is more than 500 characters' do
    sub = Gist.new(author_id: user.id)
    sub.text = 'a' * 510
    expect(sub).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
  end
end
