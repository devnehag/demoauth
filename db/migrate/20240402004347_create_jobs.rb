class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.string :job_title
      t.string :company
      t.string :job_description
      t.string :company_url
      t.date :date
      t.string :point_of_contact
      t.string :job_reference
      t.string :tech_stack

      t.timestamps
    end
  end
end
