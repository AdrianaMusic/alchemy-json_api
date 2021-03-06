# frozen_string_literal: true
module Alchemy::JsonApi
  class ElementSerializer
    include FastJsonapi::ObjectSerializer
    attributes(
      :position,
      :created_at,
      :updated_at,
    )
    attribute :element_type, &:name
    belongs_to :parent_element, record_type: :element, serializer: self

    belongs_to :page
    has_many :essences, polymorphic: true do |element|
      element.contents.map(&:essence)
    end

    has_many :nested_elements, record_type: :element, serializer: self

    with_options if: ->(_, params) { params[:admin] == true } do
      attribute :tag_list
      attribute :display_name, &:display_name_with_preview_text
    end
  end
end
