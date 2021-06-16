class Comment < ApplicationRecord
  include Visible

  belongs_to :user
  belongs_to :article

  validates :body, presence: true

  after_initialize do
    if self.new_record?
      # values will be available for new record forms.
      self.status = 'public'
    end
  end
end
