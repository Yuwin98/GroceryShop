-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2020 at 10:27 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `descriptionshort` text NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `title`, `description`, `descriptionshort`, `path`) VALUES
(1, 'Breakfast Rolls', 'Ingredients\r\nBaguette split into 4 pieces\r\n100g salted butter, melted\r\n40g spinach, shredded\r\n4 eggs\r\n2 bacon rashes, shredded\r\n400g button mushrooms, halved\r\n2 thyme sprigs\r\nRecipe\r\nPreheat oven to 165°c. Scoop out soft centre from sliced baguette bases to form a shell. Brush inside of bases and tops with a little butter. Place bases on a baking tray. Fill with spinach, then crack an egg into each. Season. Top with bacon. Combine mushroom with thyme and remaining butter in an ovenproof dish. Bake baguette slices and mushroom for 15 minutes. Add baguette tops to tray and bake for a further 5 minutes or until they are golden, bacon is crisp and eggs are set. Sandwich with tops and serve with mushroom.', 'A delicious and easy to make breakfast dish to surprise your loved ones', '1.jpg'),
(2, 'Baked Chicken', 'Ingredients\r\n2 Chickens\r\n1/3 cup lemon juice, 1 tbs finely grated lemon rind, plus lemon wedges, to serve\r\n¼ cup olive oil\r\n6 garlic cloves, crushed\r\n2 long chillies, deseeded, chopped\r\n2 tbs chopped fresh thyme\r\n¼ cup rosemary leaves, chopped\r\nRecipe\r\n\r\nWash chickens and pat dry with paper towel. Using kitchen scissors, cut along both sides of the backbone and remove from both chickens. Turn chickens over and place, skin-side up, on a clean, flat surface. Press down firmly to flatten. Cover and set aside. Combine lemon juice, rind, oil, garlic, chili and herbs together in a bowl. Rub herb mixture into skin of both chickens. Heat hooded barbecue on medium. Place chickens skin-side up on oiled grill. Cook for 25 minutes. Turn over chicken and press down with spatula. Close and cook for a further 25 minutes or until skin is crisp and chicken is cooked through. Transfer to a chopping board, cover loosely with foil and rest for 5-10 minutes. Cut into pieces. Serve with lemon wedges', 'A delightful chicken dinner idea', '4.jpg'),
(3, 'Fried Rice', 'Ingredients\r\n2 cups white rice\r\n1 tbs oil, extra 2tbs\r\n3 eggs, lightly whisked\r\n2 rashers bacon, chopped\r\n1 cup frozen peas\r\n250g small peeled cooked prawns\r\n2 tbs soy sauce\r\n3 spring onions, sliced\r\n2 tsp grated ginger\r\n\r\nRecipe\r\nCook the rice well in a rice cooker or any method preferred. Leave the rice to cool completely. Heat 1 tbs oil in a frying pan or wok over high heat. Add the egg and swirl to cover pan. Cook for 2-3 minutes or until just set. Add bacon and cook for 2 minutes. Add rice and toss over high heat for 2-3 minutes. Stir in bacon and veg mixture with soy sauce, , spring onion and ginger. Toss for 1 minute, then serve.', 'Simple and easy dish that everyone loves', '3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `item_count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `item_count`) VALUES
(11, 1, '68', 1);

-- --------------------------------------------------------

--
-- Table structure for table `common`
--

CREATE TABLE `common` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `description` text NOT NULL,
  `type` enum('new','promo','best') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `common`
--

INSERT INTO `common` (`id`, `name`, `price`, `path`, `description`, `type`) VALUES
(1, 'Marina Cooking Oil 1L', '580', 'marinaoil.png', '', 'best'),
(2, 'Barilla Pasta Fusilli 500g', '400', 'pasta.png', '', 'best'),
(3, 'Maliban Biscuit Crisco 250g', '300', 'krisco.png', '', 'best'),
(4, 'Harpo\'S Pizza & Pasta Tagliatelle 200G', '500', 'harpospasta.png', '', 'promo'),
(5, 'Prima Noodles Kottu Mee Hot & Spicy 80g', '60', 'kottumee.png', '', 'promo'),
(6, 'Kraft Cheese Cheddar Singles Slices 250g', '1075', 'sandwichcheese.png', '', 'promo'),
(7, 'Doritos Tortilla Chips Barbeque 160g', '765', 'doritosred.png', '', 'new'),
(8, 'Dove Shower Gel Fine Silk 500Ml', '1470', 'doveshowegel.png', '', 'new'),
(9, 'Tanheiser Original Sweet Malt Drink 330ML', '360', 'sweetmalt.png', '', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `items` text NOT NULL,
  `total` double NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `status` enum('Delivered','Cancelled','Shipped','Processing') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `username`, `items`, `total`, `order_date`, `status`) VALUES
(1, 1, 'Yuwin Sapumana', 'Pringles,Corn,Burger,Sprite\r\n', 750, '2020-08-31', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `path`, `description`, `type`) VALUES
(1, 'Baguette', '150', 'baguette.png', '', 'bakery'),
(2, 'Burito', '200', 'burito.png', '', 'bakery'),
(3, 'Cherry Cake(1pcs)', '85', 'cherrycake.png', '', 'bakery'),
(4, 'Chocolate fudge cake(1pcs)', '105', 'chocolatefudge.png', '', 'bakery'),
(5, 'Dark chocolate cupcake', '55', 'chocolatecupcake.png', '', 'bakery'),
(6, 'Coffee cake(1pcs)', '70', 'coffeecake.png', '', 'bakery'),
(7, 'Croissant', '120', 'croissant.png', '', 'bakery'),
(8, 'Chocolate cupcake', '60', 'cupcakefrosting.png', '', 'bakery'),
(9, 'Doughnut(10pcs)', '850', 'doughnut.png', '', 'bakery'),
(10, 'Fried rice', '250', 'friedrice.png', '', 'bakery'),
(11, 'Top crust bread', '58', 'bread.png', '', 'bakery'),
(12, 'Raspberry cake(1pcs)', '125', 'raspberrycake.png', '', 'bakery'),
(13, 'Cheese and onion loaf', '185', 'risinbread.png', '', 'bakery'),
(14, 'Vanilla cupcake', '50', 'rosecupcake.png', '', 'bakery'),
(15, 'Sandwich bread(750g)', '160', 'slicedbread.png', '', 'bakery'),
(16, 'Sushi(10pcs)', '1500', 'sushi.png', '', 'bakery'),
(17, 'Taco', '150', 'taco.png', '', 'bakery'),
(18, 'Vanilla cake(1pcs)', '60', 'vanilacake.png', '', 'bakery'),
(19, 'Coca cola(360ml)', '360', 'cocacolacan.png', '', 'beverages'),
(20, 'Fanta(400ml)', '80', 'fanta.png', '', 'beverages'),
(21, 'Sprite(360ml)', '350', 'spritecan.png', '', 'beverages'),
(22, 'Sprite Zero(360ml)', '320', 'spritezero.png', '', 'beverages'),
(23, 'Coke diet(360ml)', '330', 'cokediet.png', '', 'beverages'),
(24, 'Fanta(360ml)', '180', 'fantacan.png', '', 'beverages'),
(25, 'Cream soda (500ml)', '100', 'creamsoda.png', '', 'beverages'),
(26, 'Dairy chocolate milk(200ml)', '60', 'dairychocolate.png', '', 'beverages'),
(27, 'Milo(180ml)', '60', 'milo.png', '', 'beverages'),
(28, 'Mountaindew(500ml)', '100', 'mountaindew.png', '', 'beverages'),
(29, 'Fontana apple juice(1L)', '680', 'fontanaapple.png', '', 'beverages'),
(30, 'Fontana pomegranate juice(1L)', '750', 'fontanapomegranate.png', '', 'beverages'),
(31, 'Rich life ice coffee(180ml)', '60', 'richlifeicecoffee.png', '', 'beverages'),
(32, 'Redbull(366ml)', '490', 'redbull.png', '', 'beverages'),
(33, 'Olu Mineral water(650ml)', '220', 'olumineralwater.png', '', 'beverages'),
(34, 'Olu Sparkling water(330ml)', '220', 'olusparklingwater.png', '', 'beverages'),
(35, 'Bollu(100g)', '85', 'bollu.png', '', 'fish'),
(36, 'Clean Cuttle fish(100g)', '140', 'cleancuttlefish.png', '', 'fish'),
(37, 'Jeelawa(100g)', '129', 'jeelawa.png', '', 'fish'),
(38, 'Kumbalawa(100g)', '89', 'kumbalawa.png', '', 'fish'),
(39, 'Fresh Salmon(100g)', '350', 'salmon.png', '', 'fish'),
(40, 'Sudda(100g)', '103', 'sudda.png', '', 'fish'),
(41, 'Tuna(100g)', '119', 'tuna.png', '', 'fish'),
(42, 'White Mullete(100g)', '89', 'whitemulette.png', '', 'fish'),
(43, 'Prawns(Lagoon)(100g)', '135', 'prawnslagoon.png', '', 'fish'),
(44, 'Linna(100g)', '53', 'linna.png', '', 'fish'),
(45, 'Paraw(100g)', '99', 'paraw.png', '', 'fish'),
(46, 'Thalapath(100g)', '142', 'thalapath.png', '', 'fish'),
(47, 'Lena paraw(100g)', '75', 'lenaparaw.png', '', 'fish'),
(48, 'Sura paraw(100g)', '89', 'suraparaw.png', '', 'fish'),
(49, 'Red Apple ', '120', 'apple.png', '', 'fruit'),
(50, 'Avocado', '89', 'avacado.png', '', 'fruit'),
(51, 'Banana', '55', 'banana.png', '', 'fruit'),
(52, 'Blackberry', '215', 'blackberry.png', '', 'fruit'),
(53, 'Cherry', '165', 'cherry.png', '', 'fruit'),
(54, 'Dragonfruit', '190', 'dragonfruit.png', '', 'fruit'),
(55, 'Grapefruit', '65', 'grapefruit.png', '', 'fruit'),
(56, 'Black Grapes', '100', 'grapes.png', '', 'fruit'),
(57, 'Kiwi', '320', 'kiwi.png', '', 'fruit'),
(58, 'Watermelon', '120', 'watermelon.png', '', 'fruit'),
(59, 'Green Apple', '80', 'greenapple.png', '', 'fruit'),
(60, 'Guava', '40', 'guava.png', '', 'fruit'),
(61, 'Lemon', '70', 'lemon.png', '', 'fruit'),
(62, 'Mango', '130', 'mango.png', '', 'fruit'),
(63, 'Pear', '120', 'pear.png', '', 'fruit'),
(64, 'Pineapple', '180', 'pineapple.png', '', 'fruit'),
(65, 'Pomegranate', '150', 'pomegranate.png', '', 'fruit'),
(66, 'Rambutan', '100', 'rambutan.png', '', 'fruit'),
(67, 'Raspberry', '250', 'raspberry.png', '', 'fruit'),
(68, 'Strawberry', '175', 'strawberry.png', '', 'fruit'),
(69, 'Blueberry', '150', 'blueberry.png', '', 'fruit'),
(70, 'Peach', '120', 'peach.png', '', 'fruit'),
(71, 'Pringles Original(185g)', '650', 'pringlesoriginal.png', '', 'groceries'),
(72, 'Pringles BBQ(185g)', '650', 'pringlesbbq.png', '', 'groceries'),
(73, 'Pringles cheese', '650', 'pringlescheese.png', '', 'groceries'),
(74, 'Blue cheese(100g)', '450', 'bluecheese.png', '', 'groceries'),
(75, 'Happy Hen Brown Egg - 10 Large', '250', 'happyheneggs.png', '', 'groceries'),
(76, 'Beef Burger', '850', 'burger.png', '', 'groceries'),
(77, 'Burger meal', '1100', 'burgermeal.png', '', 'groceries'),
(78, 'Butter(100g)', '65', 'butter.png', '', 'groceries'),
(79, 'Chicken burger', '580', 'chickenburger.png', '', 'groceries'),
(80, 'Doritos barbeque chips(165g)', '765', 'doritosred.png', '', 'groceries'),
(81, 'Doritos spicy(165g)', '765', 'doritos.png', '', 'groceries'),
(82, 'Doritos cool ranch', '765', 'doritosblue.png', '', 'groceries'),
(83, 'Ferrero roche chocolate(200g)', '1800', 'ferrerochocalate.png', '', 'groceries'),
(84, 'Fish burger', '550', 'fishburger.png', '', 'groceries'),
(85, 'Vanilla ice cream cone', '45', 'icecreamvanila.png', '', 'groceries'),
(86, 'Srawberry ice cream', '55', 'icecreamstrawberry.png', '', 'groceries'),
(87, 'Mars chocalate bar(51g)', '168', 'mars.png', '', 'groceries'),
(88, 'Parmesan cheese(100g)', '1200', 'parmesancheese.png', '', 'groceries'),
(89, 'KitKat(50g)', '290', 'kitkat.png', '', 'groceries'),
(90, 'Nutella chocolate spread(350g)', '1200', 'nutella.png', '', 'groceries'),
(91, 'Toblerone(200g)', '1650', 'toblerone.png', '', 'groceries'),
(92, 'Milkyway(55g)', '170', 'milkyway.png', '', 'groceries'),
(93, 'Twix(60g)', '120', 'twix.png', '', 'groceries'),
(94, 'Dairy milk oreo(330g)', '1850', 'oreo.png', '', 'groceries'),
(95, 'BBQ Wings(5pcs)', '900', 'bbqwings.png', '', 'meat'),
(96, 'Fried Wings(5pcs)', '600', 'friedwings.png', '', 'meat'),
(97, 'Sausages(400g)', '400', 'sausages.png', '', 'meat'),
(98, 'Australian Lamb Shoulder Chop(300g)', '1050', 'australianlambchop.png', '', 'meat'),
(99, 'Mutton Leg(300g)', '897', 'muttonleg.png', '', 'meat'),
(100, 'Pork Back Bacon(100g)', '249', 'porkbackbacon.png', '', 'meat'),
(101, 'Pork Shoulder Chops(300g)', '441', 'porkshoulderchop.png\r\n', '', 'meat'),
(102, 'Australian Mutton Cubes(300g)', '1017', 'australianmuttoncube.png', '', 'meat'),
(103, 'Nelna Whole Chicken(100g)', '43', 'nelnachicken.png', '', 'meat'),
(104, 'Pork Bacon Ends(300g)', '417', 'porkbaconends.png', '', 'meat'),
(105, 'Pork Streaky Bacon(100g)', '199', 'porkstreakybacon.png', '', 'meat'),
(106, 'Chicken Breast(300g)', '228', 'chickenbreast.png', '', 'meat'),
(107, 'Crumbed Chi.drumstick(100g)', '100', 'crumbedchickendrumstick.png', '', 'meat'),
(108, 'Honey Glazed Ham(100g)', '140', 'honeyglazedham.png', '', 'meat'),
(109, 'Chicken Ham(100g)', '195', 'chickenham.png', '', 'meat'),
(110, 'Chicken Drumsticks(300g)', '216', 'chickendrumsticks.png', '', 'meat'),
(111, 'Chicken Whole Legs(300g)', '276', 'chickenwholeleg.png', '', 'meat'),
(112, 'Pork Salami(100g)', '155', 'porksalami.png', '', 'meat'),
(113, 'Bandaide', '25', 'bandaide.png', '', 'pharmacy'),
(114, 'Scissors', '150', 'scissors.png', '', 'pharmacy'),
(115, 'Asamodagam(375ml)', '100', 'asamodagam.png', '', 'pharmacy'),
(116, 'Dettol(210ml)', '262', 'dettol.png', '', 'pharmacy'),
(117, 'Axe Medicate oil(5ml)', '180', 'medicateoil.png', '', 'pharmacy'),
(118, 'Panadol 144tb', '220', 'panadol.png', '', 'pharmacy'),
(119, 'Vicks VapoRub(50g)', '450', 'vicksrub.png', '', 'pharmacy'),
(120, 'Corn(500g)', '250', 'corn.png', '', 'vegetables'),
(121, 'Potato(500g)', '125', 'potato.png', '', 'vegetables'),
(122, 'Pumpkin(1Kg)', '45', 'pumpkin.png', '', 'vegetables'),
(123, 'Raddish(500g)', '120', 'raddish.png', '', 'vegetables'),
(124, 'Sweeet Potato(500g)', '75', 'sweetpotato.png', '', 'vegetables'),
(125, 'Tomago(300g)', '30', 'tomato.png', '', 'vegetables'),
(126, 'Asparagus(250g)', '675', 'asparagus.png', '', 'vegetables'),
(127, 'Banana flower', '100', 'bananaflower.png', '', 'vegetables'),
(128, 'Bell Pepper(100g)', '100', 'bellpepper.png', '', 'vegetables'),
(129, 'Bitter gourd(300g)', '60', 'bittergourd.png', '', 'vegetables'),
(130, 'Broccoli(100g)', '50', 'broccoli.png', '', 'vegetables'),
(131, 'Brussels sprout(500g)', '160', 'brusselssprout.png', '', 'vegetables'),
(132, 'Cabbage(300g)', '50', 'cabbage.png', '', 'vegetables'),
(133, 'Carrots(100g)', '43', 'carrots.png', '', 'vegetables'),
(134, 'Cauliflower(100g)', '53', 'cauliflower.png', '', 'vegetables'),
(135, 'Chili(100g)', '35', 'chili.png', '', 'vegetables'),
(136, 'Salad cucumber(300g)', '72', 'cucumber.png', '', 'vegetables'),
(137, 'Eggplant(100g)', '80', 'eggplant.png', '', 'vegetables'),
(138, 'Leeks(100g)', '48', 'leeks.png', '', 'vegetables'),
(139, 'Lotus root(100g)', '65', 'lotusroot.png', '', 'vegetables'),
(140, 'Onion(300g)', '30', 'onion.png', '', 'vegetables');

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL,
  `path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`id`, `path`) VALUES
(1, 'promo-1.jpg'),
(2, 'promo-2.png'),
(3, 'promo-3.jpg'),
(4, 'promo-4.jpg'),
(5, 'promo-5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(999) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cart_count` int(11) NOT NULL DEFAULT 0,
  `path` text NOT NULL,
  `role` enum('User','Administrator') NOT NULL DEFAULT 'User',
  `online` enum('0','1') NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `zipcode` int(10) NOT NULL DEFAULT 0,
  `contactnumber` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `cart_count`, `path`, `role`, `online`, `active`, `address`, `address2`, `city`, `province`, `zipcode`, `contactnumber`) VALUES
(1, 'yuwin Mindula', 'yms98', 'yuwinsapumana212@gmail.com', 'test123', 1, 'pic.jpeg', 'Administrator', '1', 1, '138/15 Beliatta Road', '', 'Tangalle', 'Southern', 82200, '0705209530'),
(14, 'Sapuama Mindula', 'yms', 'yuwinmindula@yahoo.com', 'abc', 0, 'N/A', 'User', '0', 1, '', '', '', '', 0, '123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`);

--
-- Indexes for table `common`
--
ALTER TABLE `common`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid_fk` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `common`
--
ALTER TABLE `common`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `userid_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
