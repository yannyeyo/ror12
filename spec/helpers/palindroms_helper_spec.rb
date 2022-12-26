# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

# testing PalindromsHelper
RSpec.describe PalindromsHelper do
  context 'res_array function check' do
    it 'returns correct array' do
      expect(result_hash(11)).to eq({ 2 => 3, 3 => 7, 5 => 31, 7 => 127, 11 => 2047 })
      expect(result_hash(0)).to eq({ })
      expect(result_hash(-1)).to eq({})
    end
  end
end