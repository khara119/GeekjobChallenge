###
# なるべく本来のブラックジャックに近づけたルールです
# ・Aは1 or 11で選べる
# ・J～Kは10扱い
###

class Player
	def initialize(limit = 16)
		@my_cards = []
		# カードを引くかどうかの境界線
		@limit = limit
	end

	def open
		sum = 0
		ace_count = 0
		@my_cards.each { |card|
			# Aが出た場合は数値調整のため後で計算する
			if card == 1
				ace_count += 1
			elsif card >= 11
				sum += 10
			else
				sum += card
			end
		}

		# Aが2枚以上の時は、1枚以外は必ず1とする
		# （11*2でオーバーするため）
		while ace_count >= 2
			sum += 1
			ace_count -= 1
		end

		# Aの数値判定
		if ace_count == 1 && 21 - sum >= 11
			sum += 11
		elsif ace_count == 1
			sum += 1
		end

		return sum
	end

	def set_card(cards)
		@my_cards.concat(cards)
	end

	def check_sum
		# 用途が違うので使うべきではないかもしれないが、
		# 面倒なのでopenメソッドを仕様
		return open <= @limit
	end

	def isWin(other)
		my = open
		return ((other > 21 && my <= 21) ||
			(my <= 21 && other <= my)) && other != my
	end

	def print
		p @my_cards
	end
end

class Dealer < Player
	def initialize
		super(18)
		@cards = [];
		
		# 無駄にシャッフル作業を混ぜる
		deck = (1..13).to_a * 4
		#p deck

		52.times { |i|
			index = rand(deck.length)
			@cards << deck[index]
			deck.delete_at(index)
		}

		#p @cards
	end

	def deal
		cards = []
		2.times { |i|
			index = rand(@cards.length)
			cards << @cards[index]
			@cards.delete_at(index)
		}

		return cards
	end

	def hit
		index = rand(@cards.length)
		card = @cards[index]
		@cards.delete_at(index)

		return [card]
	end
end

dealer = Dealer.new
player = Player.new

player.set_card(dealer.deal)
dealer.set_card(dealer.deal)

while player.check_sum || dealer.check_sum
	# player.print
	# dealer.print

	player.set_card(dealer.hit) if player.check_sum
	dealer.set_card(dealer.hit) if dealer.check_sum
end

print 'Player: '
player.print

print 'Dealer: '
dealer.print

p_sum = player.open
d_sum = dealer.open

p_result = player.isWin(d_sum) ? 'WIN' : '   '
d_result = dealer.isWin(p_sum)? 'WIN' : '   '


puts p_result + ' Player ' + p_sum.to_s +
	' vs ' + d_sum.to_s + ' Dealer ' + d_result
