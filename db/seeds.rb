company = Company.create!(
  name: "Apple",
  phone: "08000",
  address: "Brasil",
  email: "apple@email.com",
  industry: "Cell Phones",
  website: "apple.com",
)

5.times do |i|
  Contact.create!(
    first_name: "Guilherme #{i}",
    last_name: "Moraes",
    birthday: Date.new(2025, 9, 21),
    email: "gui@email.com",
    phone: "929999999999",
    company_id: company.id
  )
end
