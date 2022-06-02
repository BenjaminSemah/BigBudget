require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  let(:seller) { User.create(first_name: 'Ave', surname: 'Maria', email: 'maria@mail.com', password: 'password') }
  let(:group) { Group.create(name: 'Travel', icon: 'C', user_id: seller.id) }
  let(:entity) { Entity.create(name: 'Bag', amount: 12, user_id: seller.id) }

  subject { described_class.new(group_id: group.id, entity_id: entity.id) }

  it 'Checks validity if all attributes are provided' do
    expect(subject).to be_valid
  end
end
