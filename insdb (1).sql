-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 07:38 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `block_id` int(11) NOT NULL,
  `block_by` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `block_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `bkmrk_id` int(11) NOT NULL,
  `bkmrk_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `bkmrk_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`bkmrk_id`, `bkmrk_by`, `post_id`, `bkmrk_time`) VALUES
(1, 3, 1, '1683140987513');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `type` enum('text','image','sticker') COLLATE utf8mb4_bin NOT NULL,
  `text` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `commentSrc` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `comment_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_time` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `con_id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `con_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`con_id`, `user_one`, `user_two`, `con_time`) VALUES
(1, 1, 3, '1683190088637'),
(2, 2, 3, '1684594568495');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `fav_id` int(11) NOT NULL,
  `fav_by` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `fav_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follow_system`
--

CREATE TABLE `follow_system` (
  `follow_id` int(11) NOT NULL,
  `follow_by` int(11) NOT NULL,
  `follow_by_username` varchar(32) NOT NULL,
  `follow_to` int(11) NOT NULL,
  `follow_to_username` varchar(32) NOT NULL,
  `follow_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow_system`
--

INSERT INTO `follow_system` (`follow_id`, `follow_by`, `follow_by_username`, `follow_to`, `follow_to_username`, `follow_time`) VALUES
(1, 2, 'rishabh_sharma', 1, 'tushar_tejan', '1677594574572'),
(2, 3, 'gagandeep', 1, 'tushar_tejan', '1683141007749'),
(3, 1, 'tushar_tejan', 3, 'gagandeep', '1683141441551'),
(4, 1, 'tushar_tejan', 2, 'rishabh_sharma', '1683141443099'),
(5, 2, 'rishabh_sharma', 3, 'gagandeep', '1683141732668'),
(6, 3, 'gagandeep', 2, 'rishabh_sharma', '1683141745123');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(2000) NOT NULL,
  `admin` int(11) NOT NULL,
  `group_type` enum('public','private') NOT NULL DEFAULT 'public',
  `created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `bio`, `admin`, `group_type`, `created`) VALUES
(1, 'GUP SHUP', 'Friends Group ?(Final Year)', 1, 'public', '1683141995109'),
(2, 'GHUP SHUP', 'Friends (Final Year)', 1, 'public', '1683142085831');

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `grp_member_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `member` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `joined_group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`grp_member_id`, `group_id`, `member`, `added_by`, `joined_group`) VALUES
(1, 1, 1, 1, '1683141995118'),
(2, 2, 1, 1, '1683142085843'),
(3, 2, 3, 1, '1683142109699'),
(4, 2, 2, 1, '1683142113565');

