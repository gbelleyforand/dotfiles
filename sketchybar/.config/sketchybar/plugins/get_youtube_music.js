const title = document.querySelector('.title.style-scope.ytmusic-player-bar')?.textContent?.trim();
const artist = document.querySelector('.byline.style-scope.ytmusic-player-bar')?.textContent?.trim();
if (title && artist) {
  console.log(`${title} – ${artist}`);
} else if (title) {
  console.log(title);
}

