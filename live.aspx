<%@ Page Language="VB" AutoEventWireup="false" CodeFile="live.aspx.vb" Inherits="live" MasterPageFile="~/MastPage.master" %>
<%@ MasterType VirtualPath="~/MastPage.master" %>

<asp:content runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
            <div class="live">
				<h2 class="livetitle">Футбол</h2>
				
				<div class="count">
				
					<div class="counter">
						<div class="series-single">Серия А, Италия</div>
						<div class="series-title">Интер - Лацио</div>
						<div class="series-time">46:15</div>
						<div class="series-period">2й тайм</div>
						<div class="series-date">ПТ: 1:0</div>
						<div class="left"><div><div>2</div></div></div>
						<div class="right"><div><div>0</div></div></div>
					</div>
				</div>
				
				<div id="div_mathes_post_status"><h2 class="mathes_post_status"></h2></div>
				<div class="matches">
                
				<%--    <div class="float-left">
				    <div class="match">
					    <div class="header">Матч</div>
					    <div class="content">
						    <span class="char"><a href="#">1</a><span>3.65</span></span><span class="char x"><a href="#">X</a><span>1.5</span></span><span class="char"><a href="#">2</a><span>3.2</span></span>
					    </div>
				    </div>
				
				    <div class="match">
					    <div class="header">Матч</div>
					    <div class="content">
						    <span class="char active"><a href="#">1</a><span>3.65</span></span><span class="char x"><a href="#">X</a><span>1.5</span></span><span class="char"><a href="#">2</a><span>3.2</span></span>
						    <br class="breaker"/>
						    <div class="addbet">
							    <form action="#" method="post">
							    <input type="text" value="0.00" class="text"/><input type="submit" value="Сделать" class="submit"/><br/>
							    <button class="add">Добавить</button><button class="cancel">Отменить</button>
							    </form>
						    </div>
						    <span class="desc">Максимальная ставка (100.000 AMD.)</span>
					    </div>
				    </div>
				    </div>
				
				    <div class="match">
					    <div class="header">Матч</div>
					    <div class="content">
					    <span class="arrow up"><a href="#">больше</a><span>3.05</span></span><span class="val"><div>3</div></span><span class="arrow down"><a href="#">меньше</a><span>1.34</span></span>
					    </div>
				    </div>
				
				    <div class="match">
					    <div class="header">Матч</div>
						    <div class="content"><span class="longchar"><a href="#">1-0</a><span>3.65</span></span><span class="longchar"><a href="#">1-1</a><span>1.5</span></span><span class="longchar"><a href="#">1-2</a><span>3.2</span></span>
					
						    <span class="longchar"><a href="#">2-0</a><span>3.65</span></span><span class="longchar"><a href="#">2-2</a><span>1.5</span></span><span class="longchar"><a href="#">2-3</a><span>3.2</span></span>
						    <div class="footer"><a href="#">показать все</a></div>
					    </div>
					
				    </div>--%>
				</div>
				
			</div>
</asp:content>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Еврофутбол</title>
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
</head>

<body>

