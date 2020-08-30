class Doctor

    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select { |appointment|
            appointment.doctor == self
        }
    end

    def patients
        appointments.map { |appointment|
            appointment.patient
        }
    end
end