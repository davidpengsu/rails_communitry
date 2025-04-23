# 기본 카테고리 생성
categories = ['일상', '질문', '정보']

categories.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end
