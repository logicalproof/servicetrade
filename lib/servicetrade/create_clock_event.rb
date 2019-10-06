
class CreateClockEvent
  def self.clock_in(job_id, authenticator)
    action = Servicetrade::Action::ClockIn.new(job_id)
    api = Servicetrade::ApiInterface.new(action, authenticator)
    api.post

    # TODO - Currently if an appointment for today already exists the technician will be added with 'no appointment', the only other option is to check for an appointment with todays date and assign them to that appointment. This could get funky if any company starts getting picky with services attached to appointments
  end

  def self.clock_out(job_id, authenticator)
    resource = Servicetrade::ClockEventInterface.new
    api = Servicetrade::ApiInterface.new(resource, authenticator)
    appointment_id = api.get(userId: authenticator.user['id'], openClockEvents: true).first['appointment']['id']
    action = Servicetrade::Action::ClockOut.new(job_id)
    api = Servicetrade::ApiInterface.new(action, authenticator)
    api.post(appointmentId: appointment_id)
  end
end