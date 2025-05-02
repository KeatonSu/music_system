-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost:8889
-- 生成日期： 2023-05-07 21:06:09
-- 服务器版本： 5.7.39
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `try2`
--

-- --------------------------------------------------------

--
-- 表的结构 `album`
--

CREATE TABLE `album` (
  `albumID` varchar(5) NOT NULL,
  `albumTitle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `album`
--

INSERT INTO `album` (`albumID`, `albumTitle`) VALUES
('1111', 'New Jeans'),
('1112', 'Ditto'),
('1113', 'OMG'),
('1114', 'SQUARE ONE'),
('1115', 'ME'),
('1116', 'R'),
('1117', 'SOLO'),
('1118', 'DUMB DUMB'),
('1119', 'dont smile at me'),
('1120', 'eyes closed'),
('1121', '='),
('1122', 'x'),
('1123', 'Gloria'),
('1124', 'Lover'),
('1125', '1989'),
('1126', 'Red'),
('1127', 'Imagine'),
('1128', '1'),
('1129', 'The Beatles'),
('1130', 'BORN PINK');

-- --------------------------------------------------------

--
-- 表的结构 `artist`
--

CREATE TABLE `artist` (
  `artistID` varchar(5) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `artistBio` varchar(100) DEFAULT NULL,
  `artistURL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `artist`
--

INSERT INTO `artist` (`artistID`, `fname`, `lname`, `artistBio`, `artistURL`) VALUES
('aa88', 'Adele', 'Adkins', 'is an English singer and songwriter', 'https://www.instagram.com/adele/'),
('be01', 'Billie', 'Eilish', 'is an American singer-songwriter', 'https://www.instagram.com/billieeilish/'),
('dk96', 'Daniel', 'Kang', 'is a South Korean singer-songwriter, actor', 'https://www.instagram.com/daniel.k.here/'),
('dm05', 'Danielle', 'Marsh', 'is a Korean-Australian singer and member of NewJeans', 'https://www.instagram.com/daniellenewjeans/'),
('es91', 'Ed', 'Sheeran', 'is an English singer-songwriter', 'https://www.instagram.com/teddysphotos/'),
('ib91', 'Irene', 'Bae', 'is a South Korean singer, television host and actress', 'https://www.instagram.com/renebaebae/'),
('jb94', 'Justin', 'Bieber', 'is a Canadian singer, is recognized for his genre-melding musicianship in modern-day popular music', 'https://www.instagram.com/justinbieber/'),
('jk95', 'Jisoo', 'Kim', 'is a South Korean singer and actress. She is a member of girl group Blackpink', 'https://www.instagram.com/sooyaaa__/'),
('jk96', 'Jennie', 'Kim', 'is a South Korean singer and rapper', 'https://www.instagram.com/jennierubyjane/'),
('jl40', 'John', 'Lennon', 'was an English singer', 'https://www.instagram.com/johnlennon/'),
('jz98', 'Jieqiong', 'Zhou', 'is a Chinese singer and actress,member of girl group I.O.I', 'https://www.instagram.com/zhou_jieqiong1216/'),
('lm97', 'Lisa', 'Manobal', 'is a Thai rapper, singer and dancer. She is a member of girl group Blackpink', 'https://www.instagram.com/lalalalisa_m/'),
('pm42', 'Paul', 'McCartney', 'is an English singer, songwriter and musician who gained worldwide fame with the Beatles', 'https://www.instagram.com/paulmccartney/'),
('rp97', 'Rose', 'Park', 'is a Korean-New Zealand singer and dancer based in South Korea', 'https://www.instagram.com/roses_are_rosie/'),
('sj01', 'Somi', 'Jeon', 'is a Korean and Canadian singer, rapper and dancer', 'https://www.instagram.com/somsomi0309/'),
('sm98', 'Sakura', 'Miyawaki', 'is a Japanese singer and actress based in South Korea. She is a member of girl group Le Sserafim', 'https://www.instagram.com/39saku_chan/'),
('ss92', 'Sam', 'Smith', 'is an English singer and songwriter', 'https://www.instagram.com/samsmith/'),
('tc99', 'Tzu-yu', 'Chou', 'is a Taiwanese singer based in South Korea. She is the member of the girl group Twice', 'https://www.instagram.com/thinkaboutzu/'),
('ts89', 'Taylor', 'Swift', 'is an American singer-songwriter', 'https://www.instagram.com/taylorswift/'),
('ws94', 'Wendy', 'Son', 'is a South Korean singer, voice actress, radio host known for a member of girl group Red Velvet', 'https://www.instagram.com/todayis_wendy/');

-- --------------------------------------------------------

--
-- 表的结构 `artistPerformsSong`
--

CREATE TABLE `artistPerformsSong` (
  `artistID` varchar(5) NOT NULL,
  `songID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `artistPerformsSong`
--

INSERT INTO `artistPerformsSong` (`artistID`, `songID`) VALUES
('pm42', '1'),
('rp97', '10'),
('dm05', '11'),
('dm05', '12'),
('dk96', '14'),
('ws94', '15'),
('jz98', '16'),
('sj01', '17'),
('dm05', '18'),
('dm05', '19'),
('jl40', '2'),
('dm05', '20'),
('pm42', '3'),
('ts89', '4'),
('ts89', '5'),
('es91', '6'),
('es91', '7'),
('jk96', '8'),
('jk95', '9');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `averate`
-- （参见下面的实际视图）
--
CREATE TABLE `averate` (
`songID` varchar(5)
,`aves` decimal(14,4)
);

-- --------------------------------------------------------

--
-- 表的结构 `follows`
--

CREATE TABLE `follows` (
  `follower` varchar(10) NOT NULL,
  `follows` varchar(10) NOT NULL,
  `createdAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `follows`
--

INSERT INTO `follows` (`follower`, `follows`, `createdAt`) VALUES
('1', 'cs2023', '2023-05-07 00:00:00'),
('ab123', 'cs2023', '2023-02-10 03:22:09'),
('ab123', 'jg6604', '2023-01-10 11:23:40'),
('ab123', 'js12645', '2023-01-11 11:23:49'),
('abr9982', 'cs2023', '2022-02-12 15:43:04'),
('ap2963', 'cs2023', '2023-03-10 16:23:04'),
('cs2023', 'mm13064', '2023-02-10 17:33:04'),
('cs2023', 'pa1363', '2023-02-11 13:33:09'),
('cs2023', 'ql2326', '2022-11-10 12:23:09'),
('cs2023', 'ss9040', '2023-01-10 13:43:04'),
('gs3687', 'cs2023', '2022-12-10 13:23:04'),
('hp2229', 'cs2023', '2022-10-10 17:23:05'),
('jg6604', 'cs2023', '2022-12-10 13:23:04'),
('jg6604', 'js12645', '2022-12-11 11:23:05'),
('js12645', 'cs2023', '2022-10-10 12:23:05'),
('kp2690', 'cs2023', '2022-12-10 13:23:04'),
('sh4480', 'cs2023', '2023-02-10 12:31:04'),
('sk9223', 'cs2023', '2022-02-10 15:22:04'),
('tm3566', 'cs2023', '2022-11-10 13:23:04'),
('tm4033', 'cs2023', '2022-11-10 13:23:05'),
('wc1609', 'cs2023', '2023-02-10 11:23:04');

-- --------------------------------------------------------

--
-- 表的结构 `friend`
--

CREATE TABLE `friend` (
  `user1` varchar(10) NOT NULL,
  `user2` varchar(10) NOT NULL,
  `acceptStatus` varchar(12) DEFAULT NULL,
  `requestSentBy` varchar(10) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `friend`
--

INSERT INTO `friend` (`user1`, `user2`, `acceptStatus`, `requestSentBy`, `createdAt`, `updatedAt`) VALUES
('1', 'ab123', 'Accepted', 'ab123', '2022-01-01 00:00:00', '2022-01-01 00:00:00'),
('ab123', 'cs2023', 'Accepted', 'ab123', '2023-02-10 03:22:49', '2023-02-10 03:22:49'),
('ab123', 'jg6604', 'Accepted', 'ab123', '2023-01-10 11:23:41', '2023-01-10 11:23:41'),
('ab123', 'js12645', 'Accepted', 'ab123', '2023-01-11 11:23:40', '2023-01-11 11:23:40'),
('ab123', 'kp2690', 'Pending', 'ab123', '2023-01-10 11:23:42', '2023-01-10 11:23:42'),
('abr9982', 'cs2023', 'Accepted', 'abr9982', '2022-02-12 15:43:54', '2022-02-18 15:43:54'),
('ap2963', 'cs2023', 'Accepted', 'ap2963', '2023-03-10 16:23:44', '2023-03-10 16:23:44'),
('cs2023', '1', 'Pending', 'cs2023', '2022-01-01 00:00:00', '2022-01-01 00:00:00'),
('cs2023', 'mm13064', 'Pending', 'cs2023', '2023-02-10 17:33:44', '2023-02-10 17:33:44'),
('gs3687', 'cs2023', 'Accepted', 'gs3687', '2022-12-10 13:23:44', '2022-12-10 13:23:44'),
('hp2229', 'cs2023', 'Pending', 'hp2229', '2022-10-10 17:23:45', '2022-10-10 17:23:45'),
('jg6604', 'cs2023', 'Accepted', 'jg6604', '2022-12-10 13:23:44', '2022-12-20 13:23:44'),
('jg6604', 'js12645', 'Accepted', 'jg6604', '2022-12-11 11:23:45', '2022-12-11 11:23:45'),
('js12645', '1', 'Accepted', 'js12645', '2022-01-01 00:00:00', '2022-01-01 00:00:00'),
('js12645', 'cs2023', 'Accepted', 'js12645', '2022-10-10 12:23:45', '2022-10-10 12:23:45'),
('kp2690', 'cs2023', 'Pending', 'kp2690', '2022-12-10 13:23:44', '2022-12-10 13:23:44'),
('pa1363', 'cs2023', 'Pending', 'pa1363', '2023-02-11 13:33:49', '2023-02-11 13:33:49'),
('ql2326', 'cs2023', 'Accepted', 'ql2326', '2022-11-10 12:23:49', '2022-11-10 12:23:49'),
('sh4480', 'ab123', 'Accepted', 'ab123', '2023-01-10 11:23:41', '2023-01-10 11:23:41'),
('sh4480', 'cs2023', 'Accepted', 'sh4480', '2023-02-10 12:31:44', '2023-02-10 12:31:44'),
('sk9223', 'cs2023', 'Accepted', 'sk9223', '2022-02-10 15:22:04', '2022-02-10 15:22:04'),
('ss9040', 'cs2023', 'Accepted', 'ss9040', '2023-01-10 13:43:54', '2023-01-10 13:43:54'),
('tm3566', 'cs2023', 'Not accepted', 'tm3566', '2022-11-10 13:23:44', '2022-11-10 13:23:44'),
('tm4033', 'cs2023', 'Not accepted', 'tm4033', '2022-11-10 13:23:45', '2022-11-10 13:23:45'),
('wc1609', 'cs2023', 'Not accepted', 'wc1609', '2023-02-10 11:23:44', '2023-02-10 11:23:44');

-- --------------------------------------------------------

--
-- 表的结构 `playlist`
--

CREATE TABLE `playlist` (
  `title` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `createDate` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `playlist`
--

INSERT INTO `playlist` (`title`, `username`, `createDate`, `description`) VALUES
('sun', '1', '2023-05-07', 'good play'),
('yes', 'ab123', '2023-05-07', 'son'),
('moon', '1', '2023-05-07', 'favorite songs');

-- --------------------------------------------------------

--
-- 表的结构 `rateAlbum`
--

CREATE TABLE `rateAlbum` (
  `username` varchar(10) NOT NULL,
  `albumID` varchar(5) NOT NULL,
  `stars` int(11) DEFAULT NULL,
  `ratingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rateAlbum`
--

INSERT INTO `rateAlbum` (`username`, `albumID`, `stars`, `ratingDate`) VALUES
('cs2023', '1111', 4, '2023-01-03'),
('cs2023', '1113', 4, '2023-02-03'),
('cs2023', '1114', 4, '2022-12-03'),
('cs2023', '1121', 4, '2023-01-03'),
('cs2023', '1125', 4, '2023-01-03'),
('cs2023', '1128', 5, '2023-01-03'),
('jg6604', '1111', 5, '2023-01-01'),
('jg6604', '1113', 5, '2023-02-01'),
('jg6604', '1114', 5, '2022-12-01'),
('jg6604', '1115', 4, '2023-04-01'),
('jg6604', '1121', 5, '2023-01-01'),
('jg6604', '1125', 5, '2023-01-01'),
('jg6604', '1128', 5, '2023-01-01'),
('js12645', '1111', 5, '2023-01-02'),
('js12645', '1113', 5, '2023-02-02'),
('js12645', '1114', 5, '2022-12-02'),
('js12645', '1115', 3, '2023-04-01'),
('js12645', '1121', 5, '2023-01-02'),
('js12645', '1125', 5, '2023-01-02'),
('js12645', '1128', 5, '2023-01-02');

-- --------------------------------------------------------

--
-- 表的结构 `rateSong`
--

CREATE TABLE `rateSong` (
  `username` varchar(10) NOT NULL,
  `songID` varchar(5) NOT NULL,
  `stars` int(11) DEFAULT NULL,
  `ratingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rateSong`
--

INSERT INTO `rateSong` (`username`, `songID`, `stars`, `ratingDate`) VALUES
('1', '1', 3, '2023-05-07'),
('1', '12', 5, '2023-05-07'),
('abr9982', '1', 5, '2023-02-11'),
('cs2023', '1', 4, '2022-07-23'),
('cs2023', '4', 5, '2022-08-13'),
('cs2023', '9', 5, '2023-01-02'),
('gs3687', '1', 3, '2023-01-27'),
('jg6604', '12', 4, '2023-01-01'),
('jg6604', '2', 4, '2023-01-01'),
('js12645', '12', 5, '2023-03-02'),
('js12645', '16', 5, '2023-02-11'),
('mm13064', '1', 4, '2023-01-21'),
('mm13064', '19', 5, '2023-02-01'),
('sh4480', '14', 3, '2023-02-02'),
('sh4480', '15', 5, '2023-02-02'),
('sk9223', '1', 4, '2022-08-02'),
('sk9223', '12', 5, '2022-08-02'),
('tm3566', '3', 5, '2022-11-12'),
('tm3566', '5', 4, '2022-11-12'),
('tm3566', '8', 1, '2022-11-13'),
('wx682', '8', 1, '2022-12-13');

-- --------------------------------------------------------

--
-- 表的结构 `reviewAlbum`
--

CREATE TABLE `reviewAlbum` (
  `username` varchar(10) NOT NULL,
  `albumID` varchar(5) NOT NULL,
  `reviewText` varchar(100) DEFAULT NULL,
  `reviewDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reviewAlbum`
--

INSERT INTO `reviewAlbum` (`username`, `albumID`, `reviewText`, `reviewDate`) VALUES
('cs2023', '1111', 'good album', '2023-01-03'),
('cs2023', '1113', 'new jeans best album', '2023-02-03'),
('cs2023', '1114', 'good', '2022-12-03'),
('cs2023', '1121', 'good music', '2023-01-03'),
('cs2023', '1125', 'new try good', '2023-01-03'),
('cs2023', '1128', 'best ever', '2023-01-03'),
('jg6604', '1111', 'like song hype boy', '2023-01-01'),
('jg6604', '1113', 'latest and best', '2023-02-01'),
('jg6604', '1114', 'black pink best album', '2022-12-01'),
('jg6604', '1115', 'love jisoo', '2023-04-01'),
('jg6604', '1121', 'ed sheeran best album', '2023-01-01'),
('jg6604', '1125', 'favorite taylor album', '2023-01-01'),
('jg6604', '1128', 'best ever', '2023-01-01'),
('js12645', '1111', 'good', '2023-01-02'),
('js12645', '1113', 'nice album', '2023-02-02'),
('js12645', '1114', 'best album', '2022-12-02'),
('js12645', '1115', 'not as expected', '2023-04-01'),
('js12645', '1121', 'like shivers', '2023-01-02'),
('js12645', '1125', 'best ever', '2023-01-02'),
('js12645', '1128', 'best ever', '2023-01-02'),
('mm13064', '1128', 'that is it', '2023-01-03');

-- --------------------------------------------------------

--
-- 表的结构 `reviewSong`
--

CREATE TABLE `reviewSong` (
  `username` varchar(10) NOT NULL,
  `songID` varchar(5) NOT NULL,
  `reviewText` varchar(100) DEFAULT NULL,
  `reviewDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reviewSong`
--

INSERT INTO `reviewSong` (`username`, `songID`, `reviewText`, `reviewDate`) VALUES
('1', '1', 'dasd', '2023-05-07'),
('ab123', '1', 'I like it', '2023-01-01'),
('abr9982', '1', 'I like the sound', '2023-02-11'),
('cs2023', '1', 'Not bad', '2022-07-23'),
('cs2023', '4', 'Like it', '2022-08-13'),
('cs2023', '9', 'My favorite', '2023-01-02'),
('gs3687', '1', 'just so so', '2023-01-27'),
('jg6604', '12', 'worth the price', '2023-01-01'),
('jg6604', '2', 'good', '2023-01-01'),
('js12645', '12', 'legend', '2023-03-02'),
('js12645', '16', 'the best song', '2023-02-11'),
('mm13064', '1', 'nice', '2023-01-21'),
('mm13064', '19', 'better than else', '2023-02-01'),
('sh4480', '14', 'average', '2023-02-02'),
('sh4480', '15', 'beautiful sound', '2023-02-02'),
('sk9223', '1', 'this song has a story', '2022-08-02'),
('sk9223', '12', 'my favorite song in the list', '2022-08-02'),
('tm3566', '3', 'I play this everyday', '2022-11-12'),
('tm3566', '5', 'Not the best', '2022-11-12'),
('tm3566', '8', 'The worst one', '2022-11-13'),
('wx682', '8', 'just that', '2022-12-13');

-- --------------------------------------------------------

--
-- 表的结构 `song`
--

CREATE TABLE `song` (
  `songID` varchar(5) NOT NULL,
  `title` varchar(20) NOT NULL,
  `releaseDate` date DEFAULT NULL,
  `songURL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `song`
--

INSERT INTO `song` (`songID`, `title`, `releaseDate`, `songURL`) VALUES
('1', 'Let It Be', '1970-05-08', 'https://www.youtube.com/watch?v=QDYfEBY9NM4'),
('10', 'Gone', '2021-03-12', 'https://www.youtube.com/watch?v=K9_VFxzCuQ0'),
('11', 'Hype Boy', '2022-07-23', 'https://www.youtube.com/watch?v=11cta61wi0g'),
('12', 'OMG', '2023-01-02', 'https://www.youtube.com/watch?v=_ZAgIHmHLdc'),
('13', 'Secret Touch', '2021-12-01', 'https://www.youtube.com/watch?v=SAwEraiyf7U'),
('14', 'HOT', '2022-05-27', 'https://www.youtube.com/watch?v=gRnuFC4Ualw'),
('15', 'Love Dive', '2022-04-05', 'https://www.youtube.com/watch?v=Y8JFxS1HlDo'),
('16', 'WEE WOO', '2017-03-21', 'https://www.youtube.com/watch?v=wLfHuClrQdI'),
('17', 'DUMB DUMB', '2021-08-02', 'https://www.youtube.com/watch?v=tg2uF3R_Ozo'),
('18', 'Ditto', '2022-12-19', 'https://www.youtube.com/watch?v=pSUydWEqKwE'),
('19', 'Cookie', '2022-08-01', 'https://www.youtube.com/watch?v=VOmIplFAGeg'),
('2', 'Imagine', '1971-10-11', 'https://www.youtube.com/watch?v=VOgFZfRVaww'),
('20', 'Attention', '2022-07-22', 'https://www.youtube.com/watch?v=js1CtxSY38I'),
('3', 'Hey Jude', '1968-08-26', 'https://www.youtube.com/watch?v=A_MjCqQoLLA'),
('4', 'Blank Space', '2014-11-10', 'https://www.youtube.com/watch?v=e-ORhEE9VVg'),
('5', 'Begin Again', '2012-10-01', 'https://www.youtube.com/watch?v=cMPEd8m79Hw'),
('6', 'Shape of You', '2017-01-06', 'https://www.youtube.com/watch?v=VJ2rlci9PE0'),
('7', 'Shivers', '2021-09-10', 'https://www.youtube.com/watch?v=z2_Lrg6rRks'),
('8', 'Whistle', '2016-08-08', 'https://www.youtube.com/watch?v=dISNgvVpWlo'),
('9', 'FLOWER', '2023-03-31', 'https://www.youtube.com/watch?v=YudHcBIxlYw');

-- --------------------------------------------------------

--
-- 表的结构 `songGenre`
--

CREATE TABLE `songGenre` (
  `songID` varchar(5) NOT NULL,
  `genre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `songGenre`
--

INSERT INTO `songGenre` (`songID`, `genre`) VALUES
('1', 'Jazz'),
('10', 'Enka'),
('11', 'Dance'),
('12', 'Rap'),
('13', 'Hip Pop'),
('14', 'Horrorcore'),
('15', 'Jazz'),
('16', 'Rap'),
('17', 'Rap'),
('18', 'Electronic'),
('19', 'Coldwave'),
('2', 'Hip Pop'),
('20', 'EDM'),
('3', 'Dance'),
('4', 'EDM'),
('5', 'Coldwave'),
('6', 'Speedcore'),
('7', 'Electronic'),
('8', 'Electronic'),
('9', 'Enka');

-- --------------------------------------------------------

--
-- 表的结构 `songInAlbum`
--

CREATE TABLE `songInAlbum` (
  `albumID` varchar(5) NOT NULL,
  `songID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `songInAlbum`
--

INSERT INTO `songInAlbum` (`albumID`, `songID`) VALUES
('1111', '1'),
('1117', '10'),
('1118', '11'),
('1118', '12'),
('1119', '13'),
('1121', '14'),
('1122', '15'),
('1123', '16'),
('1123', '17'),
('1124', '18'),
('1125', '19'),
('1111', '2'),
('1127', '20'),
('1111', '3'),
('1112', '4'),
('1113', '5'),
('1113', '6'),
('1113', '7'),
('1114', '8'),
('1116', '9');

-- --------------------------------------------------------

--
-- 表的结构 `songInList`
--

CREATE TABLE `songInList` (
  `songID` int(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `songInList`
--

INSERT INTO `songInList` (`songID`, `title`, `username`) VALUES
(1, 'sun', '1'),
(2, 'sun', '1'),
(15, 'moon', '1');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `username` varchar(10) NOT NULL,
  `pwd` varchar(15) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `lastlogin` date DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`username`, `pwd`, `fname`, `lname`, `lastlogin`, `nickname`) VALUES
('1', '1', '1', '1', '2022-05-07', '1'),
('ab123', '111', 'Lakshana', 'Kolur', '2023-05-07', 'lk'),
('abr9982', 'abc', 'Alison', 'Reed', '2023-02-17', 'ar'),
('ap2963', '1111', 'Agnes', 'Park', '2023-02-24', 'agnesp'),
('cs2023', '123', 'Phyllis', 'Frankl', '2022-03-01', 'professor'),
('gs3687', 'g12', 'Genesis', 'Smothers', '2023-01-18', 'gsmo'),
('hp2229', 'hp12', 'Hansaem', 'Park', '2023-01-28', 'parkh'),
('jg6604', 's11', 'Jie', 'Gu', '2023-03-31', 'sophie'),
('js12645', 'j126', 'Jipeng', 'Su', '2023-03-31', 'keaton'),
('kp2690', '121', 'Kaiyu', 'Pei', '2023-03-01', 'peipei'),
('mm13064', '222', 'Makendy', 'Midouin', '2023-03-20', 'kendy'),
('pa1363', '333', 'Prabhav', 'Arora', '2023-02-23', 'rora'),
('ql2326', '33', 'Mike', 'Liu', '2023-03-11', 'mikey'),
('sh4480', '44', 'Shihui', 'Huang', '2023-03-30', 'hui'),
('sk9223', '99', 'Srija', 'Konjarla', '2023-03-11', 'ja'),
('ss9040', '223', 'Sonia', 'Susanto', '2023-02-01', 'to'),
('tm3566', '66', 'Thomas', 'Maher', '2023-03-10', 'tom'),
('tm4033', '43', 'Tony', 'Maricic', '2023-02-11', 'tom'),
('wc1609', '09', 'Wanzhao', 'Cheng', '2023-01-01', 'zhao'),
('wc2276', '76', 'Wei', 'Chen', '2023-03-10', 'weiwei'),
('wx682', '82', 'Wei', 'Xia', '2023-02-15', 'summer');

-- --------------------------------------------------------

--
-- 表的结构 `userFanOfArtist`
--

CREATE TABLE `userFanOfArtist` (
  `username` varchar(10) NOT NULL,
  `artistID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userFanOfArtist`
--

INSERT INTO `userFanOfArtist` (`username`, `artistID`) VALUES
('ql2326', 'be01'),
('wx682', 'be01'),
('gs3687', 'dk96'),
('hp2229', 'dk96'),
('1', 'dm05'),
('mm13064', 'ib91'),
('tm4033', 'ib91'),
('pa1363', 'jb94'),
('ss9040', 'jb94'),
('js12645', 'jk95'),
('ab123', 'jk96'),
('ap2963', 'jl40'),
('kp2690', 'jl40'),
('sh4480', 'lm97'),
('wc2276', 'rp97'),
('abr9982', 'ts89'),
('cs2023', 'ts89'),
('jg6604', 'ts89'),
('sk9223', 'ts89'),
('tm3566', 'ts89'),
('wc1609', 'ts89');

-- --------------------------------------------------------

--
-- 视图结构 `averate`
--
DROP TABLE IF EXISTS `averate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `averate`  AS   (select `song`.`songID` AS `songID`,avg(`ratesong`.`stars`) AS `aves` from (`song` join `ratesong` on((`song`.`songID` = `ratesong`.`songID`))) group by `song`.`songID`)  ;

--
-- 转储表的索引
--

--
-- 表的索引 `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumID`);

--
-- 表的索引 `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artistID`);

--
-- 表的索引 `artistPerformsSong`
--
ALTER TABLE `artistPerformsSong`
  ADD PRIMARY KEY (`artistID`,`songID`),
  ADD KEY `songID` (`songID`);

--
-- 表的索引 `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follower`,`follows`),
  ADD KEY `follows` (`follows`);

--
-- 表的索引 `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`user1`,`user2`),
  ADD KEY `user2` (`user2`);

--
-- 表的索引 `rateAlbum`
--
ALTER TABLE `rateAlbum`
  ADD PRIMARY KEY (`username`,`albumID`),
  ADD KEY `albumID` (`albumID`);

--
-- 表的索引 `rateSong`
--
ALTER TABLE `rateSong`
  ADD PRIMARY KEY (`username`,`songID`),
  ADD KEY `songID` (`songID`);

--
-- 表的索引 `reviewAlbum`
--
ALTER TABLE `reviewAlbum`
  ADD PRIMARY KEY (`username`,`albumID`),
  ADD KEY `albumID` (`albumID`);

--
-- 表的索引 `reviewSong`
--
ALTER TABLE `reviewSong`
  ADD PRIMARY KEY (`username`,`songID`),
  ADD KEY `songID` (`songID`);

--
-- 表的索引 `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`songID`);

--
-- 表的索引 `songGenre`
--
ALTER TABLE `songGenre`
  ADD PRIMARY KEY (`songID`,`genre`);

--
-- 表的索引 `songInAlbum`
--
ALTER TABLE `songInAlbum`
  ADD PRIMARY KEY (`albumID`,`songID`),
  ADD KEY `songID` (`songID`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- 表的索引 `userFanOfArtist`
--
ALTER TABLE `userFanOfArtist`
  ADD PRIMARY KEY (`username`,`artistID`),
  ADD KEY `artistID` (`artistID`);

--
-- 限制导出的表
--

--
-- 限制表 `artistPerformsSong`
--
ALTER TABLE `artistPerformsSong`
  ADD CONSTRAINT `artistperformssong_ibfk_1` FOREIGN KEY (`artistID`) REFERENCES `artist` (`artistID`) ON DELETE CASCADE,
  ADD CONSTRAINT `artistperformssong_ibfk_2` FOREIGN KEY (`songID`) REFERENCES `song` (`songID`) ON DELETE CASCADE;

--
-- 限制表 `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`follower`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`follows`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- 限制表 `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`user1`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`user2`) REFERENCES `user` (`username`) ON DELETE CASCADE;

--
-- 限制表 `rateAlbum`
--
ALTER TABLE `rateAlbum`
  ADD CONSTRAINT `ratealbum_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratealbum_ibfk_2` FOREIGN KEY (`albumID`) REFERENCES `album` (`albumID`) ON DELETE CASCADE;

--
-- 限制表 `rateSong`
--
ALTER TABLE `rateSong`
  ADD CONSTRAINT `ratesong_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratesong_ibfk_2` FOREIGN KEY (`songID`) REFERENCES `song` (`songID`) ON DELETE CASCADE;

--
-- 限制表 `reviewAlbum`
--
ALTER TABLE `reviewAlbum`
  ADD CONSTRAINT `reviewalbum_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviewalbum_ibfk_2` FOREIGN KEY (`albumID`) REFERENCES `album` (`albumID`) ON DELETE CASCADE;

--
-- 限制表 `reviewSong`
--
ALTER TABLE `reviewSong`
  ADD CONSTRAINT `reviewsong_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviewsong_ibfk_2` FOREIGN KEY (`songID`) REFERENCES `song` (`songID`) ON DELETE CASCADE;

--
-- 限制表 `songGenre`
--
ALTER TABLE `songGenre`
  ADD CONSTRAINT `songgenre_ibfk_1` FOREIGN KEY (`songID`) REFERENCES `song` (`songID`) ON DELETE CASCADE;

--
-- 限制表 `songInAlbum`
--
ALTER TABLE `songInAlbum`
  ADD CONSTRAINT `songinalbum_ibfk_1` FOREIGN KEY (`albumID`) REFERENCES `album` (`albumID`) ON DELETE CASCADE,
  ADD CONSTRAINT `songinalbum_ibfk_2` FOREIGN KEY (`songID`) REFERENCES `song` (`songID`) ON DELETE CASCADE;

--
-- 限制表 `userFanOfArtist`
--
ALTER TABLE `userFanOfArtist`
  ADD CONSTRAINT `userfanofartist_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `userfanofartist_ibfk_2` FOREIGN KEY (`artistID`) REFERENCES `artist` (`artistID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
