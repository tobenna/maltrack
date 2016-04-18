describe Rule do
  let(:rule) {
    params = {
      fever: 0.25,
      headache: 0,
      nausea: 0,
      vomiting: 0,
      jaundice: 0,
      enlarged_liver: 0,
      joint_pain: 0.25,
      body_weakness: 0.25,
      dizziness: 0.5,
      loss_of_apetite: 0.25,
      mp: 0.25
    }
    described_class.new(params)
  }
  let(:visit) { double(:visit,
      fever: 0.5, headache: 0.25, nausea: 0.25,
      vomiting: 0.25, jaundice: 0, enlarged_liver: 0.25, joint_pain: 0,
      body_weakness: 0.25, dizziness: 0.25,  loss_of_apetite: 0.75, mp: 0.25) }


  describe '#judge' do
    it 'returns the smallest non zero value' do
      expect(rule.judge(visit)).to eq 0.25
    end
  end
end
