class Rule
  include DataMapper::Resource

  property :id, Serial

  property :number, Integer
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
  property :type, Integer

  def judge submission
    nonzeromin = [
      (submission.fever == fever) && (!fever.zero?) ? fever : 900,
      (submission.headache == headache) && (!headache.zero?) ? headache : 900,
      (submission.nausea == nausea) && (!nausea.zero?) ? nausea : 900,
      (submission.vomiting == vomiting) && (!vomiting.zero?) ? vomiting : 900,
      (submission.jaundice == jaundice) && (!jaundice.zero?) ? jaundice : 900,
      (submission.enlarged_liver == enlarged_liver) && (!enlarged_liver.zero?) ? enlarged_liver : 900,
      (submission.joint_pain == joint_pain) && (!joint_pain.zero?) ? joint_pain : 900,
      (submission.body_weakness == body_weakness) && (!body_weakness.zero?) ? body_weakness : 900,
      (submission.dizziness == dizziness) && (!dizziness.zero?) ? dizziness : 900,
      (submission.loss_of_apetite == loss_of_apetite) && (!loss_of_apetite.zero?)? loss_of_apetite : 900,
      (submission.mp == mp) && (!mp.zero?) ? mp : 900
    ].min

    nonzeromin == 900 ? 0 : nonzeromin
  end
end
