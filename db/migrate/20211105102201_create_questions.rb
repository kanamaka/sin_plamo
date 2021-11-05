class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.datetime :question_time
      t.integer :content_image

      t.timestamps
    end
  end
end
