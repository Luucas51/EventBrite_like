class User < ApplicationRecord
    has_many :created_events, class_name: 'Event'
    has_many :attendances
    has_many :events, through: :attendances
end
