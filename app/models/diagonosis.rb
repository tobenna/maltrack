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
end
