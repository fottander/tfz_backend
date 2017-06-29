require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :title}
    it {is_expected.to have_db_column :content}
  end

  describe 'Validations' do
    it {is_expected.to validate_presence_of :title}
    it {is_expected.to validate_presence_of :content}
  end

  describe 'File attachment' do
    it { is_expected.to have_attached_file(:file)}
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:news)).to be_valid
    end

    it 'has a file url by default' do
      news = create(:news)
      expect(news.file.url).to include 'Agile_workflow.png'
    end
  end
end
