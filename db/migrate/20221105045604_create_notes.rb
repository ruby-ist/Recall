class CreateNotes < ActiveRecord::Migration[7.0]
    def up
        unless table_exists? :notes
            create_table :notes do
                t.text :content
                t.boolean :complete

                t.timestamps
            end
        end
    end

    def down
        drop_table :notes if table_exists? :notes
    end
end
