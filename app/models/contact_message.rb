class ContactMessage < ApplicationRecord
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :name, presence: true, length: { maximum: 50, message: "El nombre muy largo (máximo 20 caracteres)" }

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Debe ser un correo válido" }

  validates :message, presence: true, length: { maximum: 1000, message: "Mensaje muy largo (máximo 1000 caracteres)" }
end
