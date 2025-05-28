module Searchable
  extend ActiveSupport::Concern

  class_methods do
    def searchable_by(*columns, **options)
      # Opciones por defecto
      options = {
        case_sensitive: false,  # búsqueda case-insensitive por defecto
        exact_match: false,     # búsqueda parcial por defecto
        prefix: '%',            # prefijo para LIKE
        suffix: '%'             # sufijo para LIKE
      }.merge(options)

      scope :search, ->(query) {
        return all unless query.present?

        # Construir la condición de búsqueda
        conditions = columns.map do |column|
          if options[:exact_match]
            # Búsqueda exacta
            arel_table[column].eq(query)
          else
            # Búsqueda parcial
            pattern = "#{options[:prefix]}#{query}#{options[:suffix]}"
            if options[:case_sensitive]
              arel_table[column].matches(pattern)
            else
              arel_table[column].matches(pattern)
            end
          end
        end.reduce(:or)

        where(conditions)
      }

      # Scope para búsqueda exacta
      scope :exact_search, ->(query) {
        return all unless query.present?
        
        conditions = columns.map do |column|
          arel_table[column].eq(query)
        end.reduce(:or)
        
        where(conditions)
      }

      # Scope para búsqueda que comienza con
      scope :starts_with, ->(query) {
        return all unless query.present?
        
        conditions = columns.map do |column|
          arel_table[column].matches("#{query}%")
        end.reduce(:or)
        
        where(conditions)
      }
    end
  end
end 