-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE `hashtags` (
  `hashtag_id` int(11) NOT NULL,
  `hashtag` varchar(1000) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `hashtag_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hashtags`
--

INSERT INTO `hashtags` (`hashtag_id`, `hashtag`, `post_id`, `user`, `hashtag_time`) VALUES
(12, '#watch', 2, 3, '1683141650360'),
(13, '#Fashion', 2, 3, '1683141650365'),
(14, '#Personality', 2, 3, '1683141650369'),
(15, '#styleHai', 2, 3, '1683141650372'),
(18, '#GeeksForGeeks', 1, 1, '1683141820122'),
(19, '#GeeksForGeeks', 3, 2, '1683141892497');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `like_by` int(11) NOT NULL,
  `like_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `post_id`, `like_by`, `like_time`) VALUES
(1, 1, 3, '1683140986067'),
(2, 1, 1, '1683141179960'),
(3, 2, 3, '1683141657120'),
(4, 2, 1, '1683141671697');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `con_id` int(11) NOT NULL,
  `mssg_by` int(11) NOT NULL,
  `mssg_to` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_bin NOT NULL,
  `type` enum('text','image','sticker') COLLATE utf8mb4_bin NOT NULL,
  `status` enum('read','unread') COLLATE utf8mb4_bin NOT NULL DEFAULT 'unread',
  `message_time` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `con_id`, `mssg_by`, `mssg_to`, `message`, `type`, `status`, `message_time`) VALUES
(1, 1, 1, 3, 'hi\n', 'text', 'read', '1683190099807'),
(2, 2, 2, 3, 'Hello\n🙏', 'text', 'read', '1684594587120'),
(3, 2, 2, 3, 'much wale baba....jai ho\n\n', 'text', 'read', '1684609259842');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notify_id` int(11) NOT NULL,
  `notify_by` int(11) NOT NULL,
  `notify_to` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `type` enum('follow','tag','like','share','shared_your_post','comment','favourites','recommend','add_grp_member','invite','change_admin','new_con','mention_post','mention_comment') NOT NULL,
  `user` int(11) NOT NULL,
  `notify_time` varchar(100) NOT NULL,
  `status` enum('read','unread') NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notify_id`, `notify_by`, `notify_to`, `post_id`, `group_id`, `type`, `user`, `notify_time`, `status`) VALUES
(1, 2, 1, 0, 0, 'follow', 0, '1677594574594', 'read'),
(2, 1, 3, 1, 0, 'mention_post', 0, '1683140914980', 'read'),
(3, 3, 1, 1, 0, 'like', 0, '1683140986082', 'read'),
(4, 3, 1, 0, 0, 'follow', 0, '1683141007789', 'read'),
(5, 1, 3, 0, 0, 'follow', 0, '1683141441588', 'unread'),
(6, 1, 2, 0, 0, 'follow', 0, '1683141443118', 'read'),
(7, 3, 1, 2, 0, 'mention_post', 0, '1683141615397', 'read'),
(8, 3, 2, 2, 0, 'mention_post', 0, '1683141615401', 'read'),
(9, 3, 1, 2, 0, 'tag', 0, '1683141615443', 'read'),
(10, 3, 1, 2, 0, 'share', 0, '1683141662704', 'read'),
(11, 1, 3, 2, 0, 'like', 0, '1683141671715', 'unread'),
(12, 2, 3, 0, 0, 'follow', 0, '1683141732714', 'unread'),
(13, 3, 2, 0, 0, 'follow', 0, '1683141745147', 'read'),
(14, 1, 2, 1, 0, 'share', 0, '1683141824966', 'read'),
(15, 1, 3, 1, 0, 'share', 0, '1683141825515', 'unread'),
(16, 2, 1, 3, 0, 'mention_post', 0, '1683141892501', 'read'),
(17, 2, 3, 3, 0, 'mention_post', 0, '1683141892504', 'unread'),
(18, 2, 1, 3, 0, 'tag', 0, '1683141892562', 'read'),
(19, 2, 3, 3, 0, 'tag', 0, '1683141892568', 'unread'),
(20, 1, 3, 0, 2, 'add_grp_member', 0, '1683142109716', 'unread'),
(21, 1, 2, 0, 2, 'add_grp_member', 0, '1683142113605', 'read'),
(22, 1, 3, 0, 0, 'new_con', 0, '1683190088685', 'unread'),
(23, 2, 3, 0, 0, 'new_con', 0, '1684594568537', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `imgSrc` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `filter` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT 'normal',
  `location` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `type` enum('user','group') COLLATE utf8mb4_bin NOT NULL DEFAULT 'user',
  `group_id` int(11) NOT NULL,
  `post_time` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user`, `description`, `imgSrc`, `filter`, `location`, `type`, `group_id`, `post_time`) VALUES
(1, 1, 'Our University is going to Organize a Coding Competition on GFG\n#GeeksForGeeks😀😀🕧🕧\n', 'instagram_1683140914739.jpg', 'filter-normal', 'Senior Wing 8-12, Punjab 140301, India', 'user', 0, '1683140914739'),
(2, 3, 'See Buddies . I am going to buy this watch.\nhow is it?\n#watch #Fashion #Personality #styleHai\n@tushar_tejan @rishabh_sharma\n😁😁😁', 'instagram_1683141615274.jpg', 'filter-normal', 'Senior Wing 8-12, Punjab 140301, India', 'user', 0, '1683141615274'),
(3, 2, 'Our University is going to Organize a Coding Competition on GFG #GeeksForGeeks😀😀🕧🕧\r\n@tushar_tejan\r\n@gagandeep', 'instagram_1683141892151.jpg', 'filter-aden', 'Block-L, Aura Avenue, Bhago Majra Rd, Punjab 140301, India', 'user', 0, '1683141892151'),
(4, 1, 'Ping tested no fluctuate found !!', 'instagram_1684690598377.jpg', 'filter-normal', '', 'user', 0, '1684690598377');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `post_tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_tag_id`, `post_id`, `user`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `profile_views`
--

