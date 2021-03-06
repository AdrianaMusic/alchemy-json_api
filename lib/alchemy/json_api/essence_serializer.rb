# frozen_string_literal: true
module Alchemy
  module JsonApi
    module EssenceSerializer
      def self.included(klass)
        klass.include FastJsonapi::ObjectSerializer
        klass.has_one :element, record_type: :element, serializer: ElementSerializer do |essence|
          essence.content.element
        end
        klass.attributes :ingredient
        klass.attribute :role do |essence|
          essence.content.name
        end
      end
    end
  end
end
