class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string    :name, null:false     #ユーザー名
      t.string    :full_name            #本名
      t.string    :email                #メールアドレス
      t.date      :birthday             #誕生日 
      t.integer   :sex, null: false,default: 1  #性別（男：１、女：２）
      t.boolean   :administrator, null: false, default: false #管理者権限
      t.string    :password_digest      #パスワード

      t.timestamps
    end
  end
end
