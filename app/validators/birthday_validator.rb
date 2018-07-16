class BirthdayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?
    unless value.between? Date.parse('2017-01-01'), Date.parse('2017-12-31')
      record.errors[attribute] << '2017年生まれしかのみ'
    end
  end
end