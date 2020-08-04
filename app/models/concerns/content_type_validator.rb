class ContentTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.attached?
    return if value.content_type.in?(content_types)

    value.purge
    record.errors.add(attribute, 'must be either a .png, .jpg or .jpeg file')
  end

  private

  def content_types
    options.fetch(:in)
  end
end
