class CategoryListType < ActiveRecord::Type::Value
  def cast value
    if value.kind_of? Array
      super value & Contact.all_categories
    else
      super []
    end
  end
end
