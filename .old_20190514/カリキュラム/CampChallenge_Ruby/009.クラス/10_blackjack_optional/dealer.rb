require './user'

STDOUT.sync = true

class Dealer < User
	def initialize
		super(16)
	end

	def shuffle
		@@cards = (1..13).to_a * 4
		@@cards.shuffle!
	end

	def hit?
		return total <= @limit
	end

	def hit
		return @@cards.shift
	end

	def deal
		cards = Array.new(2) { @@cards.shift }
		return cards
	end

	def add_card(card, flag=false)
		if flag
			@hide_card = card[0]
			@first_open_card = card[1]
		end

		super(card, flag)
	end

	def open(flag = true)
		# 通常時は伏せカードを隠して表示する
		return Array['?', @first_open_card].to_s if flag

		super()
	end

	# 配当金を配る
	def devidend(bet, player_total, is_player_blackjack)
		# プレイヤーのバーストはプレイヤーの負け
		if player_total > 21
			@balance += bet
			return 0
		end

		# 引き分けの場合は賭け金をそのまま返す
		if player_total == total && is_player_blackjack == blackjack?
			return bet
		end

		# この時点ででディーラーがブラックジャックならプレイヤーの負け
		if blackjack?
			@balance += bet
			return 0
		end

		# この時点でプレイヤーがブラックジャックならプレイヤーの勝ち
		if is_player_blackjack
			d = (bet * 1.5).floor
			@balance -= d
			return d + bet
		end

		# ディーラーがバーストもしくはハンドが小さければプレイヤーの勝ち
		if total > 21 || total < player_total
			@balance -= bet
			return bet * 2
		end

		# その他はプレイヤーの負け
		@balance += bet
		return 0
	end

	def first_open_card
		return @first_open_card
	end
end
