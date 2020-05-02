import "bootstrap"
import "phoenix_html"
import "../css/app.scss"

import Player from "./youtube"
let video = document.getElementById("video")

if (video) {
    Player.init(video.id, video.getAttribute("data-player-id"), () => {
        console.log("player ready!")
    })
}