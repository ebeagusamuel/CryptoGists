class ContentTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.attached? && value.content_type.in?(content_types)
      value = nil if record.new_record? 
      record.errors.add(attribute, 'must be either a .png, .jpg or .jpeg file')
    end
  end

  private

  def content_types
    options.fetch(:in)
  end
end