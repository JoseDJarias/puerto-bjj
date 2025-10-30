module Programs
  class ProgramComponent < ViewComponent::Base
    def initialize(key:, overrides: {}, css_ns: nil)
      @key = key.to_s.parameterize.underscore.to_sym
      data = defaults_for(@key).deep_merge(overrides || {})

      @css_ns = (css_ns || @key).to_s.dasherize

      @title = data[:title]
      @subtitle = data[:subtitle]

      @cta = data[:cta] # { href:, text:, icon: }
      @hero_image = data[:hero_image] # { src:, alt: }

      @schedule = data[:schedule] # [{ day:, time: }]
      @benefits = data[:benefits] # [{ icon:, title:, text: }]
      @instructors = data[:instructors] # [{ image:, alt:, title:, name:, bio: }]
    end

    private

    def css(suffix)
      "#{@css_ns}-#{suffix}"
    end

    def section_id(suffix)
      "#{@css_ns}-#{suffix}"
    end

    def defaults_for(key)
      all = {
        kids: kids_defaults,
        boxing: boxing_defaults,
        jiu_jitsu: jiu_jitsu_defaults,
        jiujitsu: jiu_jitsu_defaults, # alias
        mma: mma_defaults,
        no_gi: no_gi_defaults,
        gi: gi_defaults
      }
      all[key] || kids_defaults
    end

    def kids_defaults
      {
        title: "Programa de Jiu-Jitsu para Niños",
        subtitle: "Formando campeones(as) dentro y fuera del tatami. Confianza, disciplina y respeto para toda una vida.",
        cta: {
          href: "https://wa.me/50672026863",
          text: "¡Inscríbete Ahora!",
          icon: "message-circle"
        },
        hero_image: {
          src: 'home/kids-home-photo.jpeg',
          alt: 'Niños entrenando Jiu-Jitsu en Puerto BJJ'
        },
        schedule: [
          { day: "Lunes", time: "5:00 PM - 6:00 PM" },
          { day: "Sábado", time: "9:30 AM - 10:30 AM" }
        ],
        benefits: [
          { icon: "shield", title: "Confianza y Autoestima", text: "Aprenderán a superar retos, y por tanto a mejorar su confianza en sí mismo." },
          { icon: "heart", title: "Disciplina y Respeto", text: "Incentivamos valores fundamentales que les servirán en la escuela y en la vida." },
          { icon: "dumbbell", title: "Condición Física", text: "Mejorarán su coordinación, fuerza y agilidad en un ambiente divertido y seguro." },
          { icon: "brain-circuit", title: "Salud Mental", text: "El Jiu-Jitsu reduce el estrés y la ansiedad, mejorando el enfoque y la claridad mental." },
          { icon: "users", title: "Habilidades Sociales", text: "Harán nuevos amigos y aprenderán a trabajar en equipo y a apoyarse mutuamente." }
        ],
        instructors: [
          {
            image: 'programs/kids-instructor-1.jpg',
            alt: 'Kevin Matarrita Lara - Instructor Principal del Programa Kids',
            title: 'Conoce a Nuestro Instructor Principal',
            name: 'Kevin Matarrita Lara',
            bio: "Con más de 10 años de experiencia en Jiu-Jitsu y una gran pasión por la enseñanza, nuestro instructor principal del programa Kids está certificado y dedicado a crear un ambiente de aprendizaje positivo y seguro. Su objetivo es que cada niño alcance su potencial."
          },
          {
            image: 'programs/kids-instructor-2.jpg',
            alt: 'Jose Daniel Arias - Instructor Asistente del Programa Kids',
            title: 'Conoce a Nuestro Instructor-Asistente',
            name: 'Jose Daniel Arias',
            bio: "Con más de 4 años de experiencia en Jiu-Jitsu, un gran entusiasmo y mucha capacidad de complementar el trabajo en equipo, su rol es fundamental para el desarrollo individual de los alumnos, ofreciendo apoyo constante y asegurando que nadie se quede atrás."
          }
        ]
      }
    end

    # Sensible placeholders for other disciplines so the component is reusable immediately.
    def boxing_defaults
      {
        title: "Programa de Boxeo",
        subtitle: "Potencia, técnica y condición física en cada golpe.",
        cta: { href: "https://wa.me/50672026863", text: "¡Quiero probar!", icon: "message-circle" },
        hero_image: { src: 'programs/boxeo1.jpg', alt: 'Clase de Boxeo en Puerto BJJ' },
        schedule: [
          { day: "Martes y Miércoles", time: "11:00 AM" },
          { day: "Miércoles y Viernes", time: "4:30 PM" },
          { day: "Sábado", time: "11:00 AM" }
        ],
        benefits: [
          { icon: "zap", title: "Velocidad y Potencia", text: "Mejora reflejos, coordinación y explosividad." },
          { icon: "heart-pulse", title: "Cardio y Resistencia", text: "Incrementa tu capacidad aeróbica y anaeróbica." },
          { icon: "shield", title: "Autodefensa", text: "Técnicas efectivas de defensa personal y control de distancia." }
        ],
        instructors: []
      }
    end

    def jiu_jitsu_defaults
      {
        title: "Programa de Jiu-Jitsu (Gi)",
        subtitle: "El arte suave: técnica, estrategia y control.",
        cta: { href: "https://wa.me/50672026863", text: "¡Quiero entrenar!", icon: "message-circle" },
        hero_image: { src: 'home/jiujitsu-gi.jpeg', alt: 'Jiu-Jitsu con Gi' },
        schedule: [
          { day: "Lunes y Viernes", time: "6:30 PM" },
          { day: "Miércoles", time: "12:00 PM y 6:30 PM" }
        ],
        benefits: [
          { icon: "brain", title: "Estrategia", text: "Aprende a solucionar problemas bajo presión." },
          { icon: "users", title: "Comunidad", text: "Entrena en un ambiente de respeto y camaradería." }
        ],
        instructors: []
      }
    end

    def no_gi_defaults
      {
        title: "Programa de Jiu-Jitsu (No-Gi)",
        subtitle: "Dinámico, rápido y muy funcional.",
        cta: { href: "https://wa.me/50672026863", text: "¡Quiero entrenar!", icon: "message-circle" },
        hero_image: { src: 'home/jiujitsu-nogi.jpeg', alt: 'Jiu-Jitsu No-Gi' },
        schedule: [
          { day: "Lunes", time: "12:00 PM" },
          { day: "Martes", time: "12:00 PM y 6:00 PM" },
          { day: "Jueves", time: "6:30 PM" },
          { day: "Viernes", time: "12:00 PM" },
          { day: "Sábado", time: "12:00 PM (Open Mat)" }
        ],
        benefits: [
          { icon: "activity", title: "Movimiento y Control", text: "Desarrolla control corporal y timing sin agarres del kimono." }
        ],
        instructors: []
      }
    end

    def gi_defaults
      jiu_jitsu_defaults
    end

    def mma_defaults
      {
        title: "Programa de MMA",
        subtitle: "Combina grappling y striking en un sistema integral.",
        cta: { href: "https://wa.me/50672026863", text: "¡Quiero entrenar!", icon: "message-circle" },
        hero_image: { src: 'programs/mma1.jpg', alt: 'Entrenamiento de MMA' },
        schedule: [
          { day: "Martes", time: "5:00 PM" }
        ],
        benefits: [
          { icon: "target", title: "Versatilidad", text: "Domina transiciones entre golpeo y grappling." }
        ],
        instructors: []
      }
    end
  end
end
