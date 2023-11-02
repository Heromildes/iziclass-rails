class Tasklist < ApplicationRecord
  belongs_to :user
  def done?
    done == true
  end
end
