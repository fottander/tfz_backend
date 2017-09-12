require 'rails_helper'

RSpec.describe Rider, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :ytlink}
    it {is_expected.to have_db_column :vimeolink}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of :name}
  end

  describe 'Factory' do
    it 'should have a valid Factory' do
      expect(create(:rider)).to be_valid
    end
  end
end
