# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.search(search)
    if search
      search = search.strip.downcase
      where("lower(title) LIKE :search OR lower(body) LIKE :search", search: "%#{search}%")
    else
      all
    end
  end
end
