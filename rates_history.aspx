﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rates_history.aspx.vb" Inherits="rates_history"  MasterPageFile="~/MastPage.master"%>

<asp:content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
<%--MultiView ErrorCode --%>
            <h2>История ставок</h2>
			
			<div class="my_account_content account_history">
                <asp:MultiView ID="mvrates_history" runat="server" ActiveViewIndex="0">
                    <asp:View runat="server" ID="logon">
				        <%--<div class="account_history_filter">
					        <span>С</span>
					        <select>

						        <option>01</option>
					        </select>
					        <select>
						        <option>Сентябрь</option>
					        </select>
					        <select>
						        <option>2009</option>

					        </select>
					        <span>По</span>
					        <select>
						        <option>01</option>
					        </select>
					        <select>
						        <option>Сентябрь</option>

					        </select>
					        <select>
						        <option>2009</option>
					        </select>
					        <span>Все</span> <input class="checkbox" type="checkbox" />
					        <select>
						        <option>Тип операции</option>

					        </select>
					        <input class="filter_action_button" type="submit" value="обновить" />
				        </div>--%>
                        <div class="account_history_filter">
					        <span>С</span>
<%--					        <select>

						        <option>01</option>
					        </select>
					        <select>
						        <option>Сентябрь</option>
					        </select>
					        <select>
						        <option>2009</option>

					        </select>--%>
                            <asp:DropDownList ID="ddldayFrom" runat="server">
                                <asp:ListItem Value="01">01</asp:ListItem>                
                                <asp:ListItem Value="02">02</asp:ListItem>
                                <asp:ListItem Value="03">03</asp:ListItem>
                                <asp:ListItem Value="04">04</asp:ListItem>
                                <asp:ListItem Value="05">05</asp:ListItem>
                                <asp:ListItem Value="06">06</asp:ListItem>
                                <asp:ListItem Value="07">07</asp:ListItem>
                                <asp:ListItem Value="08">08</asp:ListItem>
                                <asp:ListItem Value="09">09</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                                <asp:ListItem Value="11">11</asp:ListItem>
                                <asp:ListItem Value="12">12</asp:ListItem>
                                <asp:ListItem Value="13">13</asp:ListItem>
                                <asp:ListItem Value="14">14</asp:ListItem>
                                <asp:ListItem Value="15">15</asp:ListItem>
                                <asp:ListItem Value="16">16</asp:ListItem>
                                <asp:ListItem Value="17">17</asp:ListItem>
                                <asp:ListItem Value="18">18</asp:ListItem>
                                <asp:ListItem Value="19">19</asp:ListItem>
                                <asp:ListItem Value="20">20</asp:ListItem>
                                <asp:ListItem Value="21">21</asp:ListItem>
                                <asp:ListItem Value="22">22</asp:ListItem>
                                <asp:ListItem Value="23">23</asp:ListItem>
                                <asp:ListItem Value="24">24</asp:ListItem>
                                <asp:ListItem Value="25">25</asp:ListItem>
                                <asp:ListItem Value="26">26</asp:ListItem>
                                <asp:ListItem Value="27">27</asp:ListItem>
                                <asp:ListItem Value="28">28</asp:ListItem>
                                <asp:ListItem Value="29">29</asp:ListItem>
                                <asp:ListItem Value="30">30</asp:ListItem>
                                <asp:ListItem Value="31">31</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlmonthFrom" runat="server">
                                <asp:ListItem Value="01">январь</asp:ListItem>                
                                <asp:ListItem Value="02">февраль</asp:ListItem>
                                <asp:ListItem Value="03">март</asp:ListItem>
                                <asp:ListItem Value="04">апрель</asp:ListItem>
                                <asp:ListItem Value="05">май</asp:ListItem>
                                <asp:ListItem Value="06">июнь</asp:ListItem>
                                <asp:ListItem Value="07">июль</asp:ListItem>
                                <asp:ListItem Value="08">август</asp:ListItem>
                                <asp:ListItem Value="09">сентябрь</asp:ListItem>
                                <asp:ListItem Value="10">октябрь</asp:ListItem>
                                <asp:ListItem Value="11">ноябрь</asp:ListItem>
                                <asp:ListItem Value="12">декабрь</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlyearFrom" runat="server">                                
                                <asp:ListItem Value="2010">2010</asp:ListItem>                                                                                                       
                                <asp:ListItem Value="2011">2011</asp:ListItem>  
                                <asp:ListItem Value="2012">2012</asp:ListItem>
                                <asp:ListItem Value="2013">2013</asp:ListItem>
                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                <asp:ListItem Value="2015">2015</asp:ListItem>
                                <asp:ListItem Value="2016">2016</asp:ListItem>
                                <asp:ListItem Value="2017">2017</asp:ListItem>
                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                <asp:ListItem Value="2019">2019</asp:ListItem>
                                <asp:ListItem Value="2020">2020</asp:ListItem>
                                <asp:ListItem Value="2021">2021</asp:ListItem>
                            </asp:DropDownList>
					        <span>По</span>
					        <%--<select>
						        <option>01</option>
					        </select>
					        <select>
						        <option>Сентябрь</option>

					        </select>
					        <select>
						        <option>2009</option>
					        </select>--%>
                            <asp:DropDownList ID="ddldayTo" runat="server">
                                <asp:ListItem Value="01">01</asp:ListItem>                
                                <asp:ListItem Value="02">02</asp:ListItem>
                                <asp:ListItem Value="03">03</asp:ListItem>
                                <asp:ListItem Value="04">04</asp:ListItem>
                                <asp:ListItem Value="05">05</asp:ListItem>
                                <asp:ListItem Value="06">06</asp:ListItem>
                                <asp:ListItem Value="07">07</asp:ListItem>
                                <asp:ListItem Value="08">08</asp:ListItem>
                                <asp:ListItem Value="09">09</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                                <asp:ListItem Value="11">11</asp:ListItem>
                                <asp:ListItem Value="12">12</asp:ListItem>
                                <asp:ListItem Value="13">13</asp:ListItem>
                                <asp:ListItem Value="14">14</asp:ListItem>
                                <asp:ListItem Value="15">15</asp:ListItem>
                                <asp:ListItem Value="16">16</asp:ListItem>
                                <asp:ListItem Value="17">17</asp:ListItem>
                                <asp:ListItem Value="18">18</asp:ListItem>
                                <asp:ListItem Value="19">19</asp:ListItem>
                                <asp:ListItem Value="20">20</asp:ListItem>
                                <asp:ListItem Value="21">21</asp:ListItem>
                                <asp:ListItem Value="22">22</asp:ListItem>
                                <asp:ListItem Value="23">23</asp:ListItem>
                                <asp:ListItem Value="24">24</asp:ListItem>
                                <asp:ListItem Value="25">25</asp:ListItem>
                                <asp:ListItem Value="26">26</asp:ListItem>
                                <asp:ListItem Value="27">27</asp:ListItem>
                                <asp:ListItem Value="28">28</asp:ListItem>
                                <asp:ListItem Value="29">29</asp:ListItem>
                                <asp:ListItem Value="30">30</asp:ListItem>
                                <asp:ListItem Value="31">31</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlmonthTo" runat="server">
                                <asp:ListItem Value="01">январь</asp:ListItem>                
                                <asp:ListItem Value="02">февраль</asp:ListItem>
                                <asp:ListItem Value="03">март</asp:ListItem>
                                <asp:ListItem Value="04">апрель</asp:ListItem>
                                <asp:ListItem Value="05">май</asp:ListItem>
                                <asp:ListItem Value="06">июнь</asp:ListItem>
                                <asp:ListItem Value="07">июль</asp:ListItem>
                                <asp:ListItem Value="08">август</asp:ListItem>
                                <asp:ListItem Value="09">сентябрь</asp:ListItem>
                                <asp:ListItem Value="10">октябрь</asp:ListItem>
                                <asp:ListItem Value="11">ноябрь</asp:ListItem>
                                <asp:ListItem Value="12">декабрь</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlyearTo" runat="server">
                                <asp:ListItem Value="2010">2010</asp:ListItem>                                                                                                       
                                <asp:ListItem Value="2011" selected="selected">2011</asp:ListItem>  
                                <asp:ListItem Value="2012">2012</asp:ListItem>
                                <asp:ListItem Value="2013">2013</asp:ListItem>
                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                <asp:ListItem Value="2015">2015</asp:ListItem>
                                <asp:ListItem Value="2016">2016</asp:ListItem>
                                <asp:ListItem Value="2017">2017</asp:ListItem>
                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                <asp:ListItem Value="2019">2019</asp:ListItem>
                                <asp:ListItem Value="2020">2020</asp:ListItem>
                                <asp:ListItem Value="2021">2021</asp:ListItem>                                                                                                       
                            </asp:DropDownList>
					        <%--<span>Все</span> <input class="checkbox" type="checkbox" />--%>
