CREATE DATABASE gooddeedhunting
\c gooddeedhunting
CREATE TABLE requests (
	id SERIAL PRIMARY KEY,
	acceptor VARCHAR(100) NOT NULL,
	acpt_pic VARCHAR(250) NOT NULL,
	acpt_story VARCHAR(500) NOT NULL,
	item VARCHAR (500) NOT NULL,
	amount INTEGER NOT NULL);

CREATE TABLE donations (
id SERIAL PRIMARY KEY,
donator_id INTEGER NOT NULL FOREIGN KEY (donator_id) REFERENCES users(id) ON DELETE RESTRICT,
donator VACHAR (50) NOT NULL FOREIGN KEY (donator) REFERENCES users(name) ON DELETE RESTRICT,
request_id INTEGER NOT NULL FOREIGN KEY (request_id) REFERENCES requests(id) ON DELETE RESTRICT,
amount INTEGER NOT NULL);


CREATE TABLE donates(
	id SERIAL PRIMARY KEY,
	donator VARCHAR(100) NOT NULL,
	request_id INTEGER NOT NULL,
	donate_amt INTEGER NOT NULL
);

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	email VARCHAR (100) NOT NULL,
	password_digest VARCHAR (300) NOT NULL
);


INSERT INTO users (acceptor,acpt_pic,acpt_story,item,amount) VALUES ('Frost Boy','http://cdn.manilatimes.net/wp-content/uploads/2018/01/Ice-Boy.jpeg','Wang Fuman, 8, Hewalks 2.8 miles through mountains and streams in -9 Celsius weather,until he reached the warmth of his third-grade classroom.He lives in extreme poverty','RMB',1000);

https://github.com/vvnxu/gooddudehunting/raw/master/db.dump
pg_dump -Fc --no-acl --no-owner -h localhost -U <vivien gooddeedhunting> db.dump
heroku pg:backups:restore 'https://github.com/vvnxu/gooddudehunting/raw/master/db.dump' DATABASE_URL