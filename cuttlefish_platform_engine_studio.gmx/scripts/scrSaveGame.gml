ini_open("savedgame.ini") ;
ini_write_real("game", "room id", room) ;
ini_write_real("game", "game style", global.game_style) ;
ini_write_real("score", "score", score) ;
ini_write_real("score", "lives", lives) ;
ini_write_real("score", "coins collected", global.coins_collected) ;
ini_write_string("player", "character type", global.player_character_type) ;
ini_close() ;
