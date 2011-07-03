<%@ Page Language="VB" AutoEventWireup="false" CodeFile="addmoney.aspx.vb" Inherits="addmoney"  MasterPageFile="~/MastPage.master"%>

<asp:content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
<h2>Пополнить счет</h2>
			<div class="my_account_content add_money">
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_eurofootball">
						<div class="addmoney_icon"><img src="images/addmoney_icon_eurofootball.jpg" /></div>

						<div class="addmoney_name">Карта "Еврофутбол"</div>
						<div class="addmoney_address">Где можно преобрести?</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content addmoney_eurofootball_details">
						<div class="detail_item">
							<div class="title">Серия</div>

							<div class="detail"><input class="textfield" type="text" size="10" /><span class="valid_icon"></span></div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Номер</div>
							<div class="detail"><input class="textfield" type="text" size="15" /><span class="valid_icon"></span></div>
							<div class="breaker"></div>
						</div>

						<div class="detail_item">
							<div class="title">PIN-код</div>
							<div class="detail"><input class="textfield" type="text" size="4" /> - <input class="textfield" type="text" size="4" /> - <input class="textfield" type="text" size="4" /></div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">

							<div class="title">&nbsp;</div>
							<div class="detail">
								<input class="addmoney_details_action_button2" type="submit" value="OK" />
								<input class="addmoney_details_action_button2" type="submit" value="Отмена" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->

				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_edram">
						<div class="addmoney_icon"><img src="images/addmoney_icon_edram.jpg" /></div>
						<div class="addmoney_name">E-драм</div>
						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>

					<div class="addmoney_item_details_content">
						<div class="detail_item">
							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>
							<div class="breaker"></div>

						</div>
					</div>
				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_varca">
						<div class="addmoney_icon"><img src="images/addmoney_icon_varca.jpg" /></div>
						<div class="addmoney_name">Виртуальная карта ArCa</div>
						<div class="addmoney_address">&nbsp;</div>

						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_item">
							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />

								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_webmoney">

						<div class="addmoney_icon"><img src="images/addmoney_icon_webmoney.jpg" /></div>
						<div class="addmoney_name">WebMoney</div>
						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_item">

							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>

				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_mastercard">
						<div class="addmoney_icon"><img src="images/addmoney_icon_mastercard.jpg" /></div>
						<div class="addmoney_name">Master Card</div>
						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>

					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_item">
							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>

							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_banktransfer">
						<div class="addmoney_icon"><img src="images/addmoney_icon_banktransfer.jpg" /></div>
						<div class="addmoney_name">Банковский перевод</div>

						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_header">Пополнение счета путем перевода денег на наш банковский счет:</div>
						<div class="detail_item">
							<div class="title">Назначение</div>

							<div class="detail">Пополнение игрового счета 431 (Арсен Мерабян)</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Получатель</div>
							<div class="detail">ООО «Телеторият»</div>
							<div class="breaker"></div>

						</div>
						<div class="detail_item">
							<div class="title">Банк</div>
							<div class="detail">АРДШИНИНВЕСТБАНК</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Город</div>

							<div class="detail">Ереван</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Р/с</div>
							<div class="detail">2472300295450010 – Драм<br />
								2472300295450020 – Драм США<br />

								2472300295450050 – Евро<br />
								2472300295450040 – Рубль РФ<br />
							</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">S.W.I.F.T.</div>

							<div class="detail">ASHBAM22</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Платежка на сумму</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<select>

									<option>Драм</option>
								</select>
								<input class="addmoney_details_action_button" type="submit" value="Распечатать" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->

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
						<a class="account_link" href="account_details.aspx">Мой Профиль</a>

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
					<li><a class="account_link" href="account_details.aspx">Мой счет</a>
						<ul>
							<li><a class="account_link" href="account_details.aspx">Мои данные</a></li>
							<li><a class="account_link" href="account_history.aspx">История счета</a></li>
							<li><a class="account_link" href="rates_history.aspx">История ставок</a></li>

						</ul>
					</li>
					<li><a class="account_link account_link_selected" href="addmoney.aspx">Пополнить счет</a></li>
					<li><a class="account_link" href="withdraw.aspx">Снять деньги</a></li>
					<li><a class="account_link" href="payments.aspx">Выплаты</a></li>
					<li><a class="account_link" href="payment_cards.aspx">Карты оплаты</a></li>
				</ul>

			</div>
		</div>
		<div id="content">
			<h2>Пополнить счет</h2>
			<div class="my_account_content add_money">
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_eurofootball">
						<div class="addmoney_icon"><img src="images/addmoney_icon_eurofootball.jpg" /></div>

						<div class="addmoney_name">Карта "Еврофутбол"</div>
						<div class="addmoney_address">Где можно преобрести?</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content addmoney_eurofootball_details">
						<div class="detail_item">
							<div class="title">Серия</div>

							<div class="detail"><input class="textfield" type="text" size="10" /><span class="valid_icon"></span></div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Номер</div>
							<div class="detail"><input class="textfield" type="text" size="15" /><span class="valid_icon"></span></div>
							<div class="breaker"></div>
						</div>

						<div class="detail_item">
							<div class="title">PIN-код</div>
							<div class="detail"><input class="textfield" type="text" size="4" /> - <input class="textfield" type="text" size="4" /> - <input class="textfield" type="text" size="4" /></div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">

							<div class="title">&nbsp;</div>
							<div class="detail">
								<input class="addmoney_details_action_button2" type="submit" value="OK" />
								<input class="addmoney_details_action_button2" type="submit" value="Отмена" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->

				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_edram">
						<div class="addmoney_icon"><img src="images/addmoney_icon_edram.jpg" /></div>
						<div class="addmoney_name">E-драм</div>
						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>

					<div class="addmoney_item_details_content">
						<div class="detail_item">
							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>
							<div class="breaker"></div>

						</div>
					</div>
				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_varca">
						<div class="addmoney_icon"><img src="images/addmoney_icon_varca.jpg" /></div>
						<div class="addmoney_name">Виртуальная карта ArCa</div>
						<div class="addmoney_address">&nbsp;</div>

						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_item">
							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />

								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_webmoney">

						<div class="addmoney_icon"><img src="images/addmoney_icon_webmoney.jpg" /></div>
						<div class="addmoney_name">WebMoney</div>
						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_item">

							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>

				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_mastercard">
						<div class="addmoney_icon"><img src="images/addmoney_icon_mastercard.jpg" /></div>
						<div class="addmoney_name">Master Card</div>
						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>

					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_item">
							<div class="title">Сумма</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<input class="addmoney_details_action_button" type="submit" value="Отправить" />
							</div>

							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->
				
				<div class="addmoney_item">
					<div class="addmoney_item_details addmoney_banktransfer">
						<div class="addmoney_icon"><img src="images/addmoney_icon_banktransfer.jpg" /></div>
						<div class="addmoney_name">Банковский перевод</div>

						<div class="addmoney_address">&nbsp;</div>
						<div class="addmoney_action"><input type="button" class="addmoney_action_button" value="Пополнить" /></div>
						<div class="breaker"></div>
					</div>
					<div class="addmoney_item_details_content">
						<div class="detail_header">Пополнение счета путем перевода денег на наш банковский счет:</div>
						<div class="detail_item">
							<div class="title">Назначение</div>

							<div class="detail">Пополнение игрового счета 431 (Арсен Мерабян)</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Получатель</div>
							<div class="detail">ООО «Телеторият»</div>
							<div class="breaker"></div>

						</div>
						<div class="detail_item">
							<div class="title">Банк</div>
							<div class="detail">АРДШИНИНВЕСТБАНК</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Город</div>

							<div class="detail">Ереван</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Р/с</div>
							<div class="detail">2472300295450010 – Драм<br />
								2472300295450020 – Драм США<br />

								2472300295450050 – Евро<br />
								2472300295450040 – Рубль РФ<br />
							</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">S.W.I.F.T.</div>

							<div class="detail">ASHBAM22</div>
							<div class="breaker"></div>
						</div>
						<div class="detail_item">
							<div class="title">Платежка на сумму</div>
							<div class="detail">
								<input class="textfield" type="text" />
								<select>

									<option>Драм</option>
								</select>
								<input class="addmoney_details_action_button" type="submit" value="Распечатать" />
							</div>
							<div class="breaker"></div>
						</div>
					</div>
				</div> <!-- / addmoney_item -->

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