<%--                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="all">Все</asp:ListItem>    
                                <asp:ListItem Value="activity">Активна</asp:ListItem>
                                <asp:ListItem Value="cancel">Отмена</asp:ListItem>
                                <asp:ListItem Value="loss">Проигрыш</asp:ListItem>
                                <asp:ListItem Value="return">Возврат</asp:ListItem>
                                <asp:ListItem Value="win">Выигрыш</asp:ListItem>
                            </asp:DropDownList>--%>
					        <%--<select>
						        <option>Тип операции</option>

					        </select>--%>
					        <input class="filter_action_button" type="submit" value="обновить" />
				        </div>
				        <table width="100%" cellpadding="0" cellspacing="0">
					        <tr>
						        <th width="30">No</th>
						        <th width="80">Дата</th>
						        <th width="330">Событие</th>

						        <th>Ставка</th>
						        <th>Сумма</th>
						        <th>Коэф</th>
						        <th>Состояние</th>
					        </tr>
					        <%--<tr>
						        <td width="30">1779</td>

						        <td width="80">25.10.09 18:17</td>
						        <td width="330">Тенис<br />
							        Токио. Ьард. Муж<br />
							        Монфилс Г — Вавринка С<br />
							        (NTV+tennis, NTV+online, AI Jazeera sport-2, AI Jazzera sport+7)
						        </td>
						        <td>3 сет: П1 (победит Менфилс Г)</td>

						        <td>1000,00 драм</td>
						        <td>1,77</td>
						        <td>выигрыш 1 770,00 не оплачен</td>
					        </tr>--%>
                            <%--<asp:PlaceHolder ID="phexpressBet" runat="server" Visible="False">--%>
                                <asp:ListView ID="lvexpressbet" runat="server" ItemPlaceholderID="expressbetiplaceholder" Visible="False">
							        <LayoutTemplate>
								        <span id="expressbetiplaceholder" runat="server"></span>
							        </LayoutTemplate>
							        <ItemTemplate>
                                        <tr class="express">
						                    <td colspan="7">
							                    <table width="100%" cellpadding="0" cellspacing="0">

								                    <tr>
									                    <td width="30"><%# Eval("Id") %><%--1780--%></td>
									                    <td width="80"><%--<%# CDate(Eval("GameDate")).ToString("dd.MM.yyyy HH:mm")%>--%><%--25.10.09 18:17--%></td>
									                    <td width="330">Экспресс</td>
									                    <td></td>
									                    <td></td>
									                    <td></td>

									                    <td></td>
								                    </tr>
							                    </table>
							                    <table class="details" width="100%" cellpadding="0" cellspacing="0">
                                                    <asp:ListView ID="lvexpressbetDetail" runat="server" ItemPlaceholderID="expressbetDetailiplaceholder" DataSource='<%#Eval("Details") %>'>
							                            <LayoutTemplate>
								                            <span id="expressbetDetailiplaceholder" runat="server"></span>
							                            </LayoutTemplate>
							                            <ItemTemplate>
                                                            <tr>
									                            <td width="30"><%# Eval("Id") %><%--1780--%></td>
									                            <td width="80"><%# CDate(Eval("GameDate")).ToString("dd.MM.yyyy HH:mm")%><%--25.10.09 18:17--%></td>
									                            <td width="330"><%# Eval("Sportname")%></td>

									                            <td><%# Eval("Name")%></td>
									                            <td><%# Eval("BetSum").ToString()%> <%--<%# Eval("BetCurrency")%>--%></td>
									                            <td><%# Eval("Odd")%><%--1,77--%></td>
									                            <td><%# Eval("Status")%> НА МОМЕНТ РЕАЛИЗАЦИИ Dictionary.BetStatuses ОТСУТСТВУЕТ<%--выигрыш 1 770,00 не оплачен--%></td>
								                            </tr>
                                                        </ItemTemplate>
                                                    </asp:ListView>								            
        <%--								            <tr>
									                    <td width="30">1780</td>

									                    <td width="80">25.10.09 18:17</td>
									                    <td width="330">Тенис</td>
									                    <td>3 сет: П1 (победит Менфилс Г)</td>
									                    <td>1000,00 драм</td>
									                    <td>1,77</td>
									                    <td>выигрыш 1 770,00 не оплачен</td>

								                    </tr>--%>
							                    </table>
						                    </td>
					                    </tr>
                                        <%--<span class="sub_rate_label"><%# Eval("Name")%></span><span class="rate"><%# Eval("Odd") %></span>--%>
                                    </ItemTemplate>                                            
                                </asp:ListView>

                                <asp:ListView ID="lvsimpleBetList" runat="server" ItemPlaceholderID="simpleBetiplaceholder" Visible="False">
							        <LayoutTemplate>
								        <span id="simpleBetiplaceholder" runat="server"></span>
							        </LayoutTemplate>
							        <ItemTemplate>
								        <tr>
									        <td width="30"><%# Eval("Id") %><%--1780--%></td>
									        <td width="80"><%# CDate(Eval("GameDate")).ToString("dd.MM.yyyy HH:mm")%><%--25.10.09 18:17--%></td>
									        <td width="330">                                            
                                                <%# Eval("SportName")%><%--Тенис--%><br />
							                    <%# Eval("ChampionshipName")%><%--Токио. Ьард. Муж--%><br />
							                    <%# Eval("Player1Name")%> - <%# Eval("Player2Name")%><%--Монфилс Г — Вавринка С--%><br />
							                    <%--<%# Eval("Id") %>--%><%--(NTV+tennis, NTV+online, AI Jazeera sport-2, AI Jazzera sport+7)--%>
                                            </td>
									        <td><%# Eval("Name")%></td>
									        <td><%# Eval("BetSum")%> <%# Eval("BetCurrency")%></td>
									        <td><%# Eval("Odd")%></td>
									        <td><%# Eval("Status")%> НА МОМЕНТ РЕАЛИЗАЦИИ Dictionary.BetStatuses ОТСУТСТВУЕТ</td>
								        </tr>
                                        <%--<span class="sub_rate_label"><%# Eval("Name")%></span><span class="rate"><%# Eval("Odd") %></span>--%>
                                    </ItemTemplate>                                            
                                </asp:ListView>
                            <%--</asp:PlaceHolder>--%>					
					
        <%--					<tr>
						        <td width="30">1779</td>
						        <td width="80">25.10.09 18:17</td>
						        <td width="330">Тенис<br />

							        Токио. Ьард. Муж<br />
							        Монфилс Г — Вавринка С<br />
							        (NTV+tennis, NTV+online, AI Jazeera sport-2, AI Jazzera sport+7)
						        </td>
						        <td>3 сет: П1 (победит Менфилс Г)</td>
						        <td>1000,00 драм</td>
						        <td>1,77</td>

						        <td>выигрыш 1 770,00 не оплачен</td>
					        </tr>--%>
				        </table>                    
                    </asp:View>
                    <asp:View runat="server" ID="notlogon">
                        <center>
                            <h2><asp:Label ID="lblstatus" runat="server" Text=""></asp:Label></h2>
                        </center>
                    </asp:View>
                </asp:MultiView>

			</div>
