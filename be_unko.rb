# coding: utf-8
require 'ostruct'

module BeUnko
  #-------------------
  # Utility
  #-------------------
  def self.max_cyclic(org, max)
    if org <= max then
      return org
    else
      return 0
    end
  end
  def self.max_stop(org, max)
    if org <= max then
      return org
    else
      return max
    end
  end
  #-------------------
  # module_function(s)
  #-------------------
  module_function
  #
  # convert string
  #
  def string(org)
    serial = 0;
    last_type = '-';
    result = ""
    # convert
    org.split(//).each{|ch|
      # ひらがな
      if    /\p{Hiragana}/ =~ ch then
        # 小書き文字
        if /[ぁぃぅぇぉっゃゅょゎ]/ =~ ch then
          replace = ['ぅ','っ','ぉ']
          serial = ('hira'==last_type) ? serial : 0;
        # ナミ字
        else
          replace = ['う','ん','こ']
          serial = ('hira'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'hira'
      # カタカナ
      elsif /\p{Katakana}/ =~ ch then
        # 小書き文字
        if /[ァィゥェォヵヶッャュョヮ]/ =~ ch then
          replace = ['ゥ','ッ','ォ']
          serial = ('kata'==last_type) ? serial : 0;
        # 小書き文字(半角)
        elsif /[ｧｨｩｪｫヵヶｯｬｭｮヮ]/ =~ ch then
          replace = ['ｩ','ｯ','ｫ']
          serial = ('kata'==last_type) ? serial : 0;
        # ナミ字(半角)
        elsif /[ｱ-ﾝ]/ =~ ch then
          replace = ['ｳ','ﾝ','ｺ']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        # ナミ字
        else
          replace = ['ウ','ン','コ']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'kata'
      # 漢字
      elsif /[一-龠々]/ =~ ch then
        ch = '糞'
        last_type = 'kanji'
      # アルファベット
      elsif /[a-zA-Z]/ =~ ch then
        # 小文字
        if /[a-z]/ =~ ch then
          replace = ['u','n','k','o']
        # 大文字
        else
          replace = ['U','N','K','O']
        end
        serial = ('alpha'==last_type) ? max_stop(serial+1,replace.length-1) : 0;
        ch = replace[serial]
        last_type = 'alpha'
      # 継続
      elsif /[ー―～・]/ =~ ch then
        # last_type更新しない
      # その他
      else
        last_type = '-'
      end
      
      result = result + ch.to_s
    }
    
    return result
  end
end


