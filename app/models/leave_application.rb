class LeaveApplication < ActiveRecord::Base
	belongs_to :user
	validates :start_date, :presence => true
	validates :end_date, :presence => true
	validates :leave_type, :presence => true
	validates :session_name, :presence => true, if: "leave_type == 2"
end
