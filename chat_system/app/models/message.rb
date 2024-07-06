class Message < ApplicationRecord
  belongs_to :chat
  validates :number, uniqueness: { scope: :chat_id }

  before_create :assign_number

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  private

  def assign_number
    redis = Redis.new
    self.number = redis.incr("chat:#{chat_id}:message_number")
  end
end
