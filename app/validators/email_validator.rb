class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\A.+@.{2,}\..*\z/i

  def validate_each(record, attribute, value)
    unless value =~ EMAIL_REGEX
      record.errors.add(attribute, invalid_format_error)
    end
  end

  private

  def invalid_format_error
    options.fetch(:message, :invalid)
  end
end
