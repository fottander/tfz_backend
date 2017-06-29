class News < ApplicationRecord
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
