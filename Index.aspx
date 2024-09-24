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
            <div class="service-card" style="background-color: #007E35;">
                <p>Website Development</p>
                <img src="service1.jpg" alt="Website Development">
            </div>
            <div class="service-card" style="background-color: #F17946;">
                <p>Logo Design</p>
                <img src="service2.jpg" alt="Logo Design">
            </div>
            <div class="service-card" style="background-color: #004522;">
                <p>SEO</p>
                <img src="service3.jpg" alt="SEO">
            </div>
            <div class="service-card" style="background-color: #A13A65;">
                <p>Architecture & Interior Design</p>
                <img src="service4.jpg" alt="Architecture & Interior Design">
            </div>
            <div class="service-card" style="background-color: #76871A;">
                <p>Social Media Marketing</p>
                <img src="service5.jpg" alt="Social Media Marketing">
            </div>
            <div class="service-card" style="background-color: #5B3316;">
                <p>Voice Over</p>
                <img src="service6.jpg" alt="Voice Over">
            </div>
        </div>
    </div>

</asp:Content>
