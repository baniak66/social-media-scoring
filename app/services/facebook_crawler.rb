require 'capybara/poltergeist'

class FacebookCrawler

  def self.search(login, pass, email)
    # Configure Poltergeist to not blow up on websites with js errors aka every website with js
    # See more options at https://github.com/teampoltergeist/poltergeist#customization
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end

    # Configure Capybara to use Poltergeist as the driver
    Capybara.default_driver = :poltergeist

    browser = Capybara.current_session
    browser.driver.headers = { "User-Agent" => "Chrome" }

    url = "https://facebook.com"
    browser.visit url

    # Fill login form
    browser.fill_in('email', :with => login)
    browser.fill_in('pass', :with => pass)
    browser.find('#loginbutton').click

    # Fill search bar with email
    browser.fill_in('q', :with => email)
    browser.find('._585_').click

    # Click on result person
    browser.find('._2yez').click

    # Move to likes url
    likes_url = browser.current_url + "/likes_all"
    browser.visit likes_url

    likes = browser.all '.fcb'

    # Scroll down until all likes are visible
    $start = (browser.all '.fcb').count
    $after = 0
    until $start == $after  do
      puts 'start loop'
      $start = (browser.all '.fcb').count
      browser.execute_script "window.scrollBy(0,1000)"
      sleep 2
      $after = (browser.all '.fcb').count
      puts "loaded #{$after} likes"
    end

    # Create client
    client = Client.create!(email: email)
    # Create clinets likes objects
    (browser.all '.fcb').each do |like|
      client.likes.create!(content: like.text)
    end

    Capybara.reset_sessions!
  end

end
