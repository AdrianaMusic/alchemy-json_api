# frozen_string_literal: true
require "alchemy/json_api/essence_serializer"
require "alchemy/json_api/link_helper"

module Alchemy::JsonApi
  class EssenceNodeSerializer
    include EssenceSerializer

    attribute :ingredient do |essence|
      essence&.node&.name
    end

    belongs_to :node

    with_options if: proc { |essence| essence.node.present? } do
      attribute :name do |essence|
        essence.node.name
      end

      attribute :link_url do |essence|
        essence.node.url
      end

      attribute :link_title do |essence|
        essence.node.title
      end

      attribute :link_nofollow do |essence|
        essence.node.nofollow
      end
    end
  end
end
