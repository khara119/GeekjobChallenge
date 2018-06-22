require './user'

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
		@@hide_card = card[0] if flag
		super(card, flag)
	end

	def open(flag = true)
		# 通常時は伏せカードを隠して表示する
		return Array['?', @my_cards[1]].to_s if flag

		super()
	end

	# 配当金を配る
	def devidend(bet, player_total, is_player_blackjack)
		# プレイヤーのバーストはプレイヤーの負け
		return 0 if player_total > 21

		# 引き分けの場合は賭け金をそのまま返す
		return bet if player_total == total &&
			is_player_blackjack == blackjack?

		# この時点ででディーラーがブラックジャックならプレイヤーの負け
		return 0 if blackjack?

		# この時点でプレイヤーがブラックジャックならプレイヤーの勝ち
		return bet + (bet * 1.5).floor if is_player_blackjack

		# ディーラーがバーストもしくはハンドが小さければプレイヤーの勝ち
		return bet * 2 if total > 21 || total < player_total

		# その他はプレイヤーの負け
		return 0
	end
end
