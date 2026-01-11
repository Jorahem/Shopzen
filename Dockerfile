FROM ruby:3.2-alpine

RUN apk add --update --no-cache \
  build-base \
  postgresql-dev \
  nodejs \
  yarn \
  tzdata \
  imagemagick \
  vips-tools && \
  rm -rf /var/cache/apk/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile || true

COPY . .

RUN bundle exec rails assets:precompile || true

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
