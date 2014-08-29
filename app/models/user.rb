class User < ActiveRecord::Base

  has_many :storeditems

  acts_as_tagger  #acts_as_taggable_on

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end
end
