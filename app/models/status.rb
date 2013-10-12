class Status < ActiveRecord::Base
  attr_accessible :content, :user_id, :title, :document_attributes
  belongs_to :user
  belongs_to :document
  belongs_to :title

  accepts_nested_attributes_for :document

  validates :content, presence: true,
                      length: { minimum: 2 }

  validates :user_id, presence: true
end
