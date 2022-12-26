# frozen_string_literal: true

# palindtoms helper
module PalindromsHelper
    def result_hash(num)
        arr = (2..num).map do |elem|
          c = 0;
          (2..elem).each do |i|
            if (elem.to_i) % i == 0 then c+=1
            end
          end
          if c == 1 then elem.to_i
          end
        end.compact
        Hash[arr.zip arr.map { |el| 2**el -1}]
      end
  end