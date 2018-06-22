require './dealer'
require './player'

STDOUT.sync = true
TIME=1

dealer = Dealer.new
players = Array.new(5){ Player.new(0.6) }

puts ''
sleep(TIME)

# 全プレイヤーがやめたら終わり
while !players.empty?
	puts "##########################"
	puts "# 新しいゲームを始めます #"
	puts "##########################"

	# 賭け金を設定
	players.each { |player|
		min = player.tip.fdiv(10).ceil
		max = player.tip
		bet = rand(max - min) + min
		player.bet(bet)

		puts player.name + 'さんが' + bet.to_s + '枚ベットしました'
	}

	dealer.shuffle

	puts ''
	sleep(TIME)

	hit_count = 0

	# プレイヤーにカードを配る
	players.each { |player|
		player.add_card(dealer.deal, true)
		puts player.name + ': ' + player.open
		hit_count += 1 if player.hit?
	}

	# 自分にカードを配る
	dealer.add_card(dealer.deal, true)

	puts 'Dealer: ' + dealer.open

	while hit_count > 0
		hit_count = 0

		# 各プレイヤーのターン
		players.each { |player|
			if player.hit?
				player.add_card(dealer.hit)
				puts player.name + 'さんがヒットしました'
				puts player.open
			end

			hit_count += 1 if player.hit?
		}
	end

	puts '全プレイヤーがスタンドしました'

	players.each { |player|
		puts player.name + ': ' + player.open + '(' + player.total.to_s + ')'
	}

	puts 'ディーラー: ' + dealer.open(false) + '(' + dealer.total.to_s + ')'

	# ディーラーのターン
	while dealer.hit?
		dealer.add_card(dealer.hit)
		puts 'ディーラーがヒットしました'
		puts 'ディーラー: ' + dealer.open(false) + '(' + dealer.total.to_s + ')'
	end

	puts ''
	sleep(TIME)
	puts 'ディーラーのターンが終わりました。'
	puts '精算します'

	# 精算
	players.each { |player|
		player.receive_devidend(
			dealer.devidend(player.bet, player.total, player.blackjack?))
	}

	current_players = players.length
	players.delete_if { |player| player.stop? }
	puts (current_players - players.length).to_s + '人が抜けました' if current_players != players.length
	puts ''
	sleep(TIME)
end

puts '参加者がいなくなりました'
