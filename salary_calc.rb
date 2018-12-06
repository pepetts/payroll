class SalaryCalc

  # attr_accessor :attendance_days, :absence, :over_time, :midnight_time

  #時給
  @@hourly_wage = 1130  #@@はクラス変数
  @@hourly_wage2 = 1413
   
  #深夜手当て
  @@midnight_allowance = 283
 
  #交通費
  @@koutuhi = 121
 
  def initialize(attendance_days,absence,over_time,midnight_time)
    @attendance_days = attendance_days
    @absence = absence
    @over_time = over_time
    @midnight_time = midnight_time
    
    @kihonkyu = 0
    @tukin = 0
    @over_work_pay = 0
  end

  def kihonkyu
    return @kihonkyu = (@attendance_days * 8) * @@hourly_wage
  end

  def tukin
    return @tukin = (@attendance_days - @absence) * @@koutuhi
  end

  def over_work_pay
    normal_pay = @over_time * @@hourly_wage2
    midnight_pay = @midnight_time * @@midnight_allowance
    return @over_work_pay = normal_pay + midnight_pay
  end

  def total_pay
    return @kihonkyu + @tukin + @over_work_pay
  end

end