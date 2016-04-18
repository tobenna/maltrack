describe Diagnosis do
  let(:diagnosis) do
    params = {
      fever: 0,
      headache: 0,
      nausea: 0,
      vomiting: 0,
      jaundice: 0,
      enlarged_liver: 0,
      joint_pain: 0,
      body_weakness: 0,
      dizziness: 0,
      loss_of_apetite: 0,
      mp: 0
    }
    described_class.new(params)
  end
  describe '#summary' do
    it 'calculates the odds of a patient having malaria' do
      expect(diagnosis.summary).to eq (0.0)
    end


    it 'calculates the returns 56.73 for all moderate' do
      diagnosis.fever = 0.25
      diagnosis.headache = 0.25
      diagnosis.nausea = 0.25
      diagnosis.vomiting = 0.25
      diagnosis.jaundice = 0.25
      diagnosis.enlarged_liver = 0.25
      diagnosis.joint_pain = 0.25
      diagnosis.body_weakness = 0.25
      diagnosis.dizziness = 0.25
      diagnosis.loss_of_apetite = 0.25
      diagnosis.mp = 0.25
      expect(diagnosis.summary).to eq (56.73)
    end
  end
end
