<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" MasterPageFile="~/MastPage.master" %>
<%--<%@ OutputCache Duration="300" VaryByParam="None" %>--%>
<%@ MasterType VirtualPath="~/MastPage.master" %>

<asp:content runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
    
	<div id="sports_bet_list">
		<asp:MultiView ID="mvdefault" runat="server" ActiveViewIndex="0">
			<asp:View runat="server" ID="default">
				<asp:Literal ID="litBetStatus" runat="server"></asp:Literal>
				<div id="startMessage"><h2><center>Выберите игру из списка слева.</center></h2></div>
				<div class="onebet_popup" id="onebet_popup">
					<div class="preheader"></div>
					<center><div class="header_onebet">Заголовок</div></center>
					<input class="textfield" id="bet_sum" type="text" value="">
					<input class="do_button" id="make_onebet" type="button" value="">
					<div class="onebet_buttons">
						<input class="add_button" id="add_bet" type="button" value="">
                        <div class="add_word"><b>Добавить</b></div>
						<input class="cancel_button" id="cancel_bet" type="button" value="">
                        <div class="cancel_word"><b>Отменить</b></div>
					</div>
					<div class="divtext"><span class="onebet_text"></span></div>
					<div class="footer_onebet">Максимальная ставка <div class="maxbetsum"></div> <div class="betcurrency"></div></div>
					<div class="onebet">
						<div class="onebet_id"></div>
						<div class="onebet_odd"></div>
						<div class="onebet_title"></div>
						<div class="onebet_players"></div>
						<div class="onebet_gameId"></div>			
					</div>			
				</div>
<asp:ListView ID="lvSportsWDList" runat="server" ItemPlaceholderID="sportsWDListIplaceholder">
	<LayoutTemplate>
		<span id="sportsWDListIplaceholder" runat="server"></span>
	</LayoutTemplate>
	<ItemTemplate>  
			<div class="sport" id="sportBet_<%# Eval("Id")%>">
				<h2><%# Eval("Name")%></h2>
				<!-- date starts here -->
				
				<asp:ListView ID="lvGameDateList" runat="server" ItemPlaceholderID="gameDateListiplaceholder" DataSource='<%# Eval("Gamedatelist") %>'>
					<LayoutTemplate>
						<span id="gameDateListiplaceholder" runat="server"></span>
					</LayoutTemplate>
					<ItemTemplate>
				<div id="sportBetDate_<%# Eval("SportNum")%>_<%# Eval("Gamedate").Replace(".", "")%>" class="date">
					<h3><span></span><%# Eval("Gamedate")%></h3>
					<!-- series list starts here -->

					<div class="series_list"><!--AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA--!>
						<!-- series starts here -->
				<asp:ListView ID="lvChampsList" runat="server" ItemPlaceholderID="gameDateListiplaceholder" DataSource='<%# Eval("ChampDict") %>'>
					<LayoutTemplate>
						<span id="gameDateListiplaceholder" runat="server"></span>
					</LayoutTemplate>
					<ItemTemplate>



