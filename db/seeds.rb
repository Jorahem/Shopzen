# Basic seeds to bootstrap the app
puts 'Seeding categories and products...'

Category.find_or_create_by!(name: 'Electronics', slug: 'electronics')
Category.find_or_create_by!(name: 'Fashion', slug: 'fashion')
Category.find_or_create_by!(name: 'Home & Living', slug: 'home-living')

if Product.count == 0
  cat = Category.find_by(slug: 'electronics')
  Product.create!(category: cat, name: 'Wireless Headphones', slug: 'wireless-headphones', price: 2499.00, stock_quantity: 100, description: 'High quality wireless headphones')
  Product.create!(category: cat, name: 'Smartphone XYZ', slug: 'smartphone-xyz', price: 49999.00, stock_quantity: 50, description: 'Flagship smartphone')
end

puts 'Seeding complete.'
