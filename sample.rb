# coding: utf-8

require "./be_unko.rb"

org  = "この文章は、サンプル(Sample)です。"
unko = BeUnko::string(org)
puts org
puts unko
puts ""

org  = "この文章は、ｻﾝﾌﾟﾙ(Ｓａｍｐｌｅ)です。"
unko = BeUnko::string(org)
puts org
puts unko
puts ""

org  = "コーギー犬 vs ｳﾞｧｲｵﾘﾝ"
unko = BeUnko::string(org)
puts org
puts unko
puts ""
