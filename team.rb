class Team
  #クラス変数の宣言
  attr_accessor :name, :win, :lose, :draw
    
  #クラス変数の初期化メソッド
  def initialize(name, win, lose, draw)
    self.name = name
    self.win = win
    self.lose = lose
    self.draw = draw
  end
  
  #勝率を計算するメソッド
  def calc_win_rate
    self.win.to_f / (self.win + self.lose)
  end

  def show_team_result
    puts "#{self.name} の2020年の成績は #{self.win}勝 #{self.lose}敗 #{self.draw}分、勝率は #{self.calc_win_rate}です。"
  end
end

require "json"

#json形式で用意した各球団の情報をファイル読み込みしてハッシュ化
hash = JSON.load(File.open("./input_data.json"))["basball_team_info"]
#puts hash[0].is_a?(Hash)
#球団のインスタンスを格納する配列を作成
baseball_teams = Array.new(hash.size)

#読み込みデータの数だけ球団のインスタンスを生成
hash.each_with_index do |hash, i|
  baseball_teams[i] = Team.new(hash["name"], hash["win"], hash["lose"], hash["draw"])
end

#各球団の勝敗情報を出力
baseball_teams.each do |baseball_team|
  baseball_team.show_team_result
end