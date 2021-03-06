# frozen_string_literal: true
require "alchemy/json_api/essence_serializer"

module Alchemy::JsonApi
  class EssenceRichtextSerializer
    include EssenceSerializer
    attributes(
      :body,
      :stripped_body,
    )
  end
end
