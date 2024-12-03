class AddReferenceToPortfolio < ActiveRecord::Migration[7.1]
  def change
    add_reference :educations, :portfolio
    add_reference :experiences, :portfolio
    add_reference :projects, :portfolio
  end
end
