# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tag.create([
    { name: '上に成長する品種' },
    { name: '下に垂れ下がる品種' },
    { name: '全体に大きくなる品種'},
    { name: '横に増えていく品種'},
    { name: '育てやすい品種'},
    { name: '増やしやすい品種'},
    { name: '夏場の暑さ・蒸れに強い品種'},
    { name: '寒さに強い品種'}
    ])
    
users = User.create!(
  [
    {email: 'tanaka@example.com', name: '田中', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")},
    {email: 'suzuki@example.com', name: '鈴木', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")},
    {email: 'sato@example.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")},
    {email: 'takahashi@example.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/no_image.jpg"), filename:"no_image.jpg")}
  ]
)

PostPlant.create!(
  [
    {title: 'きれいに咲きました', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), caption: '大人気のカフェです。', user_id: users[0].id },
    {name: '和食屋せん', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), caption: '日本料理は美しい！', user_id: users[1].id },
    {name: 'ShoreditchBar', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), caption: 'メキシコ料理好きな方にオススメ！', user_id: users[2].id }
  ]
)

Plant.create!(

)

    
Admin.create!(
  email: "admin@co.jp",
  password: "111111"
  )