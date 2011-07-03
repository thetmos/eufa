<%@ Page Language="VB" AutoEventWireup="false" CodeFile="results.aspx.vb" Inherits="results" MasterPageFile="~/MastPage.master"%>
<%@ MasterType VirtualPath="~/MastPage.master" %>

<asp:content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >     
<div id="sports_bet_list">
	
	<asp:MultiView ID="mvresults" runat="server" ActiveViewIndex="0">
		<asp:View runat="server" ID="logon">
			
			<asp:ListView ID="lvSports" runat="server" ItemPlaceholderID="sportsIplaceholder">
				<LayoutTemplate>
					<span id="sportsIplaceholder" runat="server"></span>
				</LayoutTemplate>
				<ItemTemplate>  
                <div class="sport">
					<h2><%# Eval("Name")%></h2>
					<!-- date starts here -->
					<div class="date">
						<!-- series list starts here -->
						<div class="series_list">					                    
							<asp:ListView ID="lvChampionships" runat="server" ItemPlaceholderID="championshipsIplaceholder" DataSource='<%#Eval("Championships") %>'>
								<LayoutTemplate>
									<span id="championshipsIplaceholder" runat="server"></span>
								</LayoutTemplate>
								<ItemTemplate>
								<!-- series starts here -->
									<div class="series results_series"  id="<%# Eval("Id")%>">
										<div class="header">
											<div class="seria"><%# Eval("Name")%><%--Серия А, Италия--%></div>
											<div class="score">Счет</div>
											<div class="first_half">1-ый тайм</div>
											<div class="status">Статус</div>
											<div class="view_more"></div>

											<div class="notes"></div>
										</div>
										<div class="games results_games">	
											<asp:ListView ID="lvGames" runat="server" ItemPlaceholderID="gamesIplaceholder" DataSource='<%#Eval("Games") %>'>
												<LayoutTemplate>
													<span id="gamesIplaceholder" runat="server"></span>
												</LayoutTemplate>
												<ItemTemplate>		
													<!-- game starts here -->
													<div class="game">
														<div class="game_main">
															<span class="time"><%# CType(Eval("GameDate"), Date).ToString("t")%><%--20:45--%></span>
															<span class="team"><%# CType(Eval("Player1"), WebReference.Player).Name%>  - <%# CType(Eval("Player2"), WebReference.Player).Name%><%--Интер - Интер Милан--%></span>
															<span class="score">1 - 3</span>

															<span class="first_half">0 - 2</span>
															<div class="status"><%#Eval("Status") %></div>
															<div class="<%#Iif(Ctype(Eval("Results"), webreference.Result()).count>0, "view_more_active", "view_more_inactive") %>"></div>
															<div class="notes_active"></div>
															<div class="breaker"></div>
														</div>
														<div class="game_main_results">
															<asp:ListView ID="lvResults" runat="server" ItemPlaceholderID="resultsIplaceholder" DataSource='<%#Eval("Results") %>'>
																<LayoutTemplate>
																	<span id="resultsIplaceholder" runat="server"></span>
																</LayoutTemplate>
																<ItemTemplate>	
																	<div class="game_main_result">
																		<span class="result_type"><%# Eval("PeriodNr")%><%--Первый гол--%></span>
																		<span class="result_score"><%# IIf(CInt(Eval("Score1")) = Integer.MinValue, "", Eval("Score1"))%>   <%# IIf(CInt(Eval("Score2")) = Integer.MinValue, "", Eval("Score2"))%>   <%# IIf(CInt(Eval("Score3")) = Integer.MinValue, "", Eval("Score3"))%><%--Интер Милан--%></span>
																	</div>
																</ItemTemplate> 
															</asp:ListView> 													        													        
														</div>
													</div>
													<!-- game ends here -->		                                                
												</ItemTemplate> 
											</asp:ListView>																		
										</div>
									</div>
							<!-- series ends here -->
								</ItemTemplate>
							</asp:ListView> 
										
						</div>
						<!-- series list ends here -->
					</div>
                    </div>
				</ItemTemplate>
			</asp:ListView> 
			
			<!-- date ends here -->
		</asp:View> 
		<asp:View runat="server" ID="notlogon">
				<center>
					<h2><asp:Label ID="lblstatus" runat="server" Text=""></asp:Label></h2>
				</center>
			</asp:View>
	</asp:MultiView>
				
	
</div>   	
</asp:content>

<%--<%@ Page Language="VB" AutoEventWireup="false" CodeFile="results.aspx.vb" Inherits="results" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Еврофутбол</title>
<link rel="stylesheet" type="text/css" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/datepicker/jquery-datepicker.css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-datepicker.min.js"></script>
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
				<li class="live"><a href="live.aspx"><strong>LIVE</strong> ставки</a></li>
				<li class="selected"><a href="results.aspx">Результаты</a></li>

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
			<div class="results_top_filter">
				<h3>Дата</h3>

				<div class="date_filter"><input id="date_filter_input" type="text" value="" readonly="readonly" /></div>
				<h3>Поиск</h3>
				<div class="search_filter">
					<input class="textfield" type="text" /><input class="search_button" type="submit" value="OK" />
				</div>
			</div>
			
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

						<div class="series results_series">
							<div class="header">
								<div class="seria">Серия А, Италия</div>
								<div class="score">Счет</div>
								<div class="first_half">1-ый тайм</div>
								<div class="status">Статус</div>
								<div class="view_more"></div>

								<div class="notes"></div>
							</div>
							<div class="games results_games">
								
								<!-- game starts here -->
								<div class="game">
									<div class="game_main">
										<span class="time">20:45</span>
										<span class="team">Интер - Интер Милан</span>

										<span class="score">1 - 3</span>
										<span class="first_half">0 - 2</span>
										<div class="status">Закончен</div>
										<div class="view_more_inactive"></div>
										<div class="notes_inactive"></div>
										<div class="breaker"></div>
									</div>

								</div>
								<!-- game ends here -->
								<!-- game starts here -->
								<div class="game">
									<div class="game_main">
										<span class="time">20:45</span>
										<span class="team">Интер - Интер Милан</span>
										<span class="score">1 - 3</span>

										<span class="first_half">0 - 2</span>
										<div class="status">Закончен</div>
										<div class="view_more_active"></div>
										<div class="notes_active"></div>
										<div class="breaker"></div>
									</div>
									<div class="game_main_results">
										<div class="game_main_result">

											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>

										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>

										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>

											<span class="result_score">Интер Милан</span>
										</div>
									</div>
								</div>
								<!-- game ends here -->
								<!-- game starts here -->
								<div class="game">
									<div class="game_main">

										<span class="time">20:45</span>
										<span class="team">Интер - Интер Милан</span>
										<span class="score">1 - 3</span>
										<span class="first_half">0 - 2</span>
										<div class="status">Закончен</div>
										<div class="view_more_active"></div>

										<div class="notes_inactive"></div>
										<div class="breaker"></div>
									</div>
									<div class="game_main_results">
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>

										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>

										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>

											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">

											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>

										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>
										</div>
										<div class="game_main_result">
											<span class="result_type">Первый гол</span>
											<span class="result_score">Интер Милан</span>

										</div>
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