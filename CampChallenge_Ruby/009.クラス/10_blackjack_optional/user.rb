class User
	# 山札
	@@cards = []
	@@hide_card = 0

	# 初期化処理
	def initialize(limit)
		# 手札
		@my_cards = []

		# ヒット基準
		# 継承先で使用する
		@limit = limit

		# スタンドフラグ
		@is_stand = false
	end

	# ヒットするかどうかの判断（継承先で実装する）
	def hit?
		raise
	end

	# 手札にカードを追加する
	def add_card(card, flag=false)
		# 初期化フラグがあれば初期化する
		# （ゲーム開始時）
		if flag
			@my_cards = []
			@is_stand = false
		end

		# 渡されたカードが配列か数値かによって格納処理を変える
		@my_cards.concat(card) if card.instance_of?(Array)
		@my_cards << card if card.instance_of?(Integer)
	end

	# 手札の合計を取得する
	def total
		sum = 0
		ace_count = 0

		@my_cards.each { |card|
			if card == 1
				ace_count += 1
				next
			end

			sum += card >= 10 ? 10 : card
		}

		# 2枚目以降のAは1にしかならないので、枚数-1を合計に追加
		sum += ace_count - 1 if ace_count >= 2

		# 11を足してバーストしなければ11としてカウントする
		if ace_count > 0
			if sum <= 10
				sum += 11
			else
				sum += 1
			end
		end

		return sum
	end

	# 手札を公開する
	def open
		@my_cards.sort!
		return @my_cards.to_s
	end

	def blackjack?
		return total == 21 && @my_cards.length == 2
	end
end
