<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SkillSage.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SkillSage</title>
    <link href="CSS/Index.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="slider">
            <div class="overlay">
                <div class="content">
                    <div class="card">
                        <p>Find the right <span class="highlight">freelance</span> service, right away</p>
                        <div class="search-bar">
                            <input type="text" placeholder="Search for any service..." />
                            <button><i class="fa fa-search"></i></button>
                        </div>
                        <!-- Add more content like the icons or testimonials here -->
                    </div>
                </div>
            </div>
        </div>
        <div class="categories">

            <div class="category">
                <img src="icons/data.jpg" />
                <span>Programming & Tech</span>
            </div>

            <div class="category">
                <img src="icons/graphics.jpg" />
                <span>Graphics & Design</span>
            </div>
            <div class="category">
                <img src="icons/digital-markerting.jpg" />
                <span>Digital Marketing
                </span>
            </div>
            <div class="category">
                <img src="icons/content-writing.jpg" />
                <span>Writing & Translation</span>
            </div>
            <div class="category">
                <img src="icons/video-animation.jpg" />
                <span>Video & Animation</span>
            </div>
            <div class="category">
                <img src="icons/ai-services.jpg" />
                <span>Ai Services</span>
            </div>
            <div class="category">
                <img src="icons/music.jpg" />
                <span>Music & Audio</span>
            </div>
            <div class="category">
                <img src="icons/bussiness.jpg" />
                <span>Business</span>
            </div>
            <div class="category">
                <img src="icons/counselling.jpg" />
                <span>Consulting</span>
            </div>
        </div>
        <h2>Popular Services</h2>
        <div class="popular-services">
            <div class="service-card" style="background-color: #429a16;">
                <p>Software Development</p>
                <img src="icons/software-development.png" />
            </div>
            <div class="service-card" style="background-color: #F17946;">
                <p>Logo Design</p>
                <img src="icons/logo-design.png" />
            </div>
            <div class="service-card" style="background-color: #004522;">
                <p>SEO</p>
                <img src="icons/seo.png" />
            </div>
            <div class="service-card" style="background-color: #A13A65;">
                <p>Architecture & Interior Design</p>
                <img src="icons/architecture-design.png" />
            </div>
            <div class="service-card" style="background-color: #76871A;">
                <p>Social Media Marketing</p>
                <img src="icons/social-media-marketing.png" />
            </div>
            <div class="service-card" style="background-color: #5B3316;">
                <p>Voice Over</p>
                <img src="icons/voice-over.png" />
            </div>
        </div>
        <div class="container">
            <h1>A whole world of freelance talent at your fingertips</h1>
            <div class="features">
                <div class="feature">
                    <div class="icon">👩‍💻</div>
                    <h2>Over 700 categories</h2>
                    <p>Get results from skilled freelancers from all over the world, for every task, at any price point.</p>
                </div>
                <div class="feature">
                    <div class="icon">💵</div>
                    <h2>Clear, transparent pricing</h2>
                    <p>Pay per project or by the hour (Pro). Payments only get released when you approve.</p>
                </div>
                <div class="feature">
                    <div class="icon">⚡</div>
                    <h2>Quality work done faster</h2>
                    <p>Filter to find the right freelancers quickly and get great work delivered in no time, every time.</p>
                </div>
                <div class="feature">
                    <div class="icon">🏆</div>
                    <h2>24/7 award-winning support</h2>
                    <p>Chat with our team to get your questions answered or resolve any issues with your orders.</p>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