<div id="page_wrapper">
	<div id="header">

		<div id="header_top">
			<h1><a href="default.aspx">Еврофутбол</a></h1>
			<div id="login_registration">
				<div class="register_box">
					<h2>В первый раз?</h2>
					<a href="#">Регестрация</a>
				</div>

				<div class="login_box">
					<h2>Уже играю</h2>
					<form action="account.aspx">
					<ul>
						<li class="input_fields">
							<label>Имя:</label> <input class="textfield" type="text" />
							<label>Пароль:</label> <input class="textfield" type="password" />

						</li>
						<li><input class="login_button" type="submit" value="вход" /></li>
						<li><a class="forgot_pass" href="#">забыли пароль?</a></li>
					</ul>
					</form>
				</div>
			</div>
		</div>

		<div id="header_bottom">
			<ul class="top_menu">
				<li><a href="default.aspx">Ставки</a></li>
				<li class="live selected"><a href="live.aspx"><strong>LIVE</strong> ставки</a></li>
				<li><a href="results.aspx">Результаты</a></li>
				<li><a href="rules.aspx">Правила</a></li>

				<li><a href="help.aspx">Помощь</a></li>
			</ul>
			<ul class="language_bar">
				<li class="selected"><a href="#">РУС</a></li>
				<li><a href="#">HAJ</a></li>
				<li><a href="#">ENG</a></li>
			</ul>

		</div>
	</div>
	<div id="top_actions_bar">
		<div class="events_header_container">
			<h2>События</h2>
		</div>
		<div class="top_events_filter">
			
		</div>

		<div class="coupon_container">
			<div class="coupon_header_container">
				<h2>Купон</h2>
			</div>
			<div id="coupon_content_container" class="coupon_content_container">
				<img id="coupon_content_bg" class="coupon_content_bg" src="images/coupon_content_background.png" />
				<div id="coupon_content" class="coupon_content">
					<ul>

						<li id="coupon_item_normal" class="selected">Ординар</li>
						<li id="coupon_item_express">Экспресс</li>
						<li id="coupon_item_system">Система</li>
					</ul>
					<div id="coupon_item_normal_content" class="coupon_item_content">
						<div class="item">
							<span class="remove"></span>

							<label><input class="checkbox" type="checkbox" /> Милан - Интер Милан</label>
							<div class="selection">Быбор: <strong>Локомотив Москва</strong> <span>2.90</span></div>
						</div>
						<div class="item">
							<span class="remove"></span>
							<label><input class="checkbox" type="checkbox" /> Милан - Интер Милан</label>

							<div class="selection">Быбор: <strong>Локомотив Москва</strong> <span>2.90</span></div>
						</div>
					</div>
					<div id="coupon_item_express_content" class="coupon_item_content">
						
					</div>
					<div id="coupon_item_system_content" class="coupon_item_content">
						
					</div>

					<div class="coupon_actions">
						<label>Сумма ставки <input class="textfield" type="text" value="0.00" /></label>
						<div class="possible_winning">Возможный выигрыш <span>0.00 EUR</span></div>
						<input class="next_button" type="submit" value="Далее" />
					</div>
				</div>
			</div>

		</div>
	</div>
	<div id="main_content">
		<div id="left_actions">
			<ul>
				<li><a href="#">Все события (1346)</a></li>
				<li><a href="#">Баскетбол</a></li>
				<li><a href="#">Бейсбол</a></li>

				<li><a href="#">Бильярд. Снукер</a></li>
				<li><a href="#">Бокс</a></li>
				<li><a href="#">Водное поло</a></li>
				<li><a href="#">Волейбол</a></li>
				<li><a href="#">Гандбол</a></li>
				<li><a href="#">Пляжный футбол</a></li>

				<li><a href="#">Регби</a></li>
				<li><a href="#">Теннис</a></li>
				<li class="selected"><a href="#">Футбол</a>
					<div class="sub_actions">
						<div class="region">
							<h4>International</h4>
							<ul>

								<li><input id="italy_series_a" type="checkbox" /> <label for="italy_series_a">Италия  Серия А</label></li>
								<li><input id="club_friendlies_10" type="checkbox" /> <label for="club_friendlies_10">Club Friendlies (10)</label></li>
							</ul>
						</div>
						<div class="region">
							<h4>Argentina</h4>

							<ul>
								<li><input id="primera_division_22" type="checkbox" /> <label for="primera_division_22">Primera Division (22)</label></li>
							</ul>
						</div>
						<div class="region">
							<h4>Brazil</h4>
							<ul>

								<li><input id="brasileiro_a_190" type="checkbox" /> <label for="brasileiro_a_190">Brasileiro A (190)</label></li>
								<li><input id="brasileiro_b_60" type="checkbox" /> <label for="brasileiro_b_60">Brasileiro B (60)</label></li>
							</ul>
						</div>
					</div>
				</li>
				<li><a href="#">Хоккей на траве</a></li>

				<li><a href="#">Шахматы</a></li>
			</ul>
			<input class="update_button" type="submit" value="Обновить" />
		</div>
		<div id="content">
			<div class="sport">
				<h2>Футбол</h2>
				<!-- date starts here -->

				<div class="date">
					<!-- series list starts here -->
					<div class="series_list">
						<!-- series starts here -->
						<div class="series">
							<h4>Серия А, Италия</h4>
							<div class="games">
								
								<div class="header">

									<span class="blank_left_space"></span>
									<div class="rates_group">
										<span class="rate">П1</span><span class="rate">X</span><span class="rate">П2</span>
									</div>
									<div class="rates_group">
										<span class="rate">1X</span><span class="rate">12</span><span class="rate">X2</span>

									</div>
									<div class="rates_group">
										<span class="rate rate_f1">Ф1</span>
									</div>
									<div class="rates_group">
										<span class="rate rate_f2">Ф2</span>
									</div>
									<div class="rates_group">

										<span class="rate">Т</span>
									</div>
									<div class="rates_group">
										<span class="rate">ТБ</span>
									</div>
									<div class="rates_group">
										<span class="rate">ТМ</span>

									</div>
								</div>
								<!-- game starts here -->
								<div class="game game_live">
									<div class="game_main">
										<span class="time">20:45</span>
										<span class="team">Интер - Интер Милан</span>
										<div class="game_on_tv">

											<span>
												<strong>H2</strong> - Второй Телеканал Армении<br />
												<strong>EuroSport</strong><br />
												<strong>НТВ-Футбол</strong>
											</span>
										</div>

										<div class="rates_group">
											<span class="rate">8.42</span><span class="rate">0.70</span><span class="rate">4.64</span>
										</div>
										<div class="rates_group">
											<span class="rate">3.65</span><span class="rate">7.35</span><span class="rate">4.59</span>
										</div>

										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">4.49</span><span class="rate">2.91</span>
												<span class="arrow"></span>
											</div>
											<span class="rate">6.43</span>
										</div>

										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">5.35</span><span class="rate">4.78</span>
												<span class="arrow"></span>
											</div>
											<span class="rate">8.72</span>
										</div>

										<div class="rates_group">
											<span class="rate">7.29</span>
										</div>
										<div class="rates_group">
											<span class="rate">4.72</span>
										</div>
										<div class="rates_group">
											<span class="rate">0.56</span>

										</div>
										<div class="more_rates">+15</div>
										<div class="breaker"></div>
									</div>
								</div>
								
								<div class="game game_live">
									<div class="game_main">
										<span class="time">20:45</span>

										<span class="team">Милан - Интер Милан</span>
										<div class="game_on_tv">
											<span>
												<strong>H2</strong> - Второй Телеканал Армении<br />
												<strong>EuroSport</strong><br />
												<strong>НТВ-Футбол</strong>

											</span>
										</div>
										<div class="rates_group">
											<span class="rate">5.71</span><span class="rate">5.99</span><span class="rate">6.65</span>
										</div>
										<div class="rates_group">
											<span class="rate">8.32</span><span class="rate">9.09</span><span class="rate">0.33</span>

										</div>
										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">1.55</span><span class="rate">1.94</span>
												<span class="arrow"></span>
											</div>
											<span class="rate">5.25</span>

										</div>
										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">4.64</span><span class="rate">3.67</span>
												<span class="arrow"></span>
											</div>
											<span class="rate">1.16</span>

										</div>
										<div class="rates_group">
											<span class="rate">4.64</span>
										</div>
										<div class="rates_group">
											<span class="rate">5.15</span>
										</div>
										<div class="rates_group">

											<span class="rate">7.72</span>
										</div>
										<div class="more_rates">+15</div>
										<div class="breaker"></div>
									</div>
								</div>
								<!-- game ends here -->
							</div>

						</div>
						<!-- series ends here -->
					</div>
					<!-- series list ends here -->
				</div>
				
				<div class="date">
					<!-- series list starts here -->
					<div class="series_list">
						<!-- series starts here -->

						<div class="series">
							<h4>Серия А, Италия</h4>
							<div class="games">
								
								<div class="header">
									<span class="blank_left_space"></span>
									<div class="rates_group">
										<span class="rate">П1</span><span class="rate">X</span><span class="rate">П2</span>

									</div>
									<div class="rates_group">
										<span class="rate">1X</span><span class="rate">12</span><span class="rate">X2</span>
									</div>
									<div class="rates_group">
										<span class="rate rate_f1">Ф1</span>
									</div>

									<div class="rates_group">
										<span class="rate rate_f2">Ф2</span>
									</div>
									<div class="rates_group">
										<span class="rate">Т</span>
									</div>
									<div class="rates_group">
										<span class="rate">ТБ</span>

									</div>
									<div class="rates_group">
										<span class="rate">ТМ</span>
									</div>
								</div>
								<!-- game starts here -->
								<div class="game game_live">
									<div class="game_main">

										<span class="time">20:45</span>
										<span class="team">Милан - Интер Милан</span>
										<div class="game_on_tv">
											<span>
												<strong>H2</strong> - Второй Телеканал Армении<br />
												<strong>EuroSport</strong><br />

												<strong>НТВ-Футбол</strong>
											</span>
										</div>
										<div class="rates_group">
											<span class="rate">3.31</span><span class="rate">0.18</span><span class="rate">8.68</span>
										</div>
										<div class="rates_group">

											<span class="rate">4.97</span><span class="rate">1.31</span><span class="rate">8.58</span>
										</div>
										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">0.65</span><span class="rate">8.44</span>
												<span class="arrow"></span>

											</div>
											<span class="rate">8.58</span>
										</div>
										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">8.09</span><span class="rate">7.70</span>
												<span class="arrow"></span>

											</div>
											<span class="rate">4.68</span>
										</div>
										<div class="rates_group">
											<span class="rate">7.14</span>
										</div>
										<div class="rates_group">
											<span class="rate">5.70</span>

										</div>
										<div class="rates_group">
											<span class="rate">6.90</span>
										</div>
										<div class="more_rates">+15</div>
										<div class="breaker"></div>
									</div>
								</div>

								
								<div class="game game_live">
									<div class="game_main">
										<span class="time">20:45</span>
										<span class="team">Милан - Интер Милан</span>
										<div class="game_on_tv">
											<span>
												<strong>H2</strong> - Второй Телеканал Армении<br />

												<strong>EuroSport</strong><br />
												<strong>НТВ-Футбол</strong>
											</span>
										</div>
										<div class="rates_group">
											<span class="rate">2.12</span><span class="rate">8.52</span><span class="rate">9.01</span>

										</div>
										<div class="rates_group">
											<span class="rate">7.00</span><span class="rate">4.01</span><span class="rate">7.49</span>
										</div>
										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">7.22</span><span class="rate">4.27</span>

												<span class="arrow"></span>
											</div>
											<span class="rate">9.99</span>
										</div>
										<div class="rates_group">
											<div class="rate_double">
												<span class="rate">8.90</span><span class="rate">3.18</span>

												<span class="arrow"></span>
											</div>
											<span class="rate">2.19</span>
										</div>
										<div class="rates_group">
											<span class="rate">9.06</span>
										</div>
										<div class="rates_group">

											<span class="rate">4.74</span>
										</div>
										<div class="rates_group">
											<span class="rate">7.94</span>
										</div>
										<div class="more_rates">+15</div>
										<div class="breaker"></div>

									</div>
								</div>
								<!-- game ends here -->
							</div>
						</div>
						<!-- series ends here -->
					</div>
					<!-- series list ends here -->
				</div>

				<!-- date ends here -->
			</div>
		</div>
		<div class="breaker"></div>
		<div id="content_footer"></div>
	</div>
</div>
<div id="page_footer">
	<div class="content"></div>
</div>

</body>
</html>
--%>