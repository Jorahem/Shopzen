# Shopzen

Production-grade Rails e-commerce platform scaffold inspired by Daraz + Amazon.

This repository contains an initial full-MVP scaffold (Rails 7.1) with core models, schema, Docker config, Tailwind + Hotwire placeholders, security initializers, and seeds. It is intended as a starting point to continue development and iteratively implement features.

Quick start (development):

1. Install dependencies: Ruby 3.2, PostgreSQL, Redis, Node.js/Yarn
2. Copy environment variables from `.env.example` and set values (DATABASE_URL, REDIS_URL, SECRET_KEY_BASE, etc.)
3. Build and run with Docker Compose:

   docker compose build
   docker compose up

4. Create and load database:

   docker compose run web rails db:create db:schema:load db:seed

5. Visit http://localhost:3000

Files included in this initial commit:
- Gemfile (Rails 7.1 + recommended gems)
- Dockerfile + docker-compose.yml
- Core models and db/schema.rb from the spec
- Initializers: rack_attack, content_security_policy
- Seeds with sample data
- Basic controllers and views placeholders

What's next:
- Run `bundle install` and `yarn install` in the container
- Implement Devise user registration and authentication (placeholders included)
- Implement admin panel, Stripe & other payment integrations (placeholders added)
- Build out controllers, views, and JS (Hotwire/Stimulus) for full storefront

License: MIT
