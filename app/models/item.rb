class Item < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :price, presence: true
  belongs_to :user
  has_attached_file :image
  has_attached_file :resource

  validates_attachment_content_type :image,
  content_type:  /^image\/(png|gif|jpeg)/,
  message: "Only images allowed"

  validates_attachment_content_type :resource,
  content_type: ['application/pdf'],
  message: "Only pdfs allowed"

  validates :image, attachment_presence: true
  acts_as_votable
end
