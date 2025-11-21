class Document < ApplicationRecord
  has_one_attached :pdf_file

  validates :title, presence: true
  validates :pdf_file, presence: true
end
