class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'
  has_many :sub_categories, :class_name => 'Category', :foreign_key => "parent_id", :dependent => :destroy
  scope :parent_categories, :conditions => 'parent_id is null'

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
