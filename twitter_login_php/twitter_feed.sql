-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2017 at 01:56 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter_feed`
--

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `user_id` varchar(100) NOT NULL,
  `follower_id` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `user_stamp` varchar(100) NOT NULL,
  `follower_name` varchar(100) NOT NULL,
  `follower_pic` varchar(100) NOT NULL,
  `follower_handle` varchar(100) NOT NULL,
  `st_text` varchar(500) NOT NULL,
  `created` varchar(200) NOT NULL,
  `t_val` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`user_id`, `follower_id`, `link`, `user_stamp`, `follower_name`, `follower_pic`, `follower_handle`, `st_text`, `created`, `t_val`) VALUES
('', '2367911', 'https://t.co/1VU1wesPbA', '03382208d6fc259259f2f4b9902c7cd1', 'MTV', 'http://pbs.twimg.com/profile_images/889908003645861888/qEtMRwno_normal.jpg', 'MTV', 'Congrats on the release of your new album, @FifthHarmony. See you on Sunday at the #VMAs ðŸ˜˜ https://t.co/1VU1wesPbA', 'Fri Aug 25 19:45:34 +0000 2017', 22967134),
('619935292', '2367911', 'https://t.co/MSFlhG5Ygq', '04785baf7e8a93bafc99041f7d25dd41', 'MTV', 'http://pbs.twimg.com/profile_images/889908003645861888/qEtMRwno_normal.jpg', 'MTV', 'Just got a little sneak peek of @Logic301''s #VMA rehearsal and wow!!! You don''t wanna miss it on Sunday at 8/7c ðŸ”¥ |â€¦ https://t.co/MSFlhG5Ygq', 'Fri Aug 25 19:17:17 +0000 2017', 22965437),
('587447163', '14706299', 'https://t.co/KvcCX715bT', '054806c0150afb4e7e46fd431be4fdfa', 'The Linux Foundation', 'http://pbs.twimg.com/profile_images/701834470807064576/Qkr8CTpm_normal.png', 'linuxfoundation', 'Update cloud-native skills with @CloudFoundry training and certification to deliver world-class apps w/ this courseâ€¦ https://t.co/KvcCX715bT', 'Fri Aug 25 19:11:02 +0000 2017', 22965062),
('619935292', '97865628', 'https://t.co/mmj3xxzoXN', '0f03f5eefd81790db5b4291f1f544a9c', 'Farhan Akhtar', 'http://pbs.twimg.com/profile_images/890214840979030016/de8iZa9o_normal.jpg', 'FarOutAkhtar', '#RamRahimVerdict #Haryana https://t.co/mmj3xxzoXN', 'Fri Aug 25 14:02:34 +0000 2017', 22946554),
('619935292', '101311381', 'https://t.co/JmQUT6PyRa', '0f2d665469cb29d3695016a4f02d01c3', 'Shah Rukh Khan', 'http://pbs.twimg.com/profile_images/661679664/keep_it_onn_normal.jpg', 'iamsrk', '@dmbravo46 @Bazmccullum  #TKR WOW! I think itâ€™s time I join u guys for the biggest party in sports. Well done boyz https://t.co/JmQUT6PyRa', 'Thu Aug 24 07:00:13 +0000 2017', 22834813),
('', '783214', 'https://t.co/2QQLcDQwO5', '1080898d8942aab67fd290fc1dca5613', 'Twitter', 'http://pbs.twimg.com/profile_images/875087697177567232/Qfy0kRIP_normal.jpg', 'Twitter', 'RT @TwitterGov: Follow this list of emergency management accounts for live updates as they track Hurricane #Harvey. https://t.co/2QQLcDQwO5', 'Fri Aug 25 20:30:30 +0000 2017', 22969830),
('587447163', '18080585', 'https://t.co/9wXFv0lgjd', '1304cd63023a7399ac561592c0893ec7', 'MongoDB', 'http://pbs.twimg.com/profile_images/750403034178478081/EPrK3ci2_normal.jpg', 'MongoDB', 'Using MongoDB with @Slack and @Twilio has never been easier w/ Stitch. Check out our newest tutorial. https://t.co/9wXFv0lgjd', 'Fri Aug 25 19:51:24 +0000 2017', 22967484),
('587447163', '828920447081263105', 'https://t.co/RYgStOejdu', '147dd6a6bfcfb1ad1e28c5ccf4345d40', 'Kshitiz Gupta', 'http://pbs.twimg.com/profile_images/834718014310346752/RnWSZIqn_normal.jpg', 'ixshitiz', 'Absence of Scanner, long waiting queues- just to get document scanned, employee absenteeism and annoying officials.â€¦ https://t.co/RYgStOejdu', 'Wed Jul 05 08:41:53 +0000 2017', 18607313),
('', '19373710', 'https://t.co/ofx7ykSQ3K', '16109f196b7817401af9d5ed078392bf', 'LINKIN PARK', 'http://pbs.twimg.com/profile_images/888168873958096896/g-XSGgl3_normal.jpg', 'linkinpark', 'https://t.co/ofx7ykSQ3K', 'Tue Aug 22 19:00:09 +0000 2017', 22705209),
('619935292', '2367911', 'https://t.co/B93iBzPvhJ', '1bcf616fba66a3fc1f8cbe964aff2521', 'MTV', 'http://pbs.twimg.com/profile_images/889908003645861888/qEtMRwno_normal.jpg', 'MTV', 'RT @30SECONDSTOMARS: Brace for impact. #MarsIsComing to the 2017 #VMA, live Sunday AUG 27, 8|7c. @MTV https://t.co/B93iBzPvhJ', 'Fri Aug 25 19:32:08 +0000 2017', 22966328),
('587447163', '3187417639', 'https://t.co/kXL3hPuRRc', '216e2769343d245c46ebd9ee316e00d9', 'Meghna Jain', 'http://pbs.twimg.com/profile_images/674588108403249152/PRyJPgVF_normal.jpg', 'Meghnatweet', 'RT @DenverForMen: Behind The Essence | Shah Rukh Khan ''s Deodorant - Everyone should smell well!: https://t.co/kXL3hPuRRc via @YouTube', 'Wed Aug 23 06:24:47 +0000 2017', 22746287),
('587447163', '368202586', 'https://t.co/Xc9XzwqW9W', '220318871d40ce9cb7995a717255a002', 'Samsung India', 'http://pbs.twimg.com/profile_images/679637611695091712/thsvpUlJ_normal.png', 'Samsung_IN', 'Donâ€™t miss out on this opportunity. If youâ€™ve got what it takes to go â€˜beyond ordinaryâ€™, get ready to register!â€¦ https://t.co/Xc9XzwqW9W', 'Sat Aug 26 07:40:42 +0000 2017', 23010042),
('587447163', '177941012', 'https://t.co/F2KCqirQ2q', '2293ee523ca7b7982629c2dcfa37da1d', 'Audi Owners Club', 'http://pbs.twimg.com/profile_images/3178746653/79f302edcd781bc5d71588844241fd13_normal.png', 'AudiOwnersClub', 'Would you like to show your car on the Audi Owners Club stand at Audi''s in the Park on the 13th August @ Deene... https://t.co/F2KCqirQ2q', 'Thu Jul 20 11:09:45 +0000 2017', 19912185),
('587447163', '71201743', 'https://t.co/hIpmpIbAZm', '23f6a59c960d300d6efa059a5b25c767', 'Virat Kohli', 'http://pbs.twimg.com/profile_images/789817267567472640/BlpcUEvx_normal.jpg', 'imVkohli', 'Workout for today, done! âœ”ï¸ðŸ’ª https://t.co/hIpmpIbAZm', 'Sat Aug 26 07:06:49 +0000 2017', 23008009),
('619935292', '145125358', 'https://t.co/UjnNSvXuuO', '34f337db5b0f3f0d1ecdaa5b135af49b', 'Amitabh Bachchan', 'http://pbs.twimg.com/profile_images/768780297437450240/FJBOm5n8_normal.jpg', 'SrBachchan', 'T 2527 -'' Doubt kills more dreams than failure ever will. ''~ Ef\n''à¤…à¤¸à¤«à¤²à¤¤à¤¾'' à¤†à¤ªà¤•à¥‡ à¤¸à¤ªà¤¨à¥‹à¤‚ à¤•à¤¾ à¤…à¤‚à¤¤ à¤‡à¤¤à¤¨à¤¾ à¤¨à¤¹à¥€à¤‚ à¤•à¤°à¥‡à¤—à¥€ , à¤œà¤¿à¤¤à¤¨à¤¾â€¦ https://t.co/UjnNSvXuuO', 'Fri Aug 25 19:18:50 +0000 2017', 22965530),
('587447163', '617155406', 'https://t.co/PiTJmgKoDK', '3637231eebba04392425c37ad030d3d3', 'Steven Wilson', 'http://pbs.twimg.com/profile_images/861878255229554689/bCE4HLNS_normal.jpg', 'StevenWilsonHQ', 'To the Bone has landed as the highest new entry at number 3 in the official UK album charts this week, and at numbâ€¦â€¦ https://t.co/PiTJmgKoDK', 'Fri Aug 25 20:01:32 +0000 2017', 22968092),
('', '2367911', 'https://t.co/4GjmpfX0Lk', '38b482546beab162bca6d5cc8aa927ea', 'MTV', 'http://pbs.twimg.com/profile_images/889908003645861888/qEtMRwno_normal.jpg', 'MTV', '#VMA performer @ddlovato talks to @GabrielleWilson about some of the influences behind her upcoming album. https://t.co/4GjmpfX0Lk', 'Fri Aug 25 20:16:27 +0000 2017', 22968987),
('587447163', '2238741865', 'https://t.co/mcfMH5zcsoâ€¦', '39283c8127dcf0603bc8fe915ff3a3d5', 'Neevov', 'http://pbs.twimg.com/profile_images/426283729015697408/BeDe2vnH_normal.jpeg', 'Neevov', 'Women''s #Hulkbuster Power T-Shirt from #Marvel available at Neevov. Shop now: https://t.co/mcfMH5zcsoâ€¦ https://t.co/2iK7Mc3CWg', 'Fri Aug 25 10:53:35 +0000 2017', 22935215),
('619935292', '783214', 'https://t.co/GNYHT6bpen', '3bf9177c875362064b4b82c390dfeb16', 'Twitter', 'http://pbs.twimg.com/profile_images/875087697177567232/Qfy0kRIP_normal.jpg', 'Twitter', '@leahpamelabanks  https://t.co/GNYHT6bpen', 'Fri Aug 25 19:49:26 +0000 2017', 22967366),
('587447163', '11348282', 'https://t.co/aZC1tJJ9Vz', '3e661a04b75f855ff47f27bd3fdc6829', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', 'Want to see amazing images from the universe, our home planet &amp; more? Follow us on @Instagram:â€¦ https://t.co/aZC1tJJ9Vz', 'Fri Aug 25 19:46:46 +0000 2017', 22967206),
('587447163', '24705126', 'https://t.co/qH2rVyPnRP', '3f7c1e2949160bb8cc60cfeb5ab7d6ff', 'Shashi Tharoor', 'http://pbs.twimg.com/profile_images/669857065938976768/OGSRagoY_normal.png', 'ShashiTharoor', 'RT @firstpost: #Haryana government allowed #DeraSachaSauda mobilisation despite warnings by courts and the media\nhttps://t.co/qH2rVyPnRP', 'Sat Aug 26 04:00:00 +0000 2017', 22996800),
('587447163', '18839785', 'https://t.co/uSD3mF8BsJ', '40295c2e3157851bda9e63fa35b3b3c9', 'Narendra Modi', 'http://pbs.twimg.com/profile_images/718314968102367232/ypY1GPCQ_normal.jpg', 'narendramodi', '#MannKiBaat will take place tomorrow at 11 AM. Do tune in. https://t.co/uSD3mF8BsJ', 'Sat Aug 26 11:09:55 +0000 2017', 23022595),
('619935292', '19373710', 'https://t.co/ofx7ykSQ3K', '420f643de2baceb1b21132edbd9e64c2', 'LINKIN PARK', 'http://pbs.twimg.com/profile_images/888168873958096896/g-XSGgl3_normal.jpg', 'linkinpark', 'https://t.co/ofx7ykSQ3K', 'Tue Aug 22 19:00:09 +0000 2017', 22705209),
('587447163', '900741768932507648', 'https://t.co/KhQy4lByNs', '46047f5de8571f75b5d5445cb0f64d12', 'New Car Release', 'http://pbs.twimg.com/profile_images/900745120194060289/nQI9V7Dd_normal.jpg', 'newautocarnews', 'New post (2018 Cadillac Escalade) has been published on Car Preview and Rumors - https://t.co/KhQy4lByNs https://t.co/6YhgVYXw4z', 'Sat Aug 26 11:48:52 +0000 2017', 23024932),
('587447163', '334430754', 'https://t.co/FliJ4IUJDV', '47d20acbf446f9831b3e64f870a03bde', 'Mary Kom', 'http://pbs.twimg.com/profile_images/775026096303665152/Jg9_OOxZ_normal.jpg', 'MangteC', 'CONDOLENCE.Shri Rishang Keishing(96)the former CM of Manipur n MP Rajya Sabha, a man of integrity, successful n proâ€¦ https://t.co/FliJ4IUJDV', 'Thu Aug 24 10:21:09 +0000 2017', 22846869),
('619935292', '783214', 'https://t.co/2QQLcDQwO5', '499ec9b91930aeb35a9f23030bcdd9fc', 'Twitter', 'http://pbs.twimg.com/profile_images/875087697177567232/Qfy0kRIP_normal.jpg', 'Twitter', 'RT @TwitterGov: Follow this list of emergency management accounts for live updates as they track Hurricane #Harvey. https://t.co/2QQLcDQwO5', 'Fri Aug 25 20:30:30 +0000 2017', 22969830),
('587447163', '46134530', 'https://t.co/tEmDkld6Yi', '49f080c2144960637f734f482d23eafd', 'Samsung Mobile India', 'http://pbs.twimg.com/profile_images/721949060807065600/HJbgB81X_normal.jpg', 'SamsungMobileIN', 'See things differently. Experience amazing new worlds with the #GearVR and #GalaxyS8. https://t.co/tEmDkld6Yi https://t.co/aMhX9W2zZG', 'Fri Aug 25 15:03:51 +0000 2017', 22950231),
('619935292', '11348282', 'https://t.co', '4c939021f74fd443373b1e4684fdb191', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', 'RT @Space_Station: .@Astro2fish orbited over Hurricane #Harvey2017 and photographed the storm bearing down on the Texas coast. https://t.coâ€¦', 'Fri Aug 25 20:31:44 +0000 2017', 22969904),
('587447163', '2805613570', 'https://t.co/vtd2zFjkQX', '50417c3fecd0fc7caec6d8948e2b65dd', 'higg[Sb]oson', 'http://pbs.twimg.com/profile_images/575746822104293376/b7P0Nt8X_normal.jpeg', 'higgsboson85', 'RT @FreestyIeRaps: This vine will never get old\n https://t.co/vtd2zFjkQX', 'Mon Aug 07 07:11:21 +0000 2017', 21366681),
('587447163', '55520719', 'https://t.co/hmWFWKXQQ3', '51f8c3504ef06156879af55fdf8e3a18', 'Shreya Ghoshal', 'http://pbs.twimg.com/profile_images/887572883228303361/ZYn3oBHr_normal.jpg', 'shreyaghoshal', 'It begins today!!\n#ShreyaghoshalLiveWithSymphony https://t.co/hmWFWKXQQ3', 'Fri Aug 25 15:02:42 +0000 2017', 22950162),
('587447163', '576243743', 'https://t.co/EmfwzYGx2U', '5229063a3aaff8ae28e4c43290170804', 'Car News', 'http://pbs.twimg.com/profile_images/2232247188/Afbeelding_32_normal.png', 'newslocker_car', 'Audi announces new two-digit naming system #CarNews https://t.co/EmfwzYGx2U', 'Fri Aug 25 21:25:22 +0000 2017', 22973122),
('', '783214', 'https://t.co/GNYHT6bpen', '542c2e4acaf09e585ca6ebfeb6926705', 'Twitter', 'http://pbs.twimg.com/profile_images/875087697177567232/Qfy0kRIP_normal.jpg', 'Twitter', '@leahpamelabanks  https://t.co/GNYHT6bpen', 'Fri Aug 25 19:49:26 +0000 2017', 22967366),
('', '101311381', 'https://t.co/JmQUT6PyRa', '5621512cc41e788fc5d7869bfb489a43', 'Shah Rukh Khan', 'http://pbs.twimg.com/profile_images/661679664/keep_it_onn_normal.jpg', 'iamsrk', '@dmbravo46 @Bazmccullum  #TKR WOW! I think itâ€™s time I join u guys for the biggest party in sports. Well done boyz https://t.co/JmQUT6PyRa', 'Thu Aug 24 07:00:13 +0000 2017', 22834813),
('619935292', '2367911', 'https://t.co/4GjmpfX0Lk', '5a727259c2d04d613f937e0c87ea5c4b', 'MTV', 'http://pbs.twimg.com/profile_images/889908003645861888/qEtMRwno_normal.jpg', 'MTV', '#VMA performer @ddlovato talks to @GabrielleWilson about some of the influences behind her upcoming album. https://t.co/4GjmpfX0Lk', 'Fri Aug 25 20:16:27 +0000 2017', 22968987),
('587447163', '576243743', 'https://t.co/YRSNRVULoQ', '5cdbea0556d84e369e59c48f08304ad5', 'Car News', 'http://pbs.twimg.com/profile_images/2232247188/Afbeelding_32_normal.png', 'newslocker_car', 'Daimler Said to Consider 3-Way Split (8/24/17) #CarNews https://t.co/YRSNRVULoQ', 'Thu Aug 24 20:01:02 +0000 2017', 22881662),
('', '11348282', 'https://t.co/aZC1tJJ9Vz', '64e410addf75fef59f7f335bf27e33bd', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', 'Want to see amazing images from the universe, our home planet &amp; more? Follow us on @Instagram:â€¦ https://t.co/aZC1tJJ9Vz', 'Fri Aug 25 19:46:46 +0000 2017', 22967206),
('', '103770785', 'https://t.co/zAlcqalqcZ', '689e44959b0b7c56ef28c60d474d131f', 'Twitter India', 'http://pbs.twimg.com/profile_images/875098522390896640/Q4Gn9E1w_normal.jpg', 'TwitterIndia', 'And the most Tweeted movie hashtag in India is @yrf film #Sultan! #hashtag10 https://t.co/zAlcqalqcZ', 'Wed Aug 23 09:51:01 +0000 2017', 22758661),
('587447163', '43845681', 'https://t.co/5dfNiG2QVQ', '6bb40bb879cb50b6b9c603dc2e7d10ca', 'Sony India', 'http://pbs.twimg.com/profile_images/418215699501170688/4A8LUU7t_normal.png', 'sony_india', 'Swift, accurate and reliable â€“ 3 words that describe #SonyAlpha 9. Camera with a humongous 693 AF Points coverage:â€¦ https://t.co/5dfNiG2QVQ', 'Sat Aug 26 05:42:42 +0000 2017', 23002962),
('', '56631494', 'https://t.co/fSJZiCVnio', '6bcf03771a964073880e925a3921d5d9', 'Shahid Kapoor', 'http://pbs.twimg.com/profile_images/898898110017150977/kwZ83Kk__normal.jpg', 'shahidkapoor', 'Just about one. ðŸ‘ðŸ‘ https://t.co/fSJZiCVnio', 'Fri Aug 25 10:00:32 +0000 2017', 22932032),
('587447163', '46134530', 'https://t.co/R7SgBXgr5L', '6d04a6b42cc2bac8d5fe88a5f7cf9fef', 'Samsung Mobile India', 'http://pbs.twimg.com/profile_images/721949060807065600/HJbgB81X_normal.jpg', 'SamsungMobileIN', 'Capture your low light adventures with #GalaxyOnMax &amp; enjoy up to 180GB of extra Jio 4G data with Jio Galaxy Club.â€¦ https://t.co/R7SgBXgr5L', 'Sat Aug 26 09:30:01 +0000 2017', 23016601),
('619935292', '2367911', 'https://t.co/1VU1wesPbA', '707e3a91238a5c6e54ed5c91b77c4fce', 'MTV', 'http://pbs.twimg.com/profile_images/889908003645861888/qEtMRwno_normal.jpg', 'MTV', 'Congrats on the release of your new album, @FifthHarmony. See you on Sunday at the #VMAs ðŸ˜˜ https://t.co/1VU1wesPbA', 'Fri Aug 25 19:45:34 +0000 2017', 22967134),
('587447163', '2238741865', 'https://t.co/pEOgDdvyrm', '70c0244715003b5f88d724a73f41a83b', 'Neevov', 'http://pbs.twimg.com/profile_images/426283729015697408/BeDe2vnH_normal.jpeg', 'Neevov', 'If you are a big fan of #IronMan. Get yourself the black printed Iron Man Logo T-Shirt. Shop nowâ€¦ https://t.co/pEOgDdvyrm', 'Sat Aug 26 08:05:24 +0000 2017', 23011524),
('', '97865628', 'https://t.co/mmj3xxzoXN', '72c7cdd1b19eaa144833a21f397bc940', 'Farhan Akhtar', 'http://pbs.twimg.com/profile_images/890214840979030016/de8iZa9o_normal.jpg', 'FarOutAkhtar', '#RamRahimVerdict #Haryana https://t.co/mmj3xxzoXN', 'Fri Aug 25 14:02:34 +0000 2017', 22946554),
('', '145125358', 'https://t.co/UjnNSvXuuO', '72dd4bec8d34c355477e36e0b718ad8c', 'Amitabh Bachchan', 'http://pbs.twimg.com/profile_images/768780297437450240/FJBOm5n8_normal.jpg', 'SrBachchan', 'T 2527 -'' Doubt kills more dreams than failure ever will. ''~ Ef\n''à¤…à¤¸à¤«à¤²à¤¤à¤¾'' à¤†à¤ªà¤•à¥‡ à¤¸à¤ªà¤¨à¥‹à¤‚ à¤•à¤¾ à¤…à¤‚à¤¤ à¤‡à¤¤à¤¨à¤¾ à¤¨à¤¹à¥€à¤‚ à¤•à¤°à¥‡à¤—à¥€ , à¤œà¤¿à¤¤à¤¨à¤¾â€¦ https://t.co/UjnNSvXuuO', 'Fri Aug 25 19:18:50 +0000 2017', 22965530),
('587447163', '11348282', 'https://t.co/AGyDxbUZuP', '7c36fa81dce3ca71acd9e19f70225778', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', 'Hurricane #Harvey has been upgraded to a Category 4 hurricane, seen here by @NASAEarth satellites. Details:â€¦ https://t.co/AGyDxbUZuP', 'Sat Aug 26 02:09:01 +0000 2017', 22990141),
('587447163', '861182414336524288', 'https://t.co/M5cUqrFKaE', '7ec038cfb3621ee8905eb7c3c3cb0808', 'Sashakt Keshri', 'http://pbs.twimg.com/profile_images/861184202863259648/6JzrKvYV_normal.jpg', 'SashaktKeshri', '20170818 221142 edited: https://t.co/M5cUqrFKaE via @YouTube', 'Fri Aug 18 17:06:38 +0000 2017', 22352798),
('619935292', '56631494', 'https://t.co/fSJZiCVnio', '8386fe5025f34fa66378e9aa71a06336', 'Shahid Kapoor', 'http://pbs.twimg.com/profile_images/898898110017150977/kwZ83Kk__normal.jpg', 'shahidkapoor', 'Just about one. ðŸ‘ðŸ‘ https://t.co/fSJZiCVnio', 'Fri Aug 25 10:00:32 +0000 2017', 22932032),
('587447163', '26512444', 'https://t.co/qfZHuUevXb', '83a1ba20d71280f2ec911b5b993c69bd', 'Jodi Stout', 'http://pbs.twimg.com/profile_images/378800000448042488/c688062ed8da5ae2773b6cd92776702c_normal.jpeg', 'jodistout', 'New #neuroscience reveals 4 rituals that will make you #happy https://t.co/qfZHuUevXb', 'Thu Aug 10 12:37:23 +0000 2017', 21645443),
('587447163', '900741768932507648', 'https://t.co/BTEwAc7Wl2', '8444aaa7767348fe4ece85bd6e2f78e5', 'New Car Release', 'http://pbs.twimg.com/profile_images/900745120194060289/nQI9V7Dd_normal.jpg', 'newautocarnews', 'New post (2018 Mitsubishi ASX) has been published on MootorAuthority - https://t.co/BTEwAc7Wl2 https://t.co/zZg28zQaoU', 'Fri Aug 25 18:49:55 +0000 2017', 22963795),
('619935292', '79708561', 'https://t.co/U6hER9EcpL', '85aba38086ce60484d7dc2184b868481', 'Jacqueline Fernandez', 'http://pbs.twimg.com/profile_images/886130988627116032/au_5leOa_normal.jpg', 'Asli_Jacqueline', 'Bliss ðŸŒˆâ­ï¸ðŸ’œ #agentleman out today!!!! https://t.co/U6hER9EcpL https://t.co/0buSr72DeP', 'Fri Aug 25 08:14:58 +0000 2017', 22925698),
('587447163', '24705126', 'https://t.co/PHySjdLzn8', '8ab18ce24438c91d1234a060624314df', 'Shashi Tharoor', 'http://pbs.twimg.com/profile_images/669857065938976768/OGSRagoY_normal.png', 'ShashiTharoor', 'My son @kanishktharoor argues that economic centrism hasn''t worked &amp;parties like @INCIndia must shift clearly left: https://t.co/PHySjdLzn8', 'Fri Aug 25 18:10:22 +0000 2017', 22961422),
('', '79708561', 'https://t.co/U6hER9EcpL', '8b707d384c96fad06447954cbed5cf93', 'Jacqueline Fernandez', 'http://pbs.twimg.com/profile_images/886130988627116032/au_5leOa_normal.jpg', 'Asli_Jacqueline', 'Bliss ðŸŒˆâ­ï¸ðŸ’œ #agentleman out today!!!! https://t.co/U6hER9EcpL https://t.co/0buSr72DeP', 'Fri Aug 25 08:14:58 +0000 2017', 22925698),
('587447163', '14706299', 'https://t.co/04CaOkx8ki', '8d94614055932f7d387ea34979abf615', 'The Linux Foundation', 'http://pbs.twimg.com/profile_images/701834470807064576/Qkr8CTpm_normal.png', 'linuxfoundation', '#learnLinux, get a FREE Chromebook: https://t.co/04CaOkx8ki https://t.co/u5CufudY3r', 'Sat Aug 26 10:59:02 +0000 2017', 23021942),
('619935292', '11348282', 'https://t.co/aZC1tJJ9Vz', '9169bb7039e7b9a3cfd5b06373094299', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', 'Want to see amazing images from the universe, our home planet &amp; more? Follow us on @Instagram:â€¦ https://t.co/aZC1tJJ9Vz', 'Fri Aug 25 19:46:46 +0000 2017', 22967206),
('587447163', '2493545659', 'https://t.co/241a4cPEJx', '91dc234fbc173725f1b92371a8ca4546', 'KronosVegaYT', 'http://pbs.twimg.com/profile_images/466333028210327552/IZVYANW0_normal.jpeg', 'KronosVega', 'I added a video to a @YouTube playlist https://t.co/241a4cPEJx iPad Pro 10.5 (2017) - 5 THINGS You Didn''t Know!', 'Fri Aug 11 14:49:02 +0000 2017', 21739742),
('587447163', '43845681', 'https://t.co/zGFhmeJ4n9', '94f71c10e55623ede9312215ddf61d0f', 'Sony India', 'http://pbs.twimg.com/profile_images/418215699501170688/4A8LUU7t_normal.png', 'sony_india', 'Bring your subject closer with 50X Optical Zoom, capture each shot with precision on your #SonyCybershot HX400:â€¦ https://t.co/zGFhmeJ4n9', 'Fri Aug 25 13:08:34 +0000 2017', 22943314),
('587447163', '3061752374', 'https://t.co/ffMDsftkaG', '989b37cfebb4c3bf730099dd3262b4e2', 'Amber Goel', 'http://pbs.twimg.com/profile_images/573192704814784512/QN42q0BN_normal.jpeg', 'goel_amber', 'Boom! OnePlus Dash for Diwali Level 1 ''Bloom''! #OnePlusDiwaliDash https://t.co/ffMDsftkaG', 'Wed Oct 26 10:08:19 +0000 2016', 28202899),
('587447163', '34197952', 'https://t.co/DwaxhqzAIB', '9e18841382606893f17b03c00bfb8559', 'anand mahindra', 'http://pbs.twimg.com/profile_images/619739923654967296/b86Fvz9C_normal.jpg', 'anandmahindra', 'Two days, two cities, two panel discussions, two book/document launches. Think I''ve paid my dues for some downtimeâ€¦ https://t.co/DwaxhqzAIB', 'Sat Aug 26 07:02:29 +0000 2017', 23007749),
('587447163', '82283904', 'https://t.co/N9Ky0WPkSU', '9f9a18400c19f21a412f6123c3874c74', 'RIM', 'http://pbs.twimg.com/profile_images/873819310015340546/eFtZSX6q_normal.jpg', 'rimbasma', 'â¤ï¸ https://t.co/N9Ky0WPkSU', 'Thu Aug 10 21:14:14 +0000 2017', 21676454),
('587447163', '535522571', 'https://t.co/jYykD6s4mO', 'a3cc9bf7f403e974fd9321514cc6fc42', 'dbAND', 'http://pbs.twimg.com/profile_images/822944983175090176/b_T__QUX_normal.png', 'pudiaband', 'I liked a @YouTube video https://t.co/jYykD6s4mO Ball Pen Making Machine @19,400/- 9824483579', 'Thu Aug 24 07:50:59 +0000 2017', 22837859),
('619935292', '11348282', 'https://t.co/FWgY7EO7e3', 'a48e7dcbe12c3757c02a994dfa396458', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', '.@NASAEarth satellites watch from above as Hurricane #Harvey2017 approaches Texas. Get the details:â€¦ https://t.co/FWgY7EO7e3', 'Fri Aug 25 18:58:00 +0000 2017', 22964280),
('587447163', '34743251', 'https://t.co/fZTPmwsnOz', 'a6c087ce3e561e8d09b39cba0f5f1da3', 'SpaceX', 'http://pbs.twimg.com/profile_images/671865418701606912/HECw8AzK_normal.jpg', 'SpaceX', 'RT @elonmusk: Falcon 9 boost stage on droneship Just Read the Instructions https://t.co/fZTPmwsnOz', 'Fri Aug 25 17:56:46 +0000 2017', 22960606),
('587447163', '55520719', 'https://t.co/zkGus87Z1n', 'a7eaab7ba10b7d51f15fcbda1a3f6150', 'Shreya Ghoshal', 'http://pbs.twimg.com/profile_images/887572883228303361/ZYn3oBHr_normal.jpg', 'shreyaghoshal', 'RT @Afee_SG: Akhiyon ko rehne de, Akhiyon k pas pasâ™¥ï¸ one of my most fav @shreyaghoshal thankyou so muchðŸ˜ https://t.co/zkGus87Z1n', 'Sat Aug 26 10:12:53 +0000 2017', 23019173),
('619935292', '103770785', 'https://t.co/zAlcqalqcZ', 'a7f256836f952186b29927a7673733fb', 'Twitter India', 'http://pbs.twimg.com/profile_images/875098522390896640/Q4Gn9E1w_normal.jpg', 'TwitterIndia', 'And the most Tweeted movie hashtag in India is @yrf film #Sultan! #hashtag10 https://t.co/zAlcqalqcZ', 'Wed Aug 23 09:51:01 +0000 2017', 22758661),
('587447163', '740029538', 'https://t.co/xWyxNoGt72', 'b7d5a9b97b6d35b7df4f9fef396ab381', 'Google Chrome OS', 'http://pbs.twimg.com/profile_images/2516386808/t2m7qz7wgv5fmluoxt8j_normal.jpeg', 'GoogleChromeOS1', 'Google to Launch New Chromebooks, Mini Google Home Alongside Pixel 2 - 1redDrop https://t.co/xWyxNoGt72', 'Sat Aug 26 10:14:34 +0000 2017', 23019274),
('587447163', '356893311', 'https://t.co/3rf0PYkyrC', 'bd12bf1e6ced25e430acd15408232da5', 'Ravindrasinh jadeja', 'http://pbs.twimg.com/profile_images/740571504711061504/hNE4UBtY_normal.jpg', 'imjadeja', 'Let''s see who is my number 1 Fan on my app !! Download now https://t.co/3rf0PYkyrC https://t.co/K3pjvULuq4', 'Sat Aug 12 16:28:01 +0000 2017', 21832081),
('587447163', '329698698', 'https://t.co/1Lhupxh8G3', 'bfa820aaa8b66c0a41d2cce74d147d85', 'Ashrut bharadwaj', 'http://pbs.twimg.com/profile_images/784271774762475521/yWvMygrf_normal.jpg', 'AshrutBharadwaj', 'I posted a new video to Facebook https://t.co/1Lhupxh8G3', 'Sat May 20 16:19:37 +0000 2017', 14746777),
('587447163', '39448240', 'https://t.co/B8jIV1Oeyz', 'c2118e00c184c6c127750d9e4ffa10d9', 'Digit', 'http://pbs.twimg.com/profile_images/837237350090539011/cw7A_iyD_normal.jpg', 'digitindia', '#JioPhone vs competition: Is this the only feature phone you should buy?\nhttps://t.co/B8jIV1Oeyz https://t.co/KrVhKWPt2q', 'Fri Aug 25 10:49:37 +0000 2017', 22934977),
('', '11348282', 'https://t.co', 'c598f68d1205e01f98ba18fffbd5d31d', 'NASA', 'http://pbs.twimg.com/profile_images/188302352/nasalogo_twitter_normal.jpg', 'NASA', 'RT @Space_Station: .@Astro2fish orbited over Hurricane #Harvey2017 and photographed the storm bearing down on the Texas coast. https://t.coâ€¦', 'Fri Aug 25 20:31:44 +0000 2017', 22969904),
('587447163', '807608628', 'https://t.co/391YJpm2ij', 'cbdc77db4790d72b3e786d5f5e07dcba', 'Led Zeppelin', 'http://pbs.twimg.com/profile_images/2585954566/8ev9krfvkxb8nz00cg77_normal.jpeg', 'ledzeppelin', 'Join Jimmy Page on official Led Zeppelin Facebook page celebrating  Complete BBC Sessions release tomorrow Sept. 14 https://t.co/391YJpm2ij', 'Tue Sep 13 18:06:10 +0000 2016', 24516370),
('587447163', '535522571', 'https://t.co/6qep15Hwmi', 'cd269e130118c8f44bdb8a1db003ce2b', 'dbAND', 'http://pbs.twimg.com/profile_images/822944983175090176/b_T__QUX_normal.png', 'pudiaband', 'Latest jaunsari song sobelu bano kato hoiro sung by Gambhir bharti: https://t.co/6qep15Hwmi via @YouTube', 'Sat Aug 26 10:38:59 +0000 2017', 23020739),
('587447163', '34197952', 'https://t.co/i6Kf2i39Od', 'd2d8286323443139894e0716d4476977', 'anand mahindra', 'http://pbs.twimg.com/profile_images/619739923654967296/b86Fvz9C_normal.jpg', 'anandmahindra', 'What colossal,unnecessary violence&amp;loss of life in a country which has repeatedly gifted the world messengers of peâ€¦ https://t.co/i6Kf2i39Od', 'Fri Aug 25 13:20:21 +0000 2017', 22944021),
('587447163', '18080585', 'https://t.co/NJWYgOaD5M', 'd2f5c9ff5b31a7a090713649bbbd1194', 'MongoDB', 'http://pbs.twimg.com/profile_images/750403034178478081/EPrK3ci2_normal.jpg', 'MongoDB', 'Learn how a drive for digital #innovation has helped HSBC become simpler, better &amp; faster using #MongoDB. ðŸ‘‰â€¦ https://t.co/NJWYgOaD5M', 'Fri Aug 25 20:00:02 +0000 2017', 22968002),
('587447163', '847269050933575685', 'https://t.co/T1DCWI5HIO', 'd4b88f1a4368ddd885462f3f5d0f135a', 'Himanshu Mishra', 'http://pbs.twimg.com/profile_images/847480987445374976/alOzBzGb_normal.jpg', 'MisIrJipKh', '@alu_14p @Mahanaatma1 à¤¬à¥‡à¤®à¤¤à¤²à¤¬ à¤¸à¥€ à¤²à¤—à¤¨à¥‡ à¤²à¤—à¥€ à¤¹à¥ˆ à¤¯à¥‡ à¤¦à¥à¤¨à¤¿à¤¯à¤¾ \nà¤”à¤° à¤«à¤¼à¤°à¤¿à¤¶à¥à¤¤à¥‡ à¤–à¤¤à¥à¤® à¤¹à¥‹ à¤°à¤¹à¥‡ à¤¹à¥ˆ\nà¤¶à¤¾à¤¯à¤¦ à¤®à¥‡à¤°à¥‡ à¤¦à¤¿à¤² à¤•à¥€ à¤—à¤¹à¤°à¤¾à¤ˆ à¤ªà¤¾à¤• à¤¹à¥‹à¤¨à¥‡â€¦ https://t.co/T1DCWI5HIO', 'Sun Aug 13 11:47:23 +0000 2017', 21901643),
('587447163', '13298072', 'https://t.co/On2kAfVwFN', 'd9125b6ebb248b2054ddbe1f7057b8f2', 'Tesla', 'http://pbs.twimg.com/profile_images/489192650474414080/4RxZxsud_normal.png', 'TeslaMotors', 'RT @ElectrekCo: Tesla opens new store in Virginia and wins contract to install solar at colleges https://t.co/On2kAfVwFN https://t.co/dnmXBâ€¦', 'Thu Aug 24 17:10:31 +0000 2017', 22871431),
('587447163', '740029538', 'https://t.co/TB1SrmpgJs', 'db3811eb8754da07610cdcf865c431b0', 'Google Chrome OS', 'http://pbs.twimg.com/profile_images/2516386808/t2m7qz7wgv5fmluoxt8j_normal.jpeg', 'GoogleChromeOS1', 'BIXOLON Releases Google Chrome SDK - Point of Sale News (tm) (press release) (blog) https://t.co/TB1SrmpgJs', 'Fri Aug 25 18:17:04 +0000 2017', 22961824),
('587447163', '177547780', 'https://t.co/F92twjEZZw', 'ddc6e3acef2f65a5a47da2637db0f5ee', 'ICC', 'http://pbs.twimg.com/profile_images/853850199609024512/Rjw4RCp7_normal.jpg', 'ICC', 'Wednesday: got married.\nThursday: six wickets against India.\n\nA pair of special days for Akila Dananjaya #SLvINDâ€¦ https://t.co/F92twjEZZw', 'Sat Aug 26 11:00:00 +0000 2017', 23022000),
('587447163', '204489416', 'https://t.co/N2U2SSCFI8', 'ddf3f3708c17ded8d58fd215f6ec1857', 'Robert Plant', 'http://pbs.twimg.com/profile_images/898444397498556416/y5Cph8or_normal.jpg', 'RobertPlant', 'General sale for RP''s UK &amp; Ireland tour starts at 9am on Friday. Full dates at https://t.co/N2U2SSCFI8 https://t.co/rmCaULWhsW', 'Wed Aug 23 16:23:05 +0000 2017', 22782185),
('587447163', '368202586', 'https://t.co/TLLjg5NpXf', 'ee847bd48288cd0c69ff11210833a31c', 'Samsung India', 'http://pbs.twimg.com/profile_images/679637611695091712/thsvpUlJ_normal.png', 'Samsung_IN', 'Watch Chef Sanjay bake the mouth watering Walnut Cake with Samsung #SmartOven in our final weekâ€™s #ItWillCook challâ€¦ https://t.co/TLLjg5NpXf', 'Fri Aug 25 14:48:57 +0000 2017', 22949337),
('587447163', '177547780', 'https://t.co/HZ2hqbEH8p', 'ef513047521d0af1eca530895ae6ebd8', 'ICC', 'http://pbs.twimg.com/profile_images/853850199609024512/Rjw4RCp7_normal.jpg', 'ICC', 'ICYMI, @ABdeVilliers17 has stepped down as South Africa''s ODI captain: https://t.co/HZ2hqbEH8p https://t.co/sVVALLcn4M', 'Fri Aug 25 19:00:04 +0000 2017', 22964404),
('587447163', '91985735', 'https://t.co/zuFaWRSL1H', 'f6087a61232e3ac3007dabf7dfe5e50d', 'Node.js', 'http://pbs.twimg.com/profile_images/702185727262482432/n1JRsFeB_normal.png', 'nodejs', 'âœ¨Have a good story around how you are using #nodejs with mobile, containers, cloud? DM us! https://t.co/zuFaWRSL1H', 'Fri Aug 25 19:15:02 +0000 2017', 22965302),
('587447163', '140441268', 'https://t.co/eFglScKcZt', 'f7e6e6c1122f003e42abae7b42edd053', 'The Lee Strasberg', 'http://pbs.twimg.com/profile_images/643892994773422081/VRtK76rI_normal.jpg', 'lstfi', 'It is with the deepest of sadnesses that we mourn the loss of the great Hope Arthur--student ofâ€¦ https://t.co/eFglScKcZt', 'Wed Aug 02 23:12:00 +0000 2017', 20992320);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_provider` enum('','facebook','google','twitter','linkedin') COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_provider`, `oauth_uid`, `first_name`, `last_name`, `email`, `gender`, `locale`, `picture`, `username`, `link`, `created`, `modified`) VALUES
(1, 'twitter', '619935292', 'Sidharth', 'Shridhar', '', '', 'en', 'http://pbs.twimg.com/profile_images/483481088635834368/KKtOazUl_normal.jpeg', 'SidharthShridha', 'https://twitter.com/SidharthShridha', '2017-08-23 23:11:47', '2017-08-25 21:58:31'),
(2, 'twitter', '2805613570', 'higg[Sb]oson', '', '', '', 'en', 'http://pbs.twimg.com/profile_images/575746822104293376/b7P0Nt8X_normal.jpeg', 'higgsboson85', 'https://twitter.com/higgsboson85', '2017-08-24 12:39:14', '2017-08-24 16:04:15'),
(4, 'twitter', '587447163', 'Aman', 'bharadwaj', '', '', 'en', 'http://pbs.twimg.com/profile_images/900736647892946944/xcFTZPj4_normal.jpg', 'amanbharadwaj2', 'https://twitter.com/amanbharadwaj2', '2017-08-24 16:18:58', '2017-08-26 13:50:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`user_stamp`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
