class Chat < ApplicationRecord
  before_create :assign_number
  has_many :messages, dependent: :destroy
  validates :number, uniqueness: { scope: :application_id }
  def assign_number
    redis = Redis.new
    self.number = redis.incr("application:#{application_id}:chat_number")
  end
end
