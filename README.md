# Pickel
A class picking web app based on Bootstrap and Ruby on Rails.

## Prepare development environment
1. Make sure Ruby is installed on your machine
```
ruby -v
```
You should expect something like "ruby 2.0...".
2. Install Rails using gem
```
sudo gem install rails
```
On El Capital, Mac restricts users' permission to change /usr/bin. To workaround this, try:
```
sudo gem install -n /usr/local/bin/ rails
```
If gem complains it cannot compile native components of rails, chances are you have not installed XCode CLI tools. You can follow the super short instruction in [HomeBrew](http://brew.sh/) and install brew on your Mac. HomeBrew will automatically prompt you to install XCode CLI.

## Try it locally
Run the following command in a terminal:
```bash
git clone https://github.com/jollycopper/pickel.git
cd pickel
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed
rails server
```
