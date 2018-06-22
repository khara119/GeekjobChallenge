require './user'

class Player < User

	def initialize(limit)
		super(limit)

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
	end

	def receive_devidend(devidend)
		puts name + 'さんは負けました(' + tip.to_s + ')' if devidend == 0
		puts name + 'さんはドローです(' + (tip + devidend).to_s + ')' if devidend == @bet
		puts name + 'さんは勝ちました(' + tip.to_s + ' → ' + (tip + devidend).to_s + ')' if devidend > @bet

		@tip += devidend
	end

	def stop?
		return tip == 0 || tip > 100000
	end
end
