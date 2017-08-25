require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should validate_presence_of(:customer).with_message "can't be blank" }

  it 'has a valid factory' do
    expect(create(:customer)).to be_valid
  end

  describe 'versioning', versioning: true do
    it 'is versioned' do
      is_expected.to be_versioned
    end

    it 'versions name' do
      customer = create :customer

      expect {
        customer.update_attributes! customer: 'New name'
      }.to change { customer.versions.count }.by 1
    end
  end
end
