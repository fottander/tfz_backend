class News < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).news
  end

  has_attached_file :file,
                      storage: :s3,
                      s3_credentials: Proc.new{|a| a.instance.s3_credentials }

  validates_attachment :file,
                        content_type:
                          {content_type: %w(image/jpg image/jpeg image/png image/gif)}

  def s3_credentials
  {
    bucket: 'tfz',
    access_key_id: ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_KEY'],
    s3_region: ENV['AWS_REGION'],
    url: ':s3_domain_url',
    s3_host_name: 's3-eu-west-1.amazonaws.com'
  }
  end

  validates_presence_of :title, :content
end
