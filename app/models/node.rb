class Node
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title,       type: String
  field :url,         type: String
  field :description, type: String

  field :site_id,     type: String
  field :site_title,  type: String

  validates :title, presence: true
  validates :url,   presence: true
end
