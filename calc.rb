require_relative "./salary_calc"

puts "---出勤日数を入力---"
attendance_days = gets.to_i
puts "---有休日数を入力---"
absence = gets.to_i
puts "---普通残業時間を入力---"
over_time = gets.to_f
puts "---深夜時間を入力---"
midnight_time = gets.to_f
puts "---控除額合計を入力---"
deduction = gets.to_i
puts "----------------------"

obj = SalaryCalc.new(attendance_days,absence,over_time,midnight_time)

puts "基本給：#{obj.kihonkyu}円"
puts "交通費：#{obj.tukin}円"
puts "残業手当：#{obj.over_work_pay}円"
puts "総支給金額：#{obj.total_pay}円"
puts "差引支給額：#{obj.total_pay - deduction}円"

puts "----------------------"

File.open("salary.txt","w") do |f|
  f.puts(
    "基本給：#{obj.kihonkyu}円
    交通費：#{obj.tukin}円
    残業手当：#{obj.over_work_pay}円
    総支給金額：#{obj.total_pay}円
    差引支給額：#{obj.total_pay - deduction}円
    ".gsub("\s","")
    )
end

#以下、印刷しない場合はコメントアウト

# `lpr -P Canon_MG3500_series salary.txt`