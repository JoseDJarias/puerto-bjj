module Searchable
  extend ActiveSupport::Concern

  class_methods do
    def searchable_by(*columns, **options)
      options = {
        case_sensitive: false,
        exact_match: false,
        prefix: '%',
        suffix: '%'           
      }.merge(options)

      scope :search, ->(query) {
        return all unless query.present?

        conditions = columns.map do |column|
          if options[:exact_match]
            arel_table[column].eq(query)
          else
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

      scope :exact_search, ->(query) {
        return all unless query.present?
        
        conditions = columns.map do |column|
          arel_table[column].eq(query)
        end.reduce(:or)
        
        where(conditions)
      }

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