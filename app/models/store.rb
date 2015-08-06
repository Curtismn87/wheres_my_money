class Store < ActiveRecord::Base
  has_many :items, dependent: :destroy
  belongs_to :users
end
