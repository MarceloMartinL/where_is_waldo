window.onload = function() {

	const game = document.querySelector('#game');
	const gameImg = document.querySelector('.game-img');
	const charList = [...document.querySelectorAll('.char-list li')];

	gameImg.addEventListener('click', function(e) {
		console.log(e.pageX);
		console.log(e.pageY);
		search(e);
	})

	function search(event) {
		const token = document.getElementsByName("csrf-token")[0].content
		fetch('/search', { 
			mode: 'cors',
			method: 'POST',
			headers: {
				Accept: 'application/json, application/xhtml+xml',
				'Content-Type': 'application/json',
				'X-CSRF-Token': token
			},
			body: JSON.stringify({ 
				game: { 
					id: window.location.href.split("/").pop(), 
					xAxis: event.pageX, 
					yAxis: event.pageY 
				}})
			 })
		.then(response => {
			return response.json()
		})
		.then(response => {
			if (response) { 
				charLayer(response);
				charFound(response.id);
				checkWin();
			}
		})
		.catch(err => console.log(err))
	}

	function charLayer(character) {
		const div = document.createElement('div');

		div.style.width = character.x1 - character.x0 + 'px';
		div.style.height = character.y0 - character.y1 + 'px';
		div.style.background = '#0b0a0a99';
		div.style.position = 'absolute';
		div.style.left = character.x0 + 'px';
		div.style.top = character.y1 + 'px';

		game.appendChild(div);
	}

	function charFound(id) {
		charList.forEach(char => {
			if (char.attributes.char_id.textContent == id) {
				char.classList.add('found')
			}
		})
	}

	function checkWin() {
		fetch('/checkwin', { 
			mode: 'cors'
		})
		.then(response => { 
			return response.json()
		})
		.then(response =>  {
			if (response.win) window.location.pathname = 'scores' 
		})
		.catch(err => console.log(err))
	}
}

	// function checkWin() {
	// 	const charLeft = charList.every(char => char.className.includes('found'))
	// 	console.log(charList)
	// 	console.log(charLeft);
	// }

	// function winScreen() {
	// 	const win = document.createElement('div');
	// 	const winText = document.createElement('h1');

	// 	winText.textContent = "CONGRATULATIONS, YOU WON!";
	// 	win.appendChild(winText);
	// 	alert("YOU WON!")
	// }

