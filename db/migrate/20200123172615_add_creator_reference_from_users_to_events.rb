# frozen_string_literal: true

class AddCreatorReferenceFromUsersToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creator_id, :integer
  end
end
