require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: 'maria@mail.com', password: 'password', first_name: 'ave', surname: 'maria') }

  it 'Checks validity if all attributes are provided' do
    expect(subject).to be_valid
  end

  it 'Checks validity without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'Checks validity without an password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Checks validity without a first name' do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it 'Checks validity without a surname' do
    subject.surname = nil
    expect(subject).to_not be_valid
  end
end
