# coding: utf-8

require "./be_unko.rb"

org ="これが元の文章です。これはサンプルです。（括弧などの記号は変換されません）"
puts org
puts BeUnko::string(org)

