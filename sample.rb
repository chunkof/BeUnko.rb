# coding: utf-8

require "./be_unko.rb"

org ="これが元の文章です。これはサンプルです。（記号や数値は変換されません）"
puts org
puts "↓"
puts BeUnko::string(org)
puts ""

org ="ﾊﾝｶｸｶﾅ、Alphabetにも対応しています。"
puts org
puts "↓"
puts BeUnko::string(org)
puts ""

org ="スーパーマケーットに行きましょう。"
puts org
puts "↓"
puts BeUnko::string(org)
puts ""

org ="コーギー犬"
puts org
puts "↓"
puts BeUnko::string(org)
puts ""
