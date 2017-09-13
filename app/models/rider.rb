class Rider < ApplicationRecord
  validates_presence_of :name

  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%").order(name: :asc)
    else
      all.order(name: :asc)
    end
  end
end
