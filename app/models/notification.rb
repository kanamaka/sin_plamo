class Notification < ApplicationRecord
 default_scope->{order(created_at: :desc)}
  belongs_to :opus_params, optional: true
  belongs_to :comment, optional: true
  belongs_to :customer, class_name: 'User', foreign_key: 'visiter_id', optional: true
  belongs_to :customer, class_name: 'User', foreign_key: 'visited_id', optional: true
end
