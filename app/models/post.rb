class Post < ActiveRecord::Base

  class EitherPresenceValidator < ActiveModel::Validator
    def validate record
      if options[:fields].blank? || !options[:fields].is_a?(Array) || options[:fields].length != 2
        raise "#{self.class.to_s} must accept an array of two field symbols"
      elsif options[:fields].all? { |field| record.send(field).blank? }
        record.errors[:base] << "Either #{options[:fields].first} or #{options[:fields].last} must be present"
      end
    end
  end

  validates :title, presence: true
  validates_with EitherPresenceValidator, fields: [:link, :text]
end
