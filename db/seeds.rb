
#   Character.create(name: 'Luke', movie: movies.first)
if User.count == 0
  User.create(id:1, name: "Usuario 1", lastname: "Apellido", balance: 10000)
end

if Weather.count == 0
  Weather.create(date: "Fri, 11 Jun 2021", temperate: 19.1)
  Weather.create(date: "Sat, 12 Jun 2021", temperate: 20.1)
  Weather.create(date: "Sun, 13 Jun 2021", temperate: 16.0)
  Weather.create(date: "Mon, 14 Jun 2021", temperate: 18.8)
  Weather.create(date: "Tue, 15 Jun 2021", temperate: 16.6)
  Weather.create(date: "Wed, 16 Jun 2021", temperate: 14.1)
  Weather.create(date: "Thu, 17 Jun 2021", temperate: 12.9)
  Weather.create(date: "Fri, 18 Jun 2021", temperate: 12.8)
end
