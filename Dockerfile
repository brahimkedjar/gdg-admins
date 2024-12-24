# Use the official Ruby image
FROM ruby:3.2.0

# Set environment variables to avoid warnings
ENV LANG C.UTF-8
ENV RAILS_ENV=production

# Install system dependencies
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install bundler
RUN gem install bundler

# Copy the Gemfile and install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Precompile assets
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
