require './user'

class Player < User

	@@total_players = 0

	def initialize(limit)
		super(limit)

		@@total_players += 1

		##########
		# 名前作成
		##########

		vowel = 'aiueo'
		cons = ' kstnhmyrwgzdb'

		@name = ''
		4.times { |i|
			@name += cons[rand(cons.length)]
			@name += vowel[rand(vowel.length)]
		}

		# 正しいローマ字に置換して頭文字を大文字にする
		@name = @name.gsub(/ /, '').gsub(/si/, 'shi').gsub(/ti/, 'chi')
			.gsub(/tu/, 'tsu').gsub(/hu/, 'fu').gsub(/y([ie])/, '\1')
			.gsub(/w([iueo])/, '\1').gsub(/zi/, 'ji').gsub(/di/, 'ji')
			.gsub(/du/, 'zu').capitalize

		##########
		# チップ
		##########

		@tip = rand(9001) + 1000

		puts @name + 'さんがチップ' + @tip.to_s + '枚で参加しました。'
	end

	def hit?
		# ゲーム中にスタンドしたらスタンド
		return false if @is_stand

		return true if total <= 10

		under_count = 0
		limit = 21 - total
		@@cards.each { |card|
			under_count += 1 if card <= limit
		}

		# ディーラーの伏せカードも考慮する
		under_count += 1 if @@hide_card <= limit

		@is_stand = under_count.fdiv(@@cards.length) < @limit
		return !@is_stand
	end

	def name
		return @name
	end

	def tip
		return @tip
	end

	def bet(tip=-1)
		return @bet if tip == -1

		@bet = tip
		@tip -= tip
		@balance -= @bet
	end

	def receive_devidend(devidend)
		print name + 'さんは負けました(' + (tip + bet).to_s + ' → ' + tip.to_s + ') ' if devidend == 0
		print name + 'さんはドローです(' + (tip + devidend).to_s + ') ' if devidend == @bet
		print name + 'さんは勝ちました(' + (tip + bet).to_s + ' → ' + (tip + devidend).to_s + ') ' if devidend > @bet

		@tip += devidend
		@balance += devidend
		puts '計' + game_count.to_s + '回参加、総収支: ' + balance.to_s 
	end

	def stop?
		return tip <= @@minimum_bet
	end

	def self.total_players
		return @@total_players
	end
end
