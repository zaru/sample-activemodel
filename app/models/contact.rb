class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :content, :string

  validates :name, :email, :content, presence: true

  def save
    valid?
  end
end