</asp:content>

<%--
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
				<div class="my_account">
					<h2>Добро пожаловать! <span>Арсен Мерабян</span></h2>
					<div class="my_account_links">
						<a class="account_link" href="account.aspx">Мой Профиль</a>

						<a class="add_money_link" href="addmoney.aspx">Пополнить счет</a>
						<a class="remove_money_link" href="withdraw.aspx">Снять деньги</a>
					</div>
				</div>
				
				<div class="logout_box">
					<h2>Выйти</h2>
					<a class="logout_link" href="default.aspx">выход</a>

				</div>
			</div>
		</div>
		<div id="header_bottom">
			<ul class="top_menu">
				<li><a href="default.aspx">Ставки</a></li>
				<li class="live"><a href="live.aspx"><strong>LIVE</strong> ставки</a></li>

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
		<div class="top_current_balance">
			<span>Ваш текущий баланс</span> <strong>125,000.00 AMD</strong>

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
	<div id="main_content" class="my_account_container">
		<div id="left_actions">
			<div class="my_account">

				<h2>Мой Профиль</h2>
				<ul>
					<li class="account_link_expanded"><a class="account_link" href="account.aspx">Мой счет</a>
						<ul>
							<li><a class="account_link" href="account.aspx">Мои данные</a></li>
							<li><a class="account_link" href="account_history.aspx">История счета</a></li>
							<li><a class="account_link account_link_selected" href="rates_history.aspx">История ставок</a></li>

						</ul>
					</li>
					<li><a class="account_link" href="addmoney.aspx">Пополнить счет</a></li>
					<li><a class="account_link" href="withdraw.aspx">Снять деньги</a></li>
					<li><a class="account_link" href="payments.aspx">Выплаты</a></li>
					<li><a class="account_link" href="payment_cards.aspx">Карты оплаты</a></li>
				</ul>

			</div>
		</div>
		<div id="content">
			<h2>История ставок</h2>
			
			<div class="my_account_content account_history">
				<div class="account_history_filter">
					<span>С</span>
					<select>

						<option>01</option>
					</select>
					<select>
						<option>Сентябрь</option>
					</select>
					<select>
						<option>2009</option>

					</select>
					<span>По</span>
					<select>
						<option>01</option>
					</select>
					<select>
						<option>Сентябрь</option>

					</select>
					<select>
						<option>2009</option>
					</select>
					<span>Все</span> <input class="checkbox" type="checkbox" />
					<select>
						<option>Тип операции</option>

					</select>
					<input class="filter_action_button" type="submit" value="обновить" />
				</div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<th width="30">No</th>
						<th width="80">Дата</th>
						<th width="330">Событие</th>

						<th>Ставка</th>
						<th>Сумма</th>
						<th>Коэф</th>
						<th>Состояние</th>
					</tr>
					<tr>
						<td width="30">1779</td>

						<td width="80">25.10.09 18:17</td>
						<td width="330">Тенис<br />
							Токио. Ьард. Муж<br />
							Монфилс Г — Вавринка С<br />
							(NTV+tennis, NTV+online, AI Jazeera sport-2, AI Jazzera sport+7)
						</td>
						<td>3 сет: П1 (победит Менфилс Г)</td>

						<td>1000,00 драм</td>
						<td>1,77</td>
						<td>выигрыш 1 770,00 не оплачен</td>
					</tr>
					
					<tr class="express">
						<td colspan="7">
							<table width="100%" cellpadding="0" cellspacing="0">

								<tr>
									<td width="30">1780</td>
									<td width="80">25.10.09 18:17</td>
									<td width="330">Экспресс</td>
									<td></td>
									<td></td>
									<td></td>

									<td></td>
								</tr>
							</table>
							<table class="details" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td width="30">1780</td>
									<td width="80">25.10.09 18:17</td>
									<td width="330">Тенис</td>

									<td>3 сет: П1 (победит Менфилс Г)</td>
									<td>1000,00 драм</td>
									<td>1,77</td>
									<td>выигрыш 1 770,00 не оплачен</td>
								</tr>
								<tr>
									<td width="30">1780</td>

									<td width="80">25.10.09 18:17</td>
									<td width="330">Тенис</td>
									<td>3 сет: П1 (победит Менфилс Г)</td>
									<td>1000,00 драм</td>
									<td>1,77</td>
									<td>выигрыш 1 770,00 не оплачен</td>

								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td width="30">1779</td>
						<td width="80">25.10.09 18:17</td>
						<td width="330">Тенис<br />

							Токио. Ьард. Муж<br />
							Монфилс Г — Вавринка С<br />
							(NTV+tennis, NTV+online, AI Jazeera sport-2, AI Jazzera sport+7)
						</td>
						<td>3 сет: П1 (победит Менфилс Г)</td>
						<td>1000,00 драм</td>
						<td>1,77</td>

						<td>выигрыш 1 770,00 не оплачен</td>
					</tr>
				</table>
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