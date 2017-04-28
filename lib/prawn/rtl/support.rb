# frozen_string_literal: true
require 'prawn'
require 'prawn/rtl/support/version'
require 'prawn/rtl/connector'

module PrawnPatch
  def array_from_tokens(tokens)
    super.map do |record|
      if record.include?(:text)
        record[:text] = Prawn::Rtl::Connector(record[:text])
      end
      record
    end
  end
end

module Prawn
  module Text
    module Formatted
      class Parser
        class << self
          prepend PrawnPatch
        end
      end
    end
  end
end

module Prawn
  module Text
    def text(string, options = {})
      return false if string.nil?
      # we modify the options. don't change the user's hash
      options = options.dup

      p = options[:inline_format]
      if p
        p = [] unless p.is_a?(Array)
        options.delete(:inline_format)
        array = text_formatter.format(string, *p)
      else
        array = [{ text: Prawn::Rtl::Connector(string) }]
      end

      formatted_text(array, options)
    end

    class Box
      def initialize(string, options = {})
        super([{ text: Prawn::Rtl::Connector(string) }], options)
      end
    end
  end
end