<div class="series" id="<%# Eval("Key").ToString()%>">
        <h4><%# IIf(Eval("Value").Country<>"", Eval("Value").Country+". ", "")%><%# Eval("Value").Name%>. <%# IIf(Eval("Value").Comment<>"", Eval("Value").Comment+".", "")%></h4>
        <div id="sportBetDateGames_<%# Eval("Value").SportNum%>_<%# Eval("Value").Gamedate.Replace(".", "")%>" class="games">
                                
            <div class="header">
                <span class="blank_left_space"></span>

                <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value").GameMainTitle.Main %>'>
                    <LayoutTemplate>
                        <span id="gamelistiplaceholder" runat="server"></span>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="rates_group">

                            <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Container.DataItem %>'>
                                <LayoutTemplate>
                                    <span id="gamelistiplaceholder" runat="server"></span>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <span class="rate <%# Iif(Ctype(Eval("Value"), List(Of xmlBet))(0).typecode=86 orelse Ctype(Eval("Value"), List(Of xmlBet))(0).typecode=87, "rate_f1", "") %>"><%# Eval("Key")%></span>
                                </ItemTemplate> 
                            </asp:ListView>

                        </div>                    
                    </ItemTemplate> 
                </asp:ListView> 
            </div>

            <!-- game starts here -->
            <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value").Gamelist %>'>
                <LayoutTemplate>
                    <span id="gamelistiplaceholder" runat="server"></span>
                </LayoutTemplate>
                <ItemTemplate>
            <div id="<%# Eval("Id")%>" class="game <%# IIf(Eval("Comments") <> "" orelse Eval("IsLive") <> "0", "game_live", "")%>" >
            <div class="game_main">
                
                <span class="time <%# IIf(Eval("IsLive")="1", "dateyellow"" title=""Будет Live-прием", "")%>"><%# CType(Eval("GameDate"), Date).ToString("t")%></span>
                
                <span class="team"><%# CType(Eval("Player1"), WebReference.Player).Name%>  - <%# CType(Eval("Player2"), WebReference.Player).Name%></span>                
                <%# IIf(Eval("PrintComment") <> "", "<div class=""game_print_comment""><span>" + Eval("PrintComment") + "</span></div>", "<div class=""empty_comment"">&nbsp;</div>")%>
                <%# IIf(Eval("Comments") <> "", "<div class=""game_on_tv""><span>" + Eval("Comments") + "</span></div>", "<div class=""empty_comment"">&nbsp;</div>")%>                
                            <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("EventsMain") %>'>
                                <LayoutTemplate>
                                    <span id="gamelistiplaceholder" runat="server"></span>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="rates_group">
                                        <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Container.DataItem %>'>
                                            <LayoutTemplate>
                                                <span id="gamelistiplaceholder" runat="server"></span>
                                            </LayoutTemplate>
                                            <ItemTemplate>
                                            <%# IIf(Eval("Value").ToString() = "many", "<div class=""rate_double"">", "")%>

                                                <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Key") %>'>
                                                    <LayoutTemplate>
                                                        <span id="gamelistiplaceholder" runat="server"></span>
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                    <%# IIf(CType(Container.DataItem, WebReference.Event).Id = -2, IIf(CType(Container.DataItem, WebReference.Event).Total > 0, "<span class=""rate_disabled"" id=""---"" title=""Total"">" + CType(Container.DataItem, WebReference.Event).Total.ToString("N2").Replace(",", ".") + "</span>", ""), "")%>
                                                    <%# IIf(CType(Container.DataItem, WebReference.Event).Id > -1, "<span class=""" + IIf(CType(Container.DataItem, WebReference.Event).TypeCode = 86 OrElse CType(Container.DataItem, WebReference.Event).TypeCode = 87, "rate_f", "rate") + """ " + IIf(CType(Container.DataItem, WebReference.Event).TypeCode <> 86 OrElse CType(Container.DataItem, WebReference.Event).TypeCode <> 87, "id=""" + CType(Container.DataItem, WebReference.Event).Id.ToString() + """", "") + " title=""" + CType(Container.DataItem, WebReference.Event).Name + """>" + IIf(CType(Container.DataItem, WebReference.Event).TypeCode = 86 OrElse CType(Container.DataItem, WebReference.Event).TypeCode = 87, IIf(CType(Container.DataItem, WebReference.Event).Allowance > 0, "+", "") + CType(Container.DataItem, WebReference.Event).Allowance.ToString("N2").Replace(",", "."), CType(Container.DataItem, WebReference.Event).Odd.ToString("N2").Replace(",", ".")) + "</span>", IIf(CType(Container.DataItem, WebReference.Event).Id <> -2, "<span class=""rate_disabled"" id=""---"" title=""---"">---</span>", ""))%>
                                                        <%--<span  <%# IIf(CType(Container.DataItem, WebReference.Event).Id<>-1, IIf(CType(Container.DataItem, WebReference.Event).Total<>0, "class=""rate_disabled"" id=""---"" title=""Total"">"+CType(Container.DataItem, WebReference.Event).Total.Tostring()+"</span><span ", "")+"class=""rate"" id="""+CType(Container.DataItem, WebReference.Event).Id.ToString()+""" title="""+CType(Container.DataItem, WebReference.Event).Name+""">"+CType(Container.DataItem, WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>--%>
                                                        <%--<span  <%# IIf(CType(Container.DataItem, WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Container.DataItem, WebReference.Event).Id.ToString()+""" title="""+CType(Container.DataItem, WebReference.Event).Name+""">"+CType(Container.DataItem, WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>--%>
                                                    <%--<span  <%# IIf(CType(Eval("Ev_P1"), WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Eval("Ev_P1"), WebReference.Event).Id.ToString()+""" title="""+CType(Eval("Ev_P1"), WebReference.Event).Name+""">"+CType(Eval("Ev_P1"), WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>--%>
                                                    </ItemTemplate>
                                                </asp:ListView>

                                            <%# IIf(Eval("Value").ToString() = "many", "</div>" + IIf(CType(Eval("Key"), List(Of WebReference.Event))(0).Odd <> 0, "<span class=""rate"" id=""" + CType(Eval("Key"), List(Of WebReference.Event))(0).Id.ToString() + """ title=""" + CType(Eval("Key"), List(Of WebReference.Event))(0).Name + """>" + CType(Eval("Key"), List(Of WebReference.Event))(0).Odd.ToString("N2").Replace(",", ".") + "</span>", IIf(CType(Eval("Key"), List(Of WebReference.Event))(0).Total = 0, "<span class=""rate_disabled"" id=""---"" title=""Fora"">---</span>", "")), "")%>
                                            <%--<%# IIf(Eval("Value").ToString() = "many", "<span class=""arrow""></span></div>" + IIf(CType(Eval("Key"), List(Of WebReference.Event))(0).Odd <> 0, "<span class=""rate"" id="""+CType(Eval("Key"), List(Of WebReference.Event))(0).Id.ToString()+""" title="""+CType(Eval("Key"), List(Of WebReference.Event))(0).Name+""">" + CType(Eval("Key"), List(Of WebReference.Event))(0).Odd.ToString() + "</span>", "<span class=""rate_disabled"" id=""---"" title=""Fora"">---</span>"), "")%>--%>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                <div class="more_rates">+</div>
				<div class="breaker"></div>
            </div>                   
