CREATE DATABASE gooddeedhunting
\c gooddeedhunting
CREATE TABLE requests (
	id SERIAL PRIMARY KEY,
	acceptor VARCHAR(100) NOT NULL,
	acpt_pic VARCHAR(250) NOT NULL,
	acpt_story VARCHAR(500) NOT NULL,
	item VARCHAR (500) NULL,
	amount INTEGER);

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
	password_digest VARCHAR (300) NOT NULL,
	request_id FOREIGN KEY(request_id) REFERENCES request(id) ON DELETE RESTRICT
    donate_id FOREIGN KEY(donate_id) REFERENCES donate(id) ON DELETE RESTRICT
);


INSERT INTO users (acceptor,acpt_pic,acpt_story,item,amount) VALUES ('Frost Boy','http://cdn.manilatimes.net/wp-content/uploads/2018/01/Ice-Boy.jpeg','Wang Fuman, 8, Hewalks 2.8 miles through mountains and streams in -9 Celsius weather,until he reached the warmth of his third-grade classroom.He lives in extreme poverty','RMB',1000);


pg_dump -Fc --no-acl --no-owner -h localhost -U <vivien gooddeedhunting> db.dump