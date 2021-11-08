class Attendance < ApplicationRecord
    after_create :attendace_send

    def attendace_send
      AttendanceMailer.attendance_email(self).deliver_now
    end

    belongs_to :user
    belongs_to :event
end
