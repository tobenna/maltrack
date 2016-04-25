class MalTrack < Sinatra::Base

  get '/diagnosis/new' do
    unless current_user
      flash.next[:notice] = ['Please sign in first']
      redirect '/sessions/new'
    end
    @symptoms = ['Fever','Headache', 'Nausea','Vomiting', 'Jaundice',
                  'Enlarged Liver', 'Joint Pain', 'Body Weakness', 'Dizziness',
                  'Loss of Apetite', 'MP']
    erb :'/diagnosis/new'
  end

  post '/diagnosis' do
    if current_user
      @diagnosis = Diagnosis.new
      @diagnosis.fever = params['Fever']
      @diagnosis.headache = params['Headache']
      @diagnosis.nausea = params['Nausea']
      @diagnosis.vomiting = params['Vomiting']
      @diagnosis.jaundice = params['Jaundice']
      @diagnosis.enlarged_liver = params['Enlarged Liver']
      @diagnosis.joint_pain = params['Joint Pain']
      @diagnosis.body_weakness = params['Body Weakness']
      @diagnosis.dizziness = params['Dizziness']
      @diagnosis.loss_of_apetite = params['Loss of Apetite']
      @diagnosis.mp = params['MP']
      @diagnosis.save
      redirect '/diagnosis'
    else
      flash.next[:notice] = ['Please sign in first']
      redirect '/sessions/new'
    end
  end

  get '/diagnosis' do
    if current_user
      flash.now[:notice] = [Diagnosis.last.display]
      @diagnoses = Diagnosis.all.reverse
      erb :'/diagnosis/all'
    else
      flash.next[:notice] = ['Please sign in first']
      redirect '/sessions/new'
    end
  end
end
