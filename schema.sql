DROP TABLE IF EXISTS trick;
CREATE TABLE IF NOT EXISTS trick(
	/*snake_case space separated*/
	title TEXT PRIMARY KEY,
	tags TEXT NOT NULL, 
	descr TEXT DEFAULT NULL
	/* as for id, use indices in sqlite3*/
);

INSERT INTO trick(tags,title,descr) VALUES('life','sigma and alphas believe in God','and pussies call themselves atheists');
INSERT INTO trick(tags,title,descr) VALUES('money business life','make promises and die preserving them',"if u cannot trust yourself, others can't either");
INSERT INTO trick(tags,title,descr) VALUES('programming perl shit',"bro try perl and you're gonna love it","it's like Stockholm Syndrome");
INSERT INTO trick(tags,title,descr) VALUES('life programming',"fun fact: this program doesn't give a fuck","about anything! not data integrity, not writing 'good' code (there's no 'good code') and not even in delete and update functions");
INSERT INTO trick(tags,title) VALUES('life','not committing sins make u the strongest u have ever been');