<div class="game_more">                                        
        <!-- sub rates item start -->
        <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("EventsOthers") %>'>
            <LayoutTemplate>
                <span id="gamelistiplaceholder" runat="server"></span>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="sub_rates" <%#IIf(CType(Eval("Value"), Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))).count=0, "style=""display:none;""", "") %>>
                    <div class="sub_rates_header sub_rates_opened"><%# Eval("Key")%></div>
                    <div class="sub_rates_list" style="display: block; ">
                        <div class="sub_rates_row_big">
                            <asp:ListView ID="ListView2" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value") %>'>
                                <LayoutTemplate>
                                    <span id="gamelistiplaceholder" runat="server"></span>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <div class="sub_rates" <%#IIf(CType(Eval("Value"), Dictionary(Of String, List(Of WebReference.Event))).count=0, "style=""display:none;""", "") %>>
                                        <div class="subsub_rates_header" ><%# Eval("Key")%></div>
                                        <div class="sub_rates_list <%# Iif(Eval("Key")="Others", "subsub_rates_hidetitle", "") %>" >
                                            <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value") %>'>
                                                <LayoutTemplate>
                                                    <span id="gamelistiplaceholder" runat="server"></span>
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                    <%# IIf((Eval("Key") <> "" AndAlso CType(Eval("Value"), List(Of WebReference.Event)).Count > 0), "<div class=""sub_rates_row""><div class=""sub_rates_title"">aaa" + Eval("Key") + "&nbsp;</div><div class=""rates_group"" >&nbsp;</div></div>", "")%>
                                                    <%--<div class="sub_rates_row" <%#IIf(CType(Eval("Value"), List(Of WebReference.Event)).count=0, "style=""display:none;""", "") %>>
                                                        <div class="sub_rates_title"><%# Eval("Key")%>&nbsp;</div>
                                                        <div class="rates_group" >
                                                            &nbsp;
                                                        </div>
                                                    </div>--%>
                                                    
                                                     <div class="sub_rates_row">
                                                        <div class="rates_group" >
                                                        <table class="bettable">
                                                            <tr>                                                                                                                        
                                                            <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value") %>'>
                                                                <LayoutTemplate>
                                                                    <span id="gamelistiplaceholder" runat="server"></span>
                                                                </LayoutTemplate>
                                                                <ItemTemplate>
                                                                <td class="<%#IIf(Eval("TypeCode") = "-100", "othersbettext", "bettext") %>" ><span class="sub_rate_label"> <%# IIf(Eval("Id") <> -1, Eval("Name") + "</span></td><td class=""betbet""><span class=""rate"" id=""" + Eval("Id").ToString() + """ title=""" + Eval("Name") + """>" + CSng(Eval("Odd")).ToString("N2").Replace(",", "."), "---</span></td><td class=""betbet""><span class=""rate_disabled"" id=""---"" title=""---"">---")%></span></td>
                                                                    <%--<%# IIf((Container.DataItemIndex + 1) Mod 2 = 0, "</tr></table></div></div><div id=""line""></div><div class=""sub_rates_row""><div class=""sub_rates_title"">&nbsp;</div><div class=""rates_group""><table class=""bettable""><tr>", "")%>--%>
                                                                    <%# IIf(Eval("TypeCode") = "-100", "</tr></table></div></div><div class=""sub_rates_row""><div class=""rates_group""><table class=""bettable""><tr>", IIf(Container.DataItemIndex <> 0 AndAlso (Container.DataItemIndex + 1) Mod 2 = 0, "</tr></table></div></div><div class=""sub_rates_row""><div class=""rates_group""><table class=""bettable""><tr>", ""))%>


                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                            <%--<%# IIf(CType(Eval("Value"), List(Of WebReference.Event)).Count Mod 2 = 0, "", "</tr></table></div></div>")%>--%>
                                                            </tr>                                                            
                                                        </table>
                                                        </div>
                                                    </div>
                                                    <div id="line"></div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>


                                    <%--<span  <%# IIf(CType(Container.DataItem, WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Container.DataItem, WebReference.Event).Id.ToString()+""" title="""+CType(Container.DataItem, WebReference.Event).Name+""">"+CType(Container.DataItem, WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>--%>
                                <%--<span  <%# IIf(CType(Eval("Ev_P1"), WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Eval("Ev_P1"), WebReference.Event).Id.ToString()+""" title="""+CType(Eval("Ev_P1"), WebReference.Event).Name+""">"+CType(Eval("Ev_P1"), WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>--%>
                                </ItemTemplate>
                            </asp:ListView>                        
                        </div>
                    </div>
                </div>                
            </ItemTemplate>
        </asp:ListView>                                        
    </div>                                    
              
            </div>
            </ItemTemplate>
    </asp:ListView>	
            <!-- game ends here -->
        </div>
    </div>


						
					</ItemTemplate>
				</asp:ListView> 
						<!-- series ends here -->
					</div>
					<!-- series list ends here -->
				</div>
				</ItemTemplate>
						</asp:ListView>	
				<!-- date ends here -->
			</div>
</ItemTemplate>
						</asp:ListView>	                       
			</asp:View>
			<asp:View runat="server" ID="error_mess">
				<h1>К сожалению, произошла ошибка, пожалуйста, попробуйте загрузить страницу заново.</h1>
			</asp:View>
		</asp:MultiView>
	</div>
	
</asp:content>


