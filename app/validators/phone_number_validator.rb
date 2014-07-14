class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, phone_number)
		return true if phone_number.blank?

		phone_formats = [
			/^\(\d\d\d\) \d\d\d-\d\d\d\d/,
			/^\d\d\d\.\d\d\d\.\d\d\d\d/,
			/^\d\d\d\-\d\d\d\-\d\d\d\d/
		]

		phone_formats.each do |format|
			return true if phone_number.match( format )
		end

		record.errors[attribute] << (options[:message] || "Phone format isn't recognized")
	end
end
