# frozen_string_literal: true

require 'pdf/core/text'
require 'prawn/rtl/support/version'
require 'prawn/rtl/connector'

module Prawn
  module Rtl
    module Support
      module PrawnTextPatch
        def original_text
          super.map do |h|
            if h.key?(:text)
              h[:text] = Prawn::Rtl::Connector.fix_rtl(h[:text])
            end
            h
          end
        end
      end
    end
  end
end

module Prawn
  module Text
    module Formatted
      class Box
        prepend Prawn::Rtl::Support::PrawnTextPatch
      end
    end
  end
end
