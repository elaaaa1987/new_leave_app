json.extract! leave_application, :id, :start_date, :end_date, :leave_type, :session_name, :status, :reason, :created_at, :updated_at
json.url leave_application_url(leave_application, format: :json)
