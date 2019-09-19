
10.times do |blog|
  Blog.create!(
    title: "My day #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor laborum.",
  )
end