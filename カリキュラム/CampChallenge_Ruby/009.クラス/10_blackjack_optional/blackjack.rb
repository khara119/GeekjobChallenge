require './dealer'
require './player'

# coding:utf-8
STDOUT.sync = true
TIME=3

dealer = Dealer.new
players = Array.new(5){ Player.new(rand(0.2..0.8)) }

puts ''
sleep(TIME)

# 全プレイヤーがやめたら終わり
while !players.empty?
	puts '総参加者数: ' + Player.total_players.to_s + '人'
	puts ''
	sleep(TIME)

	puts "#############################"
	puts "# " + (dealer.game_count + 1).to_s.rjust(3) + "回目のゲームを始めます #"
	puts "#############################"

	sleep(TIME)

	# 賭け金を設定
	players.each { |player|
		min = 10 ** (Math.log10(player.tip).to_i - 2)
		min = 10 if min < 10

		max = player.tip

		bet = (rand(max - min) + min).ceil
		player.bet(bet)

		puts player.name + 'さんが' + bet.to_s + '枚ベットしました'
	}

	dealer.shuffle

	puts ''
	sleep(TIME)

	# プレイヤーにカードを配る
	players.each { |player|
		player.add_card(dealer.deal, true)
		puts player.name + ': ' + player.open
	}

	# 自分にカードを配る
	dealer.add_card(dealer.deal, true)

	puts 'Dealer: ' + dealer.open

	puts ''
	sleep(TIME)

	survive_players = players.clone;
	hit_players = players.clone;

	while hit_players.length > 0
		# 各プレイヤーのターン
		hit_players.each { |player|
			if player.hit?(dealer.first_open_card)
				player.add_card(dealer.hit)

				puts player.name + 'さんがヒットしました'
				puts player.open

				if player.total > 21
					puts player.name + 'さんがバーストしました'
					survive_players.delete(player)
					hit_players.delete(player)
				end
			else
				puts player.name + 'さんがスタンドしました'
				hit_players.delete(player)
			end

			puts ''
			sleep(TIME)
		}
	end

	puts '全プレイヤーがスタンドorバーストしました'

	players.each { |player|
		puts player.name + ': ' + player.open + '(' + player.total.to_s + ')'
	}

	sleep(TIME)
	puts ''

	puts 'ディーラー: ' + dealer.open(false) + '(' + dealer.total.to_s + ')'

	sleep(TIME)

	# ディーラーのターン
	while dealer.hit? && survive_players.length > 0
		dealer.add_card(dealer.hit)
		puts 'ディーラーがヒットしました'
		puts 'ディーラー: ' + dealer.open(false) + '(' + dealer.total.to_s + ')'
		sleep(TIME)
	end

	puts ''
	sleep(TIME)
	puts 'ディーラーのターンが終わりました。'

	players.each { |player|
		player.update_dealer_info(
			dealer.total,
			dealer.first_open_card,
			dealer.blackjack?
		)
	}

	puts '精算します'

	# 精算
	players.each { |player|
		player.receive_devidend(
			dealer.devidend(player.bet, player.total, player.blackjack?))
	}

	sleep(TIME)

	puts ''
	puts 'ディーラーの総収支: ' + dealer.balance.to_s

	sleep(TIME)

	puts ''

	current_players = players.length
	players.delete_if { |player| player.stop? }
	out_players = current_players - players.length
	puts out_players.to_s + '人が抜けました' if out_players > 0
	puts ''

	sleep(TIME)

	out_players.times { |i|
		players << Player.new(rand(0.2..0.8))
	}

	sleep(TIME)
end

puts '参加者がいなくなりました'
