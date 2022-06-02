require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:seller) { User.create(first_name: 'Maria', surname: 'Ave', email: 'maria@mail.com', password: 'password') }
  subject { described_class.new(name: 'Clothes', icon: 'string.png', user_id: seller.id) }

  it 'Checks validity if all attributes are provided' do
    expect(subject).to be_valid
  end

  it 'Checks validity without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Checks validity without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
