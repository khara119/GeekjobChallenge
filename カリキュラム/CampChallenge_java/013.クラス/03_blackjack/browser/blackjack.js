window.onload = () => {
	const board = document.getElementById("board");
	const boardWidth = board.scrollWidth;
	const boardHeight = board.scrollHeight;

	const width = document.body.clientWidth;
	const height = document.body.clientHeight;

	let scale = 1.0;
	if (boardWidth > boardHeight) {
		scale = width / boardWidth;
	} else {
		scale = height / boardHeight;
	}

	board.style.transform = "scale(" + scale + ") translateX(25%)";
}

this.deal = () => {
	// S: スペード、D: ダイヤ、H: ハート、C: クラブ
	const suits = ['S', 'D', 'H', 'C'];

	this.deck = [];
	for (let suit in suits) {
		for (let i=1; i<=13; i++) {
			this.deck.push({
				suit: suit,
				number: i,
			});
		}
	}

	const players = document.getElementsByName("player-area");
	for (let i=0; i<2; i++) {
		for (let player in players) {
			const card_area = player.getElementsByName("card-area")[0];
			index = Math.floor(Math.random() * this.deck.length);
			const card = this.deck.splice(index, 1);

			card_area.appendChild(this.createCardElement(card));
		}
	} 

};

this.createCardElement = (card, isBack=false) => {
	const root = document.createElement('div');
	if (isBack) {
		root.classList.add('back');
	}

	const top = document.createElement('div');
	top.classList.add('top');
	top.innerHTML = card.suit + card.number;

	const middle = document.createElement('div');
	middle.classList.add('middle');
	middle.innerHTML = card.suit + card.number;

	const bottom = document.createElement('div');
	bottom.classList.add('bottom');
	bottom.innerHTML = card.suit + card.number;

	root.appendChild(top);
	root.appendChild(middle);
	root.appendChild(bottom);

	return root;
};
