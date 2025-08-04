require "test_helper"

class Explore::ScheduleComponentTest < ViewComponent::TestCase
  def test_renders_schedule_with_default_values
    render_inline(Explore::ScheduleComponent.new)

    assert_selector ".schedule-container"
    assert_selector ".schedule-header"
    assert_selector ".schedule-title", text: "Horarios de Clases"
    assert_selector ".schedule-subtitle", text: "Encuentra el horario perfecto para tu entrenamiento"
    assert_selector ".schedule-grid"
    assert_selector ".schedule-card"
  end

  def test_renders_custom_title_and_subtitle
    render_inline(Explore::ScheduleComponent.new(
      title: "Horarios Personalizados",
      subtitle: "Descripción personalizada"
    ))

    assert_selector ".schedule-title", text: "Horarios Personalizados"
    assert_selector ".schedule-subtitle", text: "Descripción personalizada"
  end

  def test_renders_kids_program_section
    render_inline(Explore::ScheduleComponent.new)

    assert_selector ".schedule-group"
    assert_selector ".schedule-group-title", text: /Programa Kids/
    assert_selector ".schedule-list"
    # Count only kids program schedule items (first schedule group)
    kids_schedule_items = page.all(".schedule-group:first-child .schedule-item")
    assert_equal 2, kids_schedule_items.length
    assert_selector ".schedule-days", text: "Lunes"
    assert_selector ".schedule-time", text: "5:00 PM"
  end

  def test_renders_adults_program_section
    render_inline(Explore::ScheduleComponent.new)

    assert_selector ".schedule-group-title", text: /Programa Adultos/
    assert_selector ".schedule-subgroup", count: 4
    assert_selector ".schedule-subgroup-title", text: "Jiu-Jitsu No Gi"
    assert_selector ".schedule-subgroup-title", text: "Jiu-Jitsu con Kimono"
    assert_selector ".schedule-subgroup-title", text: "Boxeo"
    assert_selector ".schedule-subgroup-title", text: "MMA"
  end

  def test_renders_all_disciplines_with_schedules
    render_inline(Explore::ScheduleComponent.new)

    # Jiu-Jitsu No Gi
    assert_selector ".schedule-subgroup-title", text: "Jiu-Jitsu No Gi"
    assert_selector ".schedule-days", text: "Martes"
    assert_selector ".schedule-time", text: "12:00 PM y 6:00 PM"

    # Jiu-Jitsu con Kimono
    assert_selector ".schedule-subgroup-title", text: "Jiu-Jitsu con Kimono"
    assert_selector ".schedule-days", text: "Lunes y Viernes"
    assert_selector ".schedule-time", text: "6:30 PM"

    # Boxeo
    assert_selector ".schedule-subgroup-title", text: "Boxeo"
    assert_selector ".schedule-days", text: "Martes y Miércoles"
    assert_selector ".schedule-time", text: "11:00 AM"

    # MMA
    assert_selector ".schedule-subgroup-title", text: "MMA"
    assert_selector ".schedule-days", text: "Martes"
    assert_selector ".schedule-time", text: "5:00 PM"
  end

  def test_renders_additional_info_section
    render_inline(Explore::ScheduleComponent.new)

    assert_selector ".schedule-info"
    assert_selector ".schedule-info-grid"
    assert_selector ".schedule-info-card", count: 2
    assert_selector ".schedule-info-card-text", text: /duración de 60-90 minutos/
    assert_selector ".schedule-info-card-text", text: /calendario para clases especiales/
  end

  def test_renders_custom_additional_info
    custom_info = [ "Información personalizada 1", "Información personalizada 2" ]

    render_inline(Explore::ScheduleComponent.new(additional_info: custom_info))

    assert_selector ".schedule-info-card", count: 2
    assert_selector ".schedule-info-card-text", text: "Información personalizada 1"
    assert_selector ".schedule-info-card-text", text: "Información personalizada 2"
  end

  def test_renders_with_semantic_html_structure
    render_inline(Explore::ScheduleComponent.new)

    # Main structure
    assert_selector "section[aria-labelledby='schedule-title']"
    assert_selector "header.schedule-header"
    assert_selector "h2[id='schedule-title']"

    # Card structure
    assert_selector "article[role='article']"
    assert_selector "header.schedule-card-header"
    assert_selector "h3[id='schedule-card-title']"

    # Program sections
    assert_selector "section.schedule-group"
    assert_selector "h4"
    assert_selector "article.schedule-subgroup"
    assert_selector "h5"

    # Definition lists for schedules
    assert_selector "dl[role='list']"
    assert_selector "div[role='listitem']"
    assert_selector "dt.schedule-days"
    assert_selector "dd.schedule-time"

    # Additional info
    assert_selector "aside[role='complementary']"
    assert_selector "div[role='note']"
  end

  def test_renders_with_proper_aria_labels
    render_inline(Explore::ScheduleComponent.new)

    # Check for proper ARIA relationships
    assert_selector "[aria-labelledby]"
    assert_selector "h3[id='schedule-card-title']"
    # Check that IDs exist and are properly formatted (without specific content)
    assert_selector "h4[id*='schedule']"
    assert_selector "h5[id*='schedule']"
  end

  def test_renders_with_icons
    render_inline(Explore::ScheduleComponent.new)

    # Calendar icon in header
    assert_selector ".schedule-card-title svg"

    # Program icons
    assert_selector ".schedule-group-title svg"
  end

  def test_renders_with_visually_hidden_elements
    render_inline(Explore::ScheduleComponent.new)

    # Check for visually hidden title in aside
    assert_selector ".visually-hidden", text: "Información adicional"
  end

  def test_renders_with_correct_css_classes
    render_inline(Explore::ScheduleComponent.new)

    assert_selector ".schedule-container"
    assert_selector ".schedule-header"
    assert_selector ".schedule-title"
    assert_selector ".schedule-subtitle"
    assert_selector ".schedule-grid"
    assert_selector ".schedule-card"
    assert_selector ".schedule-card-header"
    assert_selector ".schedule-card-title"
    assert_selector ".schedule-card-content"
    assert_selector ".schedule-group"
    assert_selector ".schedule-group-title"
    assert_selector ".schedule-subgroup"
    assert_selector ".schedule-subgroup-title"
    assert_selector ".schedule-list"
    assert_selector ".schedule-item"
    assert_selector ".schedule-days"
    assert_selector ".schedule-time"
    assert_selector ".schedule-info"
    assert_selector ".schedule-info-grid"
    assert_selector ".schedule-info-card"
    assert_selector ".schedule-info-card-text"
  end

  def test_renders_with_proper_structure
    render_inline(Explore::ScheduleComponent.new)

    # Check that the structure is correct
    assert_selector ".schedule-container .schedule-header"
    assert_selector ".schedule-container .schedule-grid"
    assert_selector ".schedule-container .schedule-info"
    assert_selector ".schedule-grid .schedule-card"
    assert_selector ".schedule-card .schedule-card-header"
    assert_selector ".schedule-card .schedule-card-content"
    assert_selector ".schedule-card-content .schedule-group"
    assert_selector ".schedule-group .schedule-list"
    assert_selector ".schedule-list .schedule-item"
    assert_selector ".schedule-item .schedule-days"
    assert_selector ".schedule-item .schedule-time"
  end

  def test_renders_with_unique_ids
    render_inline(Explore::ScheduleComponent.new)

    # Check that IDs are unique and properly formatted
    assert_selector "h4[id*='schedule']"
    assert_selector "h5[id*='schedule']"
  end

  def test_renders_with_accessibility_features
    render_inline(Explore::ScheduleComponent.new)

    # Check for proper heading structure
    assert_selector "h2"
    assert_selector "h3"
    assert_selector "h4", count: 2
    assert_selector "h5", count: 4

    # Check for semantic roles
    assert_selector "[role='article']"
    assert_selector "[role='list']"
    assert_selector "[role='listitem']"
    assert_selector "[role='complementary']"
    assert_selector "[role='note']"
  end

  def test_renders_with_custom_schedule_data
    custom_data = {
      kids_program: {
        name: "Programa Personalizado",
        icon: "star",
        schedule: [
          { days: "Viernes", time: "4:00 PM" }
        ]
      },
      adults_program: {
        name: "Programa Adultos Personalizado",
        icon: "heart",
        disciplines: {
          custom: {
            name: "Disciplina Personalizada",
            schedule: [
              { days: "Domingo", time: "10:00 AM" }
            ]
          }
        }
      }
    }

    render_inline(Explore::ScheduleComponent.new(schedule_data: custom_data))

    assert_selector ".schedule-group-title", text: "Programa Personalizado"
    assert_selector ".schedule-group-title", text: "Programa Adultos Personalizado"
    assert_selector ".schedule-subgroup-title", text: "Disciplina Personalizada"
    assert_selector ".schedule-days", text: "Viernes"
    assert_selector ".schedule-time", text: "4:00 PM"
    assert_selector ".schedule-days", text: "Domingo"
    assert_selector ".schedule-time", text: "10:00 AM"
  end
end
