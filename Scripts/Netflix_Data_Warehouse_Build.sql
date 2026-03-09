-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS netflix_db;
USE netflix_db;

-- 2. Master Content Table (The joined CSV data)
CREATE TABLE IF NOT EXISTS netflix_master (
    show_id INT PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    director TEXT,
    cast TEXT,
    country VARCHAR(255),
    date_added DATE,
    release_year INT,
    rating VARCHAR(50),
    duration VARCHAR(50),
    genres TEXT,
    description TEXT,
    popularity FLOAT,
    vote_average FLOAT
);

-- 3. Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    signup_date DATE
);

-- 4. Subscriptions Table
CREATE TABLE IF NOT EXISTS subscriptions (
    user_id INT,
    plan_type VARCHAR(50),
    status VARCHAR(20),
    start_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- 5. Watch History Table
CREATE TABLE IF NOT EXISTS watch_history (
    watch_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    show_id INT,
    watch_date DATE,
    completion_percent INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES netflix_master(show_id) ON DELETE CASCADE
);

-- 6. Ratings Table
CREATE TABLE IF NOT EXISTS ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    show_id INT,
    rating_score INT CHECK (rating_score BETWEEN 1 AND 5),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES netflix_master(show_id) ON DELETE CASCADE
);


-- actually i added users manually to understand more clearly and easy to read 

USE netflix_db;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE users;
TRUNCATE TABLE subscriptions;
TRUNCATE TABLE watch_history;
TRUNCATE TABLE ratings;
SET FOREIGN_KEY_CHECKS = 1; 

INSERT INTO users (user_id, username, email, signup_date) VALUES
(1, 'rahul_ds', 'rahul@example.com', '2024-01-10'), (2, 'priya_data', 'priya@example.com', '2024-01-12'),
(3, 'amit_sql', 'amit@example.com', '2024-01-15'), (4, 'sneha_dev', 'sneha@example.com', '2024-01-20'),
(5, 'john_doe', 'john@example.com', '2024-01-22'), (6, 'jane_smith', 'jane@example.com', '2024-01-25'),
(7, 'mike_ross', 'mike@example.com', '2024-02-01'), (8, 'rachel_z', 'rachel@example.com', '2024-02-03'),
(9, 'harvey_specter', 'harvey@example.com', '2024-02-05'), (10, 'louis_litt', 'louis@example.com', '2024-02-08'),
(11, 'sara_connor', 'sara@example.com', '2024-02-10'), (12, 'tony_stark', 'tony@example.com', '2024-02-12'),
(13, 'bruce_wayne', 'bruce@example.com', '2024-02-14'), (14, 'clark_k', 'clark@example.com', '2024-02-15'),
(15, 'diana_p', 'diana@example.com', '2024-02-16'), (16, 'barry_a', 'barry@example.com', '2024-02-17'),
(17, 'arthur_curry', 'arthur@example.com', '2024-02-18'), (18, 'victor_s', 'victor@example.com', '2024-02-19'),
(19, 'hal_jordan', 'hal@example.com', '2024-02-20'), (20, 'billy_batson', 'billy@example.com', '2024-02-21'),
(21, 'steve_rogers', 'steve@example.com', '2024-02-22'), (22, 'natasha_r', 'natasha@example.com', '2024-02-23'),
(23, 'wanda_m', 'wanda@example.com', '2024-02-24'), (24, 'vision_ai', 'vision@example.com', '2024-02-25'),
(25, 'sam_wilson', 'sam@example.com', '2024-02-26'), (26, 'bucky_b', 'bucky@example.com', '2024-02-27'),
(27, 'scott_lang', 'scott@example.com', '2024-02-28'), (28, 'hope_van', 'hope@example.com', '2024-03-01'),
(29, 'peter_parker', 'peter@example.com', '2024-03-02'), (30, 'stephen_s', 'stephen@example.com', '2024-03-03'),
(31, 't_challa', 'wakanda@example.com', '2024-03-04'), (32, 'shuri_tech', 'shuri@example.com', '2024-03-05'),
(33, 'carol_d', 'marvel@example.com', '2024-03-06'), (34, 'nick_fury', 'fury@example.com', '2024-03-07'),
(35, 'maria_hill', 'hill@example.com', '2024-03-08');

INSERT INTO subscriptions (user_id, plan_type, status, start_date) VALUES
(1,'Premium','Active','2024-01-10'), (2,'Basic','Active','2024-01-12'), (3,'Standard','Active','2024-01-15'),
(4,'Premium','Active','2024-01-20'), (5,'Basic','Canceled','2024-01-22'), (6,'Standard','Active','2024-01-25'),
(7,'Premium','Active','2024-02-01'), (8,'Standard','Active','2024-02-03'), (9,'Premium','Active','2024-02-05'),
(10,'Basic','Active','2024-02-08'), (11,'Standard','Active','2024-02-10'), (12,'Premium','Active','2024-02-12'),
(13,'Premium','Active','2024-02-14'), (14,'Standard','Active','2024-02-15'), (15,'Premium','Active','2024-02-16'),
(16,'Basic','Active','2024-02-17'), (17,'Standard','Active','2024-02-18'), (18,'Basic','Active','2024-02-19'),
(19,'Standard','Active','2024-02-20'), (20,'Premium','Active','2024-02-21'), (21,'Premium','Active','2024-02-22'),
(22,'Standard','Active','2024-02-23'), (23,'Basic','Active','2024-02-24'), (24,'Premium','Active','2024-02-25'),
(25,'Standard','Active','2024-02-26'), (26,'Basic','Active','2024-02-27'), (27,'Standard','Active','2024-02-28'),
(28,'Premium','Active','2024-03-01'), (29,'Premium','Active','2024-03-02'), (30,'Standard','Active','2024-03-03'),
(31,'Premium','Active','2024-03-04'), (32,'Basic','Active','2024-03-05'), (33,'Standard','Active','2024-03-06'),
(34,'Premium','Active','2024-03-07'), (35,'Standard','Active','2024-03-08');


