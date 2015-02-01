# coding: utf-8
require 'ostruct'

module BeUnko
  # clear continues
  def self.clear_continues(continues, except)
    continues.each_key{|key|
      if except != key.to_s then 
        continues[key] = 0
      end
    }
  end
  # increment continues (cyclic)
  def self.increment_continues(continues, target, max)
    continues.each{|key, value|
      if target == key.to_s then
        value = value < max ? value+1 : 0
        continues[key] = value
      end
    }
  end
  # Patterns

  #-------------------
  # module_function(s)
  #-------------------
  module_function
  #
  # convert string
  #
  def string(org)
    # continues counter
    continues = {hira:0, kata:0, alpha:0}
    # Convert
    result = ""
    org.split(//).each{|ch|
      # ひらがな
      if    /\p{Hiragana}/ =~ ch then
        replace = ['う','ん','こ']
        ch = replace[continues[:hira]]

        continues = increment_continues(continues, 'hira', 3)
        continues = clear_continues(continues, 'hira')
      # カタカナ
      elsif /\p{Katakana}/ =~ ch then
        replace = ['ウ','ン','コ']
        ch = replace[continues[:kata]]
        
        continues = increment_continues(continues, 'kata', 3)
        continues = clear_continues(continues, 'kata')
      # 漢字
      elsif /[一-龠々]/ =~ ch then
        ch = '糞'
        continues = clear_continues(continues, nil)
      else
        continues = clear_continues(continues, nil)
      end
      result = result + ch.to_s
    }
    
    return result
  end
end


