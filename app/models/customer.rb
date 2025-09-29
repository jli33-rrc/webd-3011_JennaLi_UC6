class Customer < ApplicationRecord
    has_one_attached :image

    # Validations
    validates :full_name, presence: true
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
    validates :phone_number, length: { minimum: 10 }, allow_blank: true

    def self.ransackable_attributes(auth_object = nil)
        ["id", "full_name", "email_address", "phone_number", "notes", "created_at", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
