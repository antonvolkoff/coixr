class Node
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,       type: String
  field :url,         type: String
  field :description, type: String

  validates :title, presence: true
  validates :url, presence: true
  validates :description, presence: true
end
