-- Create database
CREATE DATABASE IF NOT EXISTS playlist CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Create table: playlist
CREATE TABLE IF NOT EXISTS playlist (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	artist VARCHAR(50) NOT NULL,
	uri VARCHAR(50) NOT NULL,
	img_url VARCHAR(100) NULL,
	insertdatetime DATETIME NOT NULL,
	requestedby INT(10) UNSIGNED NOT NULL,
	played TINYINT(1) NOT NULL,
	playdatetime DATETIME NULL,
	PRIMARY KEY (id)
);

-- Create table: messages
CREATE TABLE IF NOT EXISTS messages (
	id TINYINT UNSIGNED NOT NULL,
	message VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

-- Insert values: messages
INSERT INTO messages (id, message)
VALUES
	(1,"Good choice; that'll get Liz and Owen dancing close together"),
	(2,"Nothing says great pick like 'LO'"),
	(3,"That song gets Owen smiling from ear-to-ear"),
	(4,"Riley likes that song choice THIS much"),
	(5,"I think Liz thinks that song pick was questionable"),
	(6,"That song is like an Owen buzzcut"),
	(7,"Your song pick is as serene as the calm bay water"),
	(8,"They're all up to something"),
	(9,"That's a big-ass tree. Oh, cool song!"),
	(10,"Your song reminds Riley of St. Patrick's Day"),
	(11,"Matt doesn't like selfies"),
	(12,"That song makes me want to find some green, man"),
	(13,"Liz will squish your song like a Lebron fan's head"),
	(14,"I think Owen didn't get the memo to make a funny face"),
	(15,"Doesn't this remind you of The Matrix?"),
	(16,"Such a great Christmas song!"),
	(17,"That song is like the cool side of the pillow"),
	(18,"The kids are getting ready to make some PSLs"),
	(20,"Pro tip: look at the camera lens, not yourself when taking selfies"),
	(21,"Pro tip: look at the camera lens, not yourself when taking selfies"),
	(22,"I think they're trying to say, 'Sup cuz, cool song choice'"),
	(26,"Your song is dedicated to all our service men and women"),
	(28,"I think Liz would have PICKED the same song"),
	(29,"Don't be a pussy - pick a better song"),
	(32,"That should bring a Sparc(o) to the party!"),
	(33,"They both LOVED your song choice!"),
	(34,"Mostly in sync. Pick an N*Sync song next"),
	(36,"This doesn't need a caption")
;
