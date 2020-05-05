module Alchemy
  module JsonApi
    class NodeSerializer
      include FastJsonapi::ObjectSerializer

      attributes :name
      attribute :link_url, &:url
      attribute :link_title, &:title
      attribute :link_nofollow, &:nofollow

      belongs_to :parent, record_type: :node

      has_many :children, record_type: :node, serializer: self
    end
  end
end
