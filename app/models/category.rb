class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'
  has_many :sub_categories, :class_name => 'Category', :foreign_key => "parent_id", :dependent => :destroy
  scope :parent_categories, :conditions => 'parent_id is null'
  has_many :products

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def categories
    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      categories = Category.where("name like ?", like)
    else
      categories = Category.all
    end
    list = categories.map { |c| Hash[id: c.id, label: c.name, name: c.name] }
    render json: list
  end

  def category_name=(name)
    category = Category.find_by_name(name)
    if category
      self.category_id = category.id
    else
      errors[:category_name] << "Invalid name entered"
    end
  end

  def category_name
    Category.find(category_id).name if user_id
  end

end
