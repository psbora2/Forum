class Question < ActiveRecord::Base
  belongs_to :user

  validates :body ,presence: true
  validates :title, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history] 

  def should_generate_new_friendly_id?
    title_changed?
  end

  def author
  	self.user.name
  end
end
