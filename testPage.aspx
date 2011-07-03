<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testPage.aspx.vb" Inherits="testPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div class="game_more">                                        
        <!-- sub rates item start -->
        <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("EventsOthers") %>'>
            <LayoutTemplate>
                <span id="gamelistiplaceholder" runat="server"></span>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="sub_rates">
                    <div class="sub_rates_header"><%# Eval("Key")%></div>
                    <div class="sub_rates_list">
                        <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value") %>'>
                            <LayoutTemplate>
                                <span id="gamelistiplaceholder" runat="server"></span>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="sub_rates_title"><%# Eval("Key")%></div>
                                <div class="rates_group">
                                    <asp:ListView ID="lvGamelist" runat="server" ItemPlaceholderID="gamelistiplaceholder" DataSource='<%# Eval("Value") %>'>
                                        <LayoutTemplate>
                                            <span id="gamelistiplaceholder" runat="server"></span>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <span  <%# IIf(Eval("Id")<>-1, "class=""rate"" id="""+("Id").ToString()+""" title="""+("Name")+""">"+Eval("Odd").ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>
                                            <%--<span  <%# IIf(CType(Container.DataItem, WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Container.DataItem, WebReference.Event).Id.ToString()+""" title="""+CType(Container.DataItem, WebReference.Event).Name+""">"+CType(Container.DataItem, WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>
                                            <span class="sub_rate_label">1-28</span><span class="rate">8.42</span>--%>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>


                <span  <%# IIf(CType(Container.DataItem, WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Container.DataItem, WebReference.Event).Id.ToString()+""" title="""+CType(Container.DataItem, WebReference.Event).Name+""">"+CType(Container.DataItem, WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>
            <%--<span  <%# IIf(CType(Eval("Ev_P1"), WebReference.Event).Id<>-1, "class=""rate"" id="""+CType(Eval("Ev_P1"), WebReference.Event).Id.ToString()+""" title="""+CType(Eval("Ev_P1"), WebReference.Event).Name+""">"+CType(Eval("Ev_P1"), WebReference.Event).Odd.ToString() , "class=""rate_disabled"" id=""---"" title=""---"">---")%></span>--%>
            </ItemTemplate>
        </asp:ListView>                                        
    </div>

    </form>
</body>
</html>
