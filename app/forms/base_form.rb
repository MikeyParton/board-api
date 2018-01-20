class BaseForm
  include ActiveModel::Model

  def save
    if valid?
      ActiveRecord::Base.transaction do
        persist!
      end
      true
    else
      false
    end
  end
end
