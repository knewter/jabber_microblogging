class CreateMicroblogPosts < ActiveRecord::Migration
  def self.up
    create_table :microblog_posts do |t|
      t.text :content
      t.string :from
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :microblog_posts
  end
end
