require 'spec_helper'

describe 'qaform' do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
  end

  it 'First name input box should get filled' do
    @driver.get ('http://toolsqa.com/automation-practice-form/')
    @driver.find_element(:name, 'firstname').send_keys('Dom')
  end

  it 'Date input box should get filled' do
    @driver.find_element(:id, 'datepicker').send_keys('12/12/2012')
  end

  it 'should display and click on the link: Partial Link Test' do
    expect(@driver.find_element(:link, 'Partial Link Test').displayed?)
    expect(@driver.find_element(:link, 'Partial Link Test').click)
  end



  it 'The partial link can be clicked' do
    expect(@driver.current_url).to eq 'http://toolsqa.com/automation-practice-form/'
  end

  it 'link test link should take you to a new page' do
    @driver.find_element(:link, 'Link Test').click
    sleep 3
    expect(@driver.find_element(:class, 'tsc_table_s13').displayed?)
    @driver.navigate().back()
  end

  it 'should open the qaform page' do
    expect(@driver.current_url).to eq 'http://toolsqa.com/automation-practice-form/'
    @driver.find_element(:name, "firstname").displayed?
  end

  it 'The radio button with id submit should be clicked' do
    @driver.find_element(:id, 'submit').click
  end

  it 'The radio sex buttons should be clicked' do
    expect@driver.find_element(:id, 'sex-0').click
    expect(@driver.find_element(:id, 'sex-0').selected?).to eq true
    expect@driver.find_element(:id, 'sex-1').click
    expect(@driver.find_element(:id, 'sex-1').selected?).to eq true
  end

  it 'The exp radio button should be clicked' do
    @driver.find_element(:id, 'exp-0').click
    expect(@driver.find_element(:id, 'exp-0').selected?).to eq true
    @driver.find_element(:id, 'exp-1').click
    expect(@driver.find_element(:id, 'exp-1').selected?).to eq true
    @driver.find_element(:id, 'exp-2').click
    expect(@driver.find_element(:id, 'exp-2').selected?).to eq true
    @driver.find_element(:id, 'exp-3').click
    expect(@driver.find_element(:id, 'exp-3').selected?).to eq true
    @driver.find_element(:id, 'exp-4').click
    expect(@driver.find_element(:id, 'exp-4').selected?).to eq true
    @driver.find_element(:id, 'exp-5').click
    expect(@driver.find_element(:id, 'exp-5').selected?).to eq true
    @driver.find_element(:id, 'exp-6').click
    expect(@driver.find_element(:id, 'exp-6').selected?).to eq true
  end

  it 'Profession buttons should be clicked' do
    @driver.find_element(:id, 'profession-0').click
    expect(@driver.find_element(:id, 'profession-0').selected?).to eq true
    @driver.find_element(:id, 'profession-1').click
    expect(@driver.find_element(:id, 'profession-1').selected?).to eq true
  end

  it 'Tool buttons should be clicked' do
    @driver.find_element(:id, 'tool-0').click
    expect(@driver.find_element(:id, 'tool-0').selected?).to eq true
    @driver.find_element(:id, 'tool-1').click
    expect(@driver.find_element(:id, 'tool-1').selected?).to eq true
    @driver.find_element(:id, 'tool-2').click
    expect(@driver.find_element(:id, 'tool-2').selected?).to eq true
  end

  it 'should display and click on the Test File to Download download link' do
    expect(@driver.find_element(:link, 'Test File to Download').displayed?)
    expect(@driver.find_element(:link, 'Test File to Download').click)
    @driver.find_element(id: 'photo').send_keys("/Users/tech-a61/Downloads/Test-File-to-Download.xlsx")
  end

  it "should select continent from drop down list" do
    continent_list = @driver.find_element(:id, 'continents')
    sleep 3

    options = continent_list.find_elements(tag_name: 'option')

    selected_options = options.each { |option| option.click }
    expect(selected_options) == ('Asia' || 'North America' || 'South America' || 'Australia' || 'Africa' || 'Europe' || 'Antartica')
  end

  it 'Select all options from the selenium_commands list' do
    selenium_list = @driver.find_element(:id, 'selenium_commands')
    options = selenium_list.find_elements(tag_name: 'option')
    select_options = options.each do |option|
                      option.click
                      end
  end


end
