class Contact
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :no_use_ama_name, :no_use_ama_amount

  attribute :name, :string, default: 'no name'
  attribute :email, :string
  attribute :content, :string
  attribute :birthday, :date
  attribute :categories, :category_list
  attribute :accepted, :boolean, default: false

  validates :name, :email, :content, :birthday, :accepted, presence: true
  validates :birthday, birthday: true
  validates :accepted, acceptance: true
  validates :no_use_ama_amount,  numericality: { only_integer: true, greater_than: 0 }

  class << self
    # TODO: move to static data class
    def all_categories
      %w(foo bar baz)
    end
  end

  def no_use_ama_name
    # set default value
    @no_use_ama_name ||= 'no name'
  end

  def no_use_ama_amount= val
    @amount = val.tr('０-９', '0-9')
  end

  def save
    valid?
  end
end