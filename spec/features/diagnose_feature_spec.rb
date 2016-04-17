feature 'Diagonosis' do
  scenario 'user can make a Diagonosis' do
    sign_in
    visit '/'
    click_link 'Diagnose'
    expect(page.status_code).to eq 200
    select 'None', from: 'Fever'
    select 'None', from: 'Headache'
    select 'None', from: 'Nausea'
    select 'None', from: 'Vomiting'
    select 'None', from: 'Jaundice'
    select 'None', from: 'Enlarged Liver'
    select 'None', from: 'Joint Pain'
    select 'None', from: 'Body Weakness'
    select 'None', from: 'Dizziness'
    select 'None', from: 'Loss of Apetite'
    select 'None', from: 'MP'

    click_button 'Diagnose'
    expect(page).to have_content 'The patiant has 0% chance of mild malaria'
  end
end
