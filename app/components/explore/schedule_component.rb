module Explore
  class ScheduleComponent < ViewComponent::Base
    def initialize(
      title: "Horarios de Clases",
      subtitle: "Encuentra el horario perfecto para tu entrenamiento",
      schedule_data: default_schedule_data,
      additional_info: default_additional_info
    )
      @title = title
      @subtitle = subtitle
      @schedule_data = schedule_data
      @additional_info = additional_info
    end

    private

    def default_schedule_data
      {
        kids_program: {
          name: "Programa Kids (5-13 años)",
          icon: "users",
          schedule: [
            { days: "Lunes", time: "5:00 PM" },
            { days: "Sábado", time: "9:30 AM" }
          ]
        },
        adults_program: {
          name: "Programa Adultos",
          icon: "dumbbell",
          disciplines: {
            no_gi: {
              name: "Jiu-Jitsu No Gi",
              schedule: [
                { days: "Lunes", time: "12:00 PM" },
                { days: "Martes", time: "12:00 PM y 6:00 PM" },
                { days: "Jueves", time: "6:30 PM" },
                { days: "Viernes", time: "12:00 PM" },
                { days: "Sábado", time: "12:00 PM (Open Mat)" }
              ]
            },
            gi: {
              name: "Jiu-Jitsu con Kimono",
              schedule: [
                { days: "Lunes y Viernes", time: "6:30 PM" },
                { days: "Miércoles", time: "12:00 PM y 6:30 PM" }
              ]
            },
            boxing: {
              name: "Boxeo",
              schedule: [
                { days: "Martes y Miércoles", time: "11:00 AM" },
                { days: "Miércoles y Viernes", time: "4:30 PM" },
                { days: "Sábado", time: "11:00 AM" }
              ]
            },
            mma: {
              name: "MMA",
              schedule: [
                { days: "Martes", time: "5:00 PM" }
              ]
            }
          }
        }
      }
    end

    def default_additional_info
      [
        "Las clases tienen una duración de 60-90 minutos. Llega 15 minutos antes para calentar.",
        "Consulta nuestro calendario para clases especiales y eventos."
      ]
    end

    def schedule_id
      @schedule_id ||= "schedule_#{SecureRandom.hex(4)}"
    end

    def kids_schedule_id
      "#{schedule_id}_kids"
    end

    def adults_schedule_id
      "#{schedule_id}_adults"
    end

    def discipline_schedule_id(discipline)
      "#{schedule_id}_#{discipline}"
    end
  end
end
