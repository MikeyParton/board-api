class TimerSerializer < ActiveModel::Serializer
  attributes  :id,
              :user_id,
              :card_id,
              :status,
              :started_at,
              :stopped_at,
              :seconds

  def started_at
    object.started_at.try(:iso8601)
  end

  def stopped_at
    object.stopped_at.try(:iso8601)
  end
end
