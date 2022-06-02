require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:seller) { User.create(first_name: 'Ave', surname: 'Maria', email: 'maria@mail.com', password: 'password') }
  subject { described_class.new(name: 'Book', amount: 20, user_id: seller.id) }

  it 'Checks validity if all attributes are provided' do
    expect(subject).to be_valid
  end

  it 'Checks validity without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Checks validity without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
