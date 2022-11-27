# ジャンケンメソッド
def janken(aikoFlg)
  
  # 前回があいこの場合
  if aikoFlg == true
    puts "あいこで..."
  else
    puts "ジャンケン.."
  end
  
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  handChoice = gets.chomp
  
  # グー、チョキ、パーの場合
  if ["0","1","2"].include?(handChoice)
    
    if aikoFlg == true
      puts "ショ！"
    else
      puts "ホイ！"
    end
    
    hand = ["グー","チョキ","パー"]
    # プレイヤーの選択したジャンケンの手を取得
    playerHand = hand[handChoice.to_i]
    # cpuのジャンケンの手をランダムに取得
    cpuHand = hand[rand(3)]
    puts "------------------"
    puts "あなた:#{playerHand}"
    puts "相手:#{cpuHand}"
    puts "------------------"
    
    # プレイヤーが勝ちの場合
    if (playerHand == "グー" && cpuHand == "チョキ") ||
    (playerHand == "チョキ" && cpuHand == "パー") ||
    (playerHand == "パー" && cpuHand == "グー")
      puts "ジャンケン結果:あなたの勝ち"
      acchimuite(true)
      
    # プレイヤーが負けの場合
    elsif (playerHand == "グー" && cpuHand == "パー") ||
    (playerHand == "チョキ" && cpuHand == "グー") ||
    (playerHand == "パー" && cpuHand == "チョキ")
      puts "ジャンケン結果:あなたの負け"
      acchimuite(false)
    
    # あいこの場合
    else
      puts "ジャンケン結果:あいこ"
      # あいこフラグをtrueにしてジャンケンメソッドの呼び出し
      janken(true)
    end
    
  #戦わない場合
  elsif handChoice == "3"
    puts "戦わずに終了します"
    
  # 0~3以外が入力された場合
  else
    puts "0~3のいずれかを選択してください"
    janken(false)
  end
  
end

# あっち向いてホイメソッド
def acchimuite(jankenWinFlg)
  
  puts "あっち向いて〜"
  puts "0(上)1(下)2(左)3(右)"
  directionChoice = gets.chomp
  
  # 上、下、左、右の場合
  if ["0","1","2","3"].include?(directionChoice)
    
    puts "ホイ！"
    
    direction = ["上","下","左","右"]
    # プレイヤーの選択した方向を取得
    playerDirection = direction[directionChoice.to_i]
    # cpuの方向をランダムに取得
    cpuDirection = direction[rand(4)]
    puts "------------------"
    puts "あなた:#{playerDirection}"
    puts "相手:#{cpuDirection}"
    puts "------------------"
    
    # プレイヤーの方向とcpuの方向が一緒の場合
    if playerDirection == cpuDirection
      # プレイヤーがジャンケンで勝っている場合
      if jankenWinFlg== true
        puts "あっち向いてホイ結果:あなたの勝ち"
      # プレイヤーがジャンケンで負けている場合
      else
        puts "あっち向いてホイ結果:あなたの負け"
      end
    # プレイヤーの方向とcpuの方向が違う場合
    else
      puts "あっち向いてホイ結果:勝負つかず"
      janken(false)
    end
  
  # 0~3以外が入力された場合
  else
    puts "0~3のいずれかを選択してください"
    acchimuite(jankenWinFlg)
  end
  
end

janken(false)