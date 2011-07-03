<%@ Page Language="VB" AutoEventWireup="false" CodeFile="payment_cards.aspx.vb" Inherits="payment_cards"  MasterPageFile="~/MastPage.master"%>

<asp:content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
			<h2>Платежные карты "Еврофутбол"</h2>
			
			<div class="my_account_content account_payment_cards">
				<div class="account_payment_cards_filter">
					<label for="account_paymentcards_series">Серия</label> <input id="account_paymentcards_series" class="textfield" type="text" />

					<label for="account_paymentcards_from">С</label> <input id="account_paymentcards_from" class="textfield" type="text" />
					<label for="account_paymentcards_to">По</label> <input id="account_paymentcards_to" class="textfield" type="text" />
					<label>Статус</label>
					<select>
						<option>Непроданные</option>
					</select>

					<input class="filter_action_button" type="submit" value="обновить" />
				</div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<th>Серия</th>
						<th>Номер</th>
						<th>Сумма</th>

						<th>Статус</th>
						<th></th>
					</tr>
										<tr class="">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="paging">
						<td align="right" colspan="5">
							1 <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>

						</td>
					</tr>
				</table>
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
					<li><a class="account_link" href="account.aspx">Мой счет</a>
						<ul>
							<li><a class="account_link" href="account.aspx">Мои данные</a></li>
							<li><a class="account_link" href="account_history.aspx">История счета</a></li>
							<li><a class="account_link" href="rates_history.aspx">История ставок</a></li>

						</ul>
					</li>
					<li><a class="account_link" href="addmoney.aspx">Пополнить счет</a></li>
					<li><a class="account_link" href="withdraw.aspx">Снять деньги</a></li>
					<li><a class="account_link" href="payments.aspx">Выплаты</a></li>
					<li><a class="account_link account_link_selected" href="payment_cards.aspx">Карты оплаты</a></li>
				</ul>

			</div>
		</div>
		<div id="content">
			<h2>Платежные карты "Еврофутбол"</h2>
			
			<div class="my_account_content account_payment_cards">
				<div class="account_payment_cards_filter">
					<label for="account_paymentcards_series">Серия</label> <input id="account_paymentcards_series" class="textfield" type="text" />

					<label for="account_paymentcards_from">С</label> <input id="account_paymentcards_from" class="textfield" type="text" />
					<label for="account_paymentcards_to">По</label> <input id="account_paymentcards_to" class="textfield" type="text" />
					<label>Статус</label>
					<select>
						<option>Непроданные</option>
					</select>

					<input class="filter_action_button" type="submit" value="обновить" />
				</div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<th>Серия</th>
						<th>Номер</th>
						<th>Сумма</th>

						<th>Статус</th>
						<th></th>
					</tr>
										<tr class="">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="disabled">
						<td>1</td>
						<td><span>23567</span></td>
						<td><span>10 000</span></td>

						<td><span class="status">продан</span></td>
						<td><span class="change">изменить</span></td>
					</tr>
										<tr class="paging">
						<td align="right" colspan="5">
							1 <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>

						</td>
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
</html>--%>
