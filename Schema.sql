--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
-- \i 'C:/Users/fastc/OneDrive/Desktop/code/projects/Java/Unit 7/unit-7-java-Aj-Gilliland/modules/03-sql-basics/Person.sql'
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
-- samples
-- context: this would store all the bcca portfolio content for Sean. Ideally I think the querys should be for graphs and display data used on basecampers for Sean.
-- (besides resumes, I think its better just so I don't mess up some formatting. Also he would prob rather critic it in google doc himself)

--VvVvV This is just a basic that I know I always end up using, returns all data (with the exception of all the id's) VvVvV
-- SELECT p.id AS person_id,p.first_name,p.last_name,p.age,c.email,c.phone_number,c.linked_in,c.github,c.portfolio,a.bio,a.skills,a.languages FROM Person p
-- JOIN Contact c ON p.contact_id = c.id JOIN About a ON p.about_id = a.id
-- ORDER BY p.id;

--VvVvV This should get everyone from in state. You could this is mostly to help find people able to create those visits community was doing at the start of the year (by phone number) VvVvV
-- SELECT first_name, last_name FROM Person JOIN Contact ON Person.contact_id = Contact.id WHERE phone_number LIKE '662%';

--VvVvV This should get everyone who hasn't switched over the professional email VvVvV
-- SELECT first_name,last_name,email FROM person JOIN contact ON person.contact_id = contact.id WHERE email LIKE '%@basecampcodingacademy.org';

--VvVvV This will count the number of basecampers currently in the system (also tried out Alias if this was never turned into a gui) VvVvV
-- SELECT COUNT(*) AS total_people FROM Person;

--VvVvV This shows everyone but put the people who have filled out the least goto the top so Sean can see the slackers VvVvV
-- SELECT p.first_name,p.last_name,c.email,c.phone_number,c.linked_in,c.github,c.portfolio,a.bio,a.skills,a.languages FROM Person p
-- JOIN Contact c ON p.contact_id = c.id JOIN About a ON p.about_id = a.id
-- WHERE((c.email = '' OR c.phone_number = '' OR c.linked_in = '' OR c.github = '' OR c.portfolio = '') OR (a.bio = '' OR a.skills = '' OR a.languages = ''));
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
--tables
CREATE TABLE Contact (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    email VARCHAR(100),
    phone_number VARCHAR(20) NOT NULL,
    linked_in TEXT,
    github TEXT,
    portfolio TEXT
);
CREATE TABLE About (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    bio TEXT,
    skills TEXT,
    languages TEXT
);
CREATE TABLE Person (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    contact_id BIGINT REFERENCES Contact(id),
    about_id BIGINT REFERENCES About(id)
);
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--
-- test data
INSERT INTO Contact (email, phone_number, linked_in, github, portfolio) VALUES
    ('basia@basecampcodingacademy.org', '1234567890', 'linkedin.com/basia', 'github.com/basia', 'portfolio.com/basia'),
    ('lulu@example.com', '9876543210', 'linkedin.com/lulu', 'github.com/lulu', 'portfolio.com/lulu'),
    ('obed@example.com', '6621234567', 'linkedin.com/obed', 'github.com/obed', 'portfolio.com/obed'),
    ('elisha@example.com', '9876543210', '', 'github.com/elisha', 'portfolio.com/elisha'),
    ('sephira@example.com', '1234567890', 'linkedin.com/sephira', 'github.com/sephira', 'portfolio.com/sephira'),
    ('walton@example.com', '6629876543', 'linkedin.com/walton', '', 'portfolio.com/walton'),
    ('faunie@example.com', '9998887777', 'linkedin.com/faunie', 'github.com/faunie', 'portfolio.com/faunie'),
    ('dillon@basecampcodingacademy.org', '4646464646', 'linkedin.com/dillon', 'github.com/dillon', 'portfolio.com/dillon'),
    ('valli@example.com', '2525252525', 'linkedin.com/valli', 'github.com/valli', ''),
    ('rosene@basecampcodingacademy.org', '1010101010', '', '', 'portfolio.com/rosene');
INSERT INTO About (bio, skills, languages) VALUES
    ('Passionate software developer with a focus on web technologies.', '', 'HTML, CSS, JavaScript, Java, Python'),
    ('Experienced data scientist with a background in machine learning.', 'Python (Pandas, Scikit-learn), Data Visualization', 'Python, R, SQL'),
    ('Full-stack developer with expertise in building scalable applications.', 'Java (Spring Boot), React, Docker', 'Java, JavaScript, HTML, CSS'),
    ('', 'Python (TensorFlow, PyTorch), NLP', 'Python, TensorFlow, PyTorch'),
    ('DevOps engineer automating infrastructure and deployment pipelines.', 'Docker, Kubernetes, Jenkins', 'Bash, Python, Ruby'),
    ('Cybersecurity specialist with a passion for ethical hacking.', 'Penetration testing, Network security', 'C, Python, SQL'),
    ('Mobile app developer creating innovative solutions for Android and iOS.', 'Swift, Kotlin, Flutter', 'Swift, Kotlin, Dart'),
    ('Blockchain developer working on decentralized applications.', 'Solidity, Ethereum, Smart Contracts', 'Solidity, JavaScript, Python'),
    ('', 'Sketch, Figma, Adobe XD', 'HTML, CSS, JavaScript'),
    ('Database administrator optimizing performance and ensuring data integrity.', '', 'SQL, MongoDB');
-- This was generated with mackaroo while the test data above was generated with gpt, 
-- it would seem that mackaroo isnt as good once you start doing relationships
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (1, 'Wileen', 'Towsey', 54, 1, 1);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (2, 'Tedda', 'Devonald', 79, 2, 2);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (3, 'Tuck', 'McQuie', 76, 3, 3);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (4, 'Alie', 'Keightley', 10, 4, 4);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (5, 'Burch', 'Sutherden', 31, 5, 5);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (6, 'Phoebe', 'Domingues', 63, 6, 6);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (7, 'Adolpho', 'Barthorpe', 46, 7, 7);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (8, 'Neile', 'Muirhead', 55, 8, 8);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (9, 'Gare', 'Huett', 14, 9, 9);
insert into Person (id, first_name, last_name, age, contact_id, about_id) values (10, 'Grover', 'Quittonden', 1, 10, 10);
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--