INSERT INTO watch_history (user_id, show_id, watch_date, completion_percent) VALUES
(1, 10192, '2024-02-10', 100), (2, 10192, '2024-02-12', 90), (3, 10192, '2024-02-14', 85),
(4, 27205, '2024-02-15', 100), (5, 27205, '2024-02-16', 20), (6, 27205, '2024-02-17', 45),
(7, 33238, '2024-02-18', 100), (8, 33238, '2024-02-19', 100), (9, 33238, '2024-02-20', 100),
(10, 10192, '2024-02-21', 75), (11, 27205, '2024-02-22', 95), (12, 33238, '2024-02-23', 10),
(13, 10192, '2024-02-24', 100), (14, 27205, '2024-02-25', 100), (15, 33238, '2024-02-26', 100),
(16, 10192, '2024-02-27', 60), (17, 27205, '2024-02-28', 88), (18, 33238, '2024-03-01', 92),
(19, 10192, '2024-03-02', 100), (20, 27205, '2024-03-03', 100), (21, 33238, '2024-03-04', 100),
(22, 10192, '2024-03-05', 100), (23, 27205, '2024-03-06', 100), (24, 33238, '2024-03-07', 100),
(25, 10192, '2024-03-08', 100), (26, 27205, '2024-03-09', 100), (27, 33238, '2024-03-10', 100),
(28, 10192, '2024-03-11', 100), (29, 27205, '2024-03-12', 100), (30, 33238, '2024-03-13', 100),
(31, 10192, '2024-03-14', 100), (32, 27205, '2024-03-15', 100), (33, 33238, '2024-03-16', 100),
(34, 10192, '2024-03-17', 100), (35, 27205, '2024-03-18', 100);

INSERT INTO ratings (user_id, show_id, rating_score) VALUES
(1, 10192, 5), (2, 10192, 4), (3, 10192, 5), (4, 27205, 5), (5, 27205, 1),
(7, 33238, 5), (8, 33238, 5), (9, 33238, 4), (10, 10192, 3), (11, 27205, 5),
(13, 10192, 5), (14, 27205, 4), (15, 33238, 5), (17, 27205, 4), (18, 33238, 4),
(19, 10192, 5), (20, 27205, 5), (21, 33238, 3), (22, 10192, 5), (23, 27205, 5),
(24, 33238, 5), (25, 10192, 4), (26, 27205, 4), (27, 33238, 5), (28, 10192, 5),
(29, 27205, 5), (30, 33238, 4), (31, 10192, 5), (32, 27205, 5), (33, 33238, 5),
(34, 10192, 4), (35, 27205, 4);

--  1: Content Popularity Leaderboard
SELECT 
    m.title, 
    m.type, 
    COUNT(wh.user_id) AS total_views,
    AVG(wh.completion_percent) AS avg_completion
FROM netflix_master m
JOIN watch_history wh ON m.show_id = wh.show_id
GROUP BY m.title, m.type
ORDER BY total_views DESC;

-- 2: High-Rated "Gems"
SELECT 
    m.title, 
    AVG(r.rating_score) AS average_user_rating, 
    COUNT(r.rating_score) AS number_of_ratings
FROM netflix_master m
JOIN ratings r ON m.show_id = r.show_id
GROUP BY m.title
HAVING number_of_ratings > 0
ORDER BY average_user_rating DESC;

-- 3: Subscription & Revenue Analysis

SELECT 
    plan_type, 
    COUNT(user_id) AS total_subscribers,
    CASE 
        WHEN plan_type = 'Premium' THEN COUNT(user_id) * 15.99 
        WHEN plan_type = 'Standard' THEN COUNT(user_id) * 12.99
        ELSE COUNT(user_id) * 9.99 
    END AS estimated_monthly_revenue
FROM subscriptions
WHERE status = 'Active'
GROUP BY plan_type;

-- 4: User Engagement Audit
SELECT 
    u.username, 
    COUNT(wh.show_id) AS titles_watched,
    ROUND(AVG(wh.completion_percent), 2) AS avg_completion_rate
FROM users u
LEFT JOIN watch_history wh ON u.user_id = wh.user_id
GROUP BY u.username
ORDER BY titles_watched DESC;

-- 5: Genre Trend Analysis
SELECT 
    genres, 
    COUNT(*) AS total_count,
    ROUND(AVG(vote_average), 2) AS avg_imdb_score
FROM netflix_master
WHERE genres IS NOT NULL
GROUP BY genres
ORDER BY total_count DESC
LIMIT 10;

SELECT * FROM users;
SELECT * FROM subscriptions;
SELECT * FROM watch_history;
SELECT * FROM ratings;
