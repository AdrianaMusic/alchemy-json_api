# frozen_string_literal: true
require "rails_helper"
require "alchemy/test_support/factories"

RSpec.describe Alchemy::JsonApi::EssenceBooleanSerializer do
  let(:element) { FactoryBot.create(:alchemy_element) }
  let(:content) { FactoryBot.create(:alchemy_content, element: element) }
  let(:essence) { Alchemy::EssenceBoolean.create(value: true, content: content) }
  let(:options) { {} }

  subject(:serializer) { described_class.new(essence, options) }

  it_behaves_like "an essence"

  describe "attributes" do
    subject { serializer.serializable_hash[:data][:attributes] }

    it "has the right keys and values" do
      expect(subject[:ingredient]).to be true
    end
  end
end