CREATE TABLE `profile_views` (
  `view_id` int(11) NOT NULL,
  `view_by` int(11) NOT NULL,
  `view_to` int(11) NOT NULL,
  `view_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile_views`
--

INSERT INTO `profile_views` (`view_id`, `view_by`, `view_to`, `view_time`) VALUES
(1, 2, 1, '1677594576008'),
(2, 1, 2, '1683140433423'),
(3, 3, 1, '1683140972191'),
(4, 1, 3, '1683141059497'),
(5, 3, 1, '1683141424756'),
(6, 1, 3, '1683141437296'),
(7, 2, 1, '1683141724096'),
(8, 2, 3, '1683141731030'),
(9, 3, 2, '1683141743779'),
(10, 1, 3, '1683190026804'),
(11, 1, 2, '1683190117421'),
(12, 2, 1, '1684594544983'),
(13, 1, 3, '1684609092181'),
(14, 2, 3, '1684609213289'),
(15, 1, 3, '1684689712488');

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

CREATE TABLE `recommendations` (
  `recommend_id` int(11) NOT NULL,
  `recommend_by` int(11) NOT NULL,
  `recommend_to` int(11) NOT NULL,
  `recommend_of` int(11) NOT NULL,
  `recommend_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `share_id` int(11) NOT NULL,
  `share_by` int(11) NOT NULL,
  `share_to` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`share_id`, `share_by`, `share_to`, `post_id`, `share_time`) VALUES
(1, 3, 1, 2, '1683141662690'),
(2, 1, 2, 1, '1683141824940'),
(3, 1, 3, 1, '1683141825487');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `user`, `tag`) VALUES
(3, 3, 'GFG');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `surname` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `bio` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `joined` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `email_verified` enum('yes','no') COLLATE utf8mb4_bin NOT NULL DEFAULT 'no',
  `account_type` enum('public','private') COLLATE utf8mb4_bin NOT NULL DEFAULT 'public',
  `instagram` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `twitter` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `facebook` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `github` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `website` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `isOnline` enum('yes','no') COLLATE utf8mb4_bin NOT NULL DEFAULT 'no',
  `lastOnline` varchar(100) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `surname`, `email`, `password`, `bio`, `joined`, `email_verified`, `account_type`, `instagram`, `twitter`, `facebook`, `github`, `website`, `phone`, `isOnline`, `lastOnline`) VALUES
(1, 'tushar_tejan', 'tushar', 'tejan', '19bcs2814@gmail.com', '$2a$10$gfzrgaZi4BeJpFsda.svt.SMCId6dtiOl7I54SeP3mL8.qq7CIHw2', 'CSE Student\nCU\'23', '1677594273716', 'no', 'private', 'https://linkedin.com/in/ tushar-tejan-261a27190', 'twitter.com/tushar_tejan', 'facebook.com/tushar.tejan', 'guthub.com/tushartejan', '', '874305083', 'yes', '1683142124628'),
(2, 'rishabh_sharma', 'rishabh', 'sharma', '19bcs1381@gmail.com', '$2a$10$MfHyBS7XEuwQVsJUE5eRPuTxFrmP/.Mpb8jMIdFF6mC5OaHMC5pOK', 'CSE Student\nCU\"2023', '1677594560082', 'no', 'public', '', '', '', '', '', '', 'yes', '1684609032096'),
(3, 'gagandeep', 'gagandeep', 'ingh', '19bcs2810@gmail.com', '$2a$10$oqT6NtKLQ6SrGxmWPwHdluH6cA.daz3WfDNy.rCsItBqpIO66JNhe', 'CSE Student\nCU\'23', '1677594621506', 'no', 'public', 'www.linkedn.com/gagandeepsingh', 'twitter.com/gagandeep', 'www.facebook.com/gagandeepsingh', 'giithub.com/singh19gagan', 'www.instagram.com/singh19gagan', '8484883831', 'no', '1684689734648');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`bkmrk_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`con_id`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indexes for table `follow_system`
--
ALTER TABLE `follow_system`
  ADD PRIMARY KEY (`follow_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`grp_member_id`);

--
-- Indexes for table `hashtags`
--
ALTER TABLE `hashtags`
  ADD PRIMARY KEY (`hashtag_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`post_tag_id`);

--
-- Indexes for table `profile_views`
--
ALTER TABLE `profile_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`recommend_id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`share_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `bkmrk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow_system`
--
ALTER TABLE `follow_system`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `grp_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hashtags`
--
ALTER TABLE `hashtags`
  MODIFY `hashtag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notify_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `post_tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile_views`
--
ALTER TABLE `profile_views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `recommend_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
