class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :content, :string
  attribute :birthday, :date
  attribute :accepted, :boolean, default: false

  validates :name, :email, :content, :birthday, :accepted, presence: true
  validates :birthday, birthday: true

  def save
    valid?
  end
end