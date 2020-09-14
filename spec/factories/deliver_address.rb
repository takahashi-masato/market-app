FactoryBot.define do

  factory :deliver_address do
    family_name_kanji              {"田中"}
    first_name_kanji               {"達也"}
    family_name_kana               {"タナカ"}
    first_name_kana                {"タツヤ"}
    postal_code                    {"123-4567"}
    prefecture                     {"東京都"}
    city                           {"世田谷区"}
    address1                       {"00000"}
    address2                       {"11"}
    telephone                      {"090-1234-5678"}
  end

end