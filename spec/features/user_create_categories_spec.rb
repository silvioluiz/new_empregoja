require 'rails_helper'

feature 'User create categories' do
  scenario 'successfully' do
    category = Category.new(name: 'Programador')
    
    visit new_category_path

    fill_in 'Nome', with: category.name

    click_on 'Cadastrar Categoria'

    expect(page).to have_content(category.name)
  end

  #Modificar pra incluir mensagens de validacao
  scenario 'with valid data' do
    visit new_category_path

    fill_in 'Nome', with: ''

    click_on 'Cadastrar Categoria'
    
    expect(page).to have_content('Não foi possível cadastrar a categoria')

  end
end