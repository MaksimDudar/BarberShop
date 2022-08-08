require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/our baber shop' do
	erb :about
end

get '/register' do
	erb :visit
end
post '/register' do
@username = params[:username]
@phone     = params[:phone]
@datetime = params[:datetime]
@barber = params[:barber]
@color = params[:color]

hh = { :username => 'enter the  name',
	     :phone => 'enter the phone',
		   :datetime => 'enter the date' }

hh.each do |key, value|
	if params[key] == ''
		@error = hh[key]
		return erb :visit
  end
end

@title = 'Thank you!'
@message = "Dear #{@username}, we will waiting for you at #{@datetime}, your barber will #{@barber}, color will #{@color}"


@f = File.open 'users.txt', 'a'
@f.write "User: #{@username}, phone: #{@phone}, date and time: #{@datetime}, barber #{@barber},color #{@color}"
@f.close

erb :message

end


get '/feedback' do
	erb :feedback
end

get '/contacts' do
	erb :contacts
end

post '/feedback' do
        @mails = params[:mails]
				@message = params[:message]

				hh = { :mails => 'enter the  mail',
					     :message => 'enter the message', }

				hh.each do |key, value|
					if params[key] == ''
						@error = hh[key]
						return erb :feedback
				  end
				end
	@f = File.open 'mail.txt', 'a'
	@f.write " User: #{@mails} - #{@message} "
	@f.close

 	erb :public
end
