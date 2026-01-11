class Rack::Attack
  # Throttle all requests by IP
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip
  end

  # Throttle login attempts
  throttle('logins/email', limit: 5, period: 20.minutes) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.params['user'] && req.params['user']['email'].to_s.downcase
    end
  end

  # Throttle signup attempts
  throttle('signups/ip', limit: 3, period: 1.hour) do |req|
    req.ip if req.path == '/users' && req.post?
  end

  # Throttle API requests
  throttle('api/ip', limit: 100, period: 1.minute) do |req|
    req.ip if req.path.start_with?('/api/')
  end
end
