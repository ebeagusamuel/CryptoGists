require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:new_user) { user }
  let(:gist) { Gist.create(user_id: new_user.id, body: 'Test post') }
  subject { Comment.new(user_id: new_user.id, gist_id: gist.id, body: 'This is a comment') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid when body is blank' do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid when the body has content of more than 200 characters' do
    subject.body = 'a' * 201
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:gist) }
  end
end
