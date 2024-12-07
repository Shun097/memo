require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
memo_type = gets.to_i 

if memo_type == 1
    puts "新規メモを作成 ファイル名を入力してください。"
 file_name = gets.chomp
 
 puts "メモ内容を記入してください Ctrl+Dで保存します。"
 input_memo = STDIN.read
 memo = input_memo.chomp

 CSV.open("#{file_name}.csv", "w") do |csv|
   csv.puts [memo]
 end

 puts "メモ保存しました。ファイル名 #{file_name}.csv"

elsif memo_type == 2
    puts "メモを編集します ファイル名を入力してください"
  file_name = gets.chomp


  if File.exist?("#{file_name}.csv")
    puts "現在のメモ内容は以下の通りです："
    CSV.foreach("#{file_name}.csv") do |row|
      puts row[0]
    end
 
    puts "追加内容を記入しください。 Ctrl+Dで保存します"
    input_memo = STDIN.read
    memo = input_memo.chomp

    CSV.open("#{file_name}.csv", "a") do |csv|
      csv.puts [memo]
    end

    puts "メモを追加しました。ファイル名: #{file_name}.csv"
  
else
    puts "選択したファイルがありません。ファイル名を確認してください"
end

else
    puts "1か2を入力してください。"
end
