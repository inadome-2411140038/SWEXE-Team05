category_names = [
  "自然・絶景",
  "歴史・文化",
  "神社・寺院",
  "グルメ",
  "レジャー・体験"
]

category_names.each do |name|
  Category.find_or_create_by!(name: name)
end