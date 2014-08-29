class Storeditem < ActiveRecord::Base

  belongs_to :user
  mount_uploader :document, DocumentUploader

  acts_as_taggable_on :tags

end
