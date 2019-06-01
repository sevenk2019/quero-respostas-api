class CreateJoinTableCourseTag < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :tags do |t|
      t.index [:course_id, :tag_id]
    end
  end
end
