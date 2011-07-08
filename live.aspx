<%@ Page Language="VB" AutoEventWireup="false" CodeFile="live.aspx.vb" Inherits="live" MasterPageFile="~/MastPage.master" %>
<%@ MasterType VirtualPath="~/MastPage.master" %>

<asp:content runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
            <div class="live">
				<h2 class="livetitle">Футбол</h2>
				
				<div class="count">				    
					<div class="counter">
                        <div id="liveGameId"></div>
						<div class="series-single">Серия А, Италия</div>
						<div id="series_title" class="series-title">Интер - Лацио</div>
						<div class="series-time">46:15</div>
						<div class="series-period">2й тайм</div>
						<div class="series-date">ПТ: 1:0</div>
						<div class="left"><div><div>2</div></div></div>
						<div class="right"><div><div>0</div></div></div>
					</div>
				</div>
				
				<div id="div_mathes_post_status"><h2 class="mathes_post_status"></h2></div>
				<div class="matches">               				
				</div>
				
			</div>
</asp:content>