class Diagnosis
  include DataMapper::Resource

  property :id, Serial
  property :fever, Float
  property :headache, Float
  property :nausea, Float
  property :vomiting, Float
  property :jaundice, Float
  property :enlarged_liver, Float
  property :joint_pain, Float
  property :body_weakness, Float
  property :dizziness, Float
  property :loss_of_apetite, Float
  property :mp, Float
  property :time, DateTime, default: DateTime.now

  def summary
    @mild     = square_sum_root(get_judgement(Rule.all(type: 0)))
    @moderate = square_sum_root(get_judgement(Rule.all(type: 1)))
    @severe   = square_sum_root(get_judgement(Rule.all(type: 2)))
    @v_severe = square_sum_root(get_judgement(Rule.all(type: 3)))
    return 0 unless output > 0
    output.round(2)
  end

  def display
    severity = 'very severe' if summary >= 75
    severity = 'severe' if summary <= 74
    severity = 'moderate' if summary <= 50
    severity = 'mild' if summary <= 25
    "The patiant has #{summary}% chance of #{severity} malaria"
  end

  def time_ts
    time.strftime('%m %d, %Y, %H:%M')
  end

  private
  def square_sum_root(judgements)
    Math.sqrt(judgements.collect { |j| j**2 }.inject(:+))
  end

  def get_judgement(rules_array)
    rules_array.collect do |rule|
      rule.judge(self)
    end
  end

  def output
    top = (@mild * 0.2) + (@moderate * 0.4) + (@severe * 0.65) + (@v_severe * 0.9)
    bottom = @mild + @moderate + @severe + @v_severe
    (top/bottom) * 100
  end


end
