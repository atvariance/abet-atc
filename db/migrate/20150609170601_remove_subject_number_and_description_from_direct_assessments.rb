class RemoveSubjectNumberAndDescriptionFromDirectAssessments < ActiveRecord::Migration
  def change
    remove_column :direct_assessments, :subject_number, :string
    remove_column :direct_assessments, :subject_description, :string
  end
end
