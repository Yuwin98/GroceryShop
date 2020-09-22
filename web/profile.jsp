<%--
  Created by IntelliJ IDEA.
  User: Yuwin
  Date: 9/22/2020
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>PROFILE</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">


    <!-- Font -->

    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700%7CAllura" rel="stylesheet">

    <!-- Stylesheets -->

    <link href="${pageContext.request.contextPath}/common-css/bootstrap.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/common-css/ionicons.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/common-css/fluidbox.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/01-cv-portfolio/css/styles.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/01-cv-portfolio/css/responsive.css" rel="stylesheet">

</head>
<body>

<header>
    <div class="container">
        <div class="heading-wrapper">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-4">
                    <div class="info">
                        <i class="icon ion-ios-location-outline"></i>
                        <div class="right-area">
                            <h5>3008 Sarah Drive</h5>
                            <h5>Franklin,LA 70538</h5>
                        </div><!-- right-area -->
                    </div><!-- info -->
                </div><!-- col-sm-4 -->

                <div class="col-sm-6 col-md-6 col-lg-4">
                    <div class="info">
                        <i class="icon ion-ios-telephone-outline"></i>
                        <div class="right-area">
                            <h5>337-4139538</h5>
                            <h6>MIN - FRI,8AM - 7PM</h6>
                        </div><!-- right-area -->
                    </div><!-- info -->
                </div><!-- col-sm-4 -->

                <div class="col-sm-6 col-md-6 col-lg-4">
                    <div class="info">
                        <i class="icon ion-ios-chatboxes-outline"></i>
                        <div class="right-area">
                            <h5>contact@colorlib.com</h5>
                            <h6>REPLY IN 24 HOURS</h6>
                        </div><!-- right-area -->
                    </div><!-- info -->
                </div><!-- col-sm-4 -->
            </div><!-- row -->
        </div><!-- heading-wrapper -->

    </div><!-- container -->
</header>

<section class="intro-section">
    <div class="container">
        <div class="row">
            <div class="col-md-1 col-lg-2"></div>
            <div class="col-md-10 col-lg-8">
                <div class="intro">
                    <div class="profile-img"><img src="${pageContext.request.contextPath}/images/profile-1-250x250.jpg" alt=""></div>
                    <h2><b>Michel SMith</b></h2>
                    <ul class="information margin-tb-30">
                        <li><b>USER NAME : </b>MSMith123</li>
                        <li><b>PHONE NUMBER : </b>337-5689233</li>
                        <li><b>EMAIL : </b>mymith@mywebpage.com</li>
                        <li><b>ADDRESS : </b>300/B, Cross Street,LA.</li>
                    </ul>
                    <ul class="social-icons">
                        <li><a href="#"><i class="ion-social-pinterest"></i></a></li>
                        <li><a href="#"><i class="ion-social-linkedin"></i></a></li>
                        <li><a href="#"><i class="ion-social-instagram"></i></a></li>
                        <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                        <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                    </ul>
                </div><!-- intro -->
            </div><!-- col-sm-8 -->
        </div><!-- row -->
    </div><!-- container -->
</section><!-- intro-section -->

<section class="education-section section">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="heading">
                    <h3><b>Card Details</b></h3>
                    <h6 class="font-lite-black"><b>DEBIT OR CREDIT CARD INFO</b></h6>
                </div>
            </div><!-- col-sm-4 -->
            <div class="col-sm-8">
                <div class="education-wrapper">
                    <div class="education margin-b-50">
                        <h4><b>CARD HOLDER NAME</b></h4>
                        <h5 class="font-yellow"><b>Michel SMith</b></h5>
                    </div><!-- education -->

                    <div class="education margin-b-50">
                        <h4><b>CARD NUMBER</b></h4>
                        <h5 class="font-yellow"><b>4589 2548 7536 1459</b></h5>

                    </div><!-- education -->

                    <div class="education margin-b-50">
                        <h4><b>CARD EXPIRED DATE</b></h4>
                        <h5 class="font-yellow"><b>2024/09</b></h5>

                    </div><!-- education -->
                </div><!-- education-wrapper -->
            </div><!-- col-sm-8 -->
        </div><!-- row -->
    </div><!-- container -->

</section><!-- about-section -->



<section class="portfolio-section section">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="heading">
                    <h3><b>Order Details</b></h3>
                    <h6 class="font-lite-black"><b>MY ORDER</b></h6>
                </div>
            </div><!-- col-sm-4 -->
            <div class="col-sm-8">
                <div class="portfolioFilter clearfix margin-b-80">
                    <a href="#" data-filter="*" class="current"><b>ALL</b></a>
                    <a href="#" data-filter=".web-design"><b>PENDING</b></a>
                    <a href="#" data-filter=".branding"><b>RECIVED</b></a>
                    <a href="#" data-filter=".graphic-design"><b>CANCEL</b></a>
                </div><!-- portfolioFilter -->
            </div><!-- col-sm-8 -->
        </div><!-- row -->
    </div><!-- container -->

    <div class="portfolioContainer">

        <div class="p-item web-design">
            <a href="${pageContext.request.contextPath}/images/portfolio-1-600x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-1-600x400.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item branding graphic-design">
            <a href="${pageContext.request.contextPath}/images/portfolio-7-600x800.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-7-600x800.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item web-design">
            <a href="${pageContext.request.contextPath}/images/portfolio-2-600x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-2-600x400.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item p-item-2 graphic-design">
            <a class="img" href="${pageContext.request.contextPath}/images/portfolio-8-300x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-8-300x400.jpg" alt=""></a>
            <a class="img" href="${pageContext.request.contextPath}/images/portfolio-9-300x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-9-300x400.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item branding graphic-design">
            <a href="${pageContext.request.contextPath}/images/portfolio-3-600x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-3-600x400.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item graphic-design web-design">
            <a href="${pageContext.request.contextPath}/images/portfolio-4-600x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-4-600x400.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item  graphic-design branding">
            <a href="${pageContext.request.contextPath}/images/portfolio-5-600x800.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-5-600x800.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item web-design branding">
            <a href="${pageContext.request.contextPath}/images/portfolio-6-600x800.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-6-600x800.jpg" alt=""></a>
        </div><!-- p-item -->

        <div class="p-item p-item-2 graphic-design">
            <a class="img" href="${pageContext.request.contextPath}/images/portfolio-10-300x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-10-300x400.jpg" alt=""></a>
            <a class="img" href="${pageContext.request.contextPath}/images/portfolio-11-300x400.jpg" data-fluidbox>
                <img src="${pageContext.request.contextPath}/images/portfolio-11-300x400.jpg" alt=""></a>
        </div><!-- p-item -->

    </div><!-- portfolioContainer -->

</section><!-- portfolio-section -->






<!-- SCIPTS -->

<script src="${pageContext.request.contextPath}/common-js/jquery-3.2.1.min.js"></script>

<script src="${pageContext.request.contextPath}/common-js/tether.min.js"></script>

<script src="${pageContext.request.contextPath}/common-js/bootstrap.js"></script>

<script src="${pageContext.request.contextPath}/common-js/isotope.pkgd.min.js"></script>

<script src="${pageContext.request.contextPath}/common-js/jquery.waypoints.min.js"></script>

<script src="${pageContext.request.contextPath}/common-js/progressbar.min.js"></script>

<script src="${pageContext.request.contextPath}/common-js/jquery.fluidbox.min.js"></script>

<script src="${pageContext.request.contextPath}/common-js/scripts.js"></script>

</body>
</html>