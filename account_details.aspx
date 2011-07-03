<%@ Page Language="VB" AutoEventWireup="false" CodeFile="account_details.aspx.vb" Inherits="account_details"  MasterPageFile="~/MastPage.master"%>

<asp:content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolderMasterMain" >
    
    <%--<div id="content">--%>
        <h2>Мои данные</h2>
        <div class="my_account_content my_details">
            <asp:MultiView ID="mvaccount_details" runat="server" ActiveViewIndex="0">
                <asp:View ID="default" runat="server">
                    <div class="my_details_item">
		                <div class="my_details_title">Login</div>
		                <div class="my_details_desc">
                            <asp:Label ID="lbllogin" runat="server" Text=""></asp:Label>
                        </div>

		                <div class="my_details_title">Банк</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" tabindex="7" />--%>
                            <asp:TextBox ID="txtbank" runat="server" CssClass="textfield" TabIndex="7"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Email</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" value="email@mail.com" tabindex="1" />--%>
                            <asp:TextBox ID="txtemail" runat="server" CssClass="textfield" TabIndex="1"></asp:TextBox>
                        </div>
		                <div class="my_details_title">Отделение</div>

		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" tabindex="8" />--%>
                            <asp:TextBox ID="txtbankdepartment" runat="server" CssClass="textfield" TabIndex="8"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Телефон</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" value="(088) 999-999" tabindex="2" />--%>
                            <asp:TextBox ID="txtphone" runat="server" CssClass="textfield" TabIndex="2"></asp:TextBox>
                        </div>
		                <div class="my_details_title">Город</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" tabindex="9" />--%>
                            <asp:TextBox ID="txtbankcity" runat="server" CssClass="textfield" TabIndex="9"></asp:TextBox>
                        </div>

		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Адрес</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" value="А.Тигранян 5 кв.38" tabindex="3" />--%>
                            <asp:TextBox ID="txtaddress" runat="server" CssClass="textfield" TabIndex="3"></asp:TextBox>
                        </div>
		                <div class="my_details_title">БИК</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" tabindex="10" />--%>
                            <asp:TextBox ID="txtbankcode" runat="server" CssClass="textfield" TabIndex="10"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>

	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Пароль</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="password" value="password" tabindex="4" />--%>
                            <asp:TextBox ID="txtpass" runat="server" CssClass="textfield" TabIndex="4" TextMode="Password"></asp:TextBox>
                        </div>
		                <div class="my_details_title">к/с</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" tabindex="11" />--%>
                            <h2>Нет в классе</h2>
                            <asp:TextBox ID="txtbankks" runat="server" CssClass="textfield" TabIndex="11"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>

	                <div class="my_details_item">
		                <div class="my_details_title">Подтвердите пароль</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="password" value="password" tabindex="5" />--%>
                            <asp:TextBox ID="txtrepass" runat="server" CssClass="textfield" TabIndex="5" TextMode="Password"></asp:TextBox>
                        </div>
		                <div class="my_details_title">р/с</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" tabindex="12" />--%>
                            <asp:TextBox ID="txtbankaccount" runat="server" CssClass="textfield" TabIndex="12"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">

		                <div class="my_details_title">Контрольное слово</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="password" value="еврофутбол" tabindex="6" />--%>
                            <asp:TextBox ID="txtcheckword" runat="server" CssClass="textfield" TabIndex="6" TextMode="Password"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Фамилия</div>
		                <div class="my_details_desc">
                            <asp:Label ID="lbllastname" runat="server" Text=""></asp:Label>
                        </div>

		                <div class="my_details_title">Кошелёк Web Money</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" value="" tabindex="13" />--%>
                            <asp:TextBox ID="txtwebmoney" runat="server" CssClass="textfield" TabIndex="13"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Имя</div>
		                <div class="my_details_desc">
                            <asp:Label ID="lblfirstname" runat="server" Text=""></asp:Label>
                        </div>

		                <div class="my_details_title">E-Dram ID</div>
		                <div class="my_details_desc">
                            <%--<input class="textfield" type="text" value="" tabindex="14" />--%>
                            <asp:TextBox ID="txtedram" runat="server" CssClass="textfield" TabIndex="14"></asp:TextBox>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Пол</div>
		                <div class="my_details_desc">
                            <%--Муж--%>
                            <asp:Label ID="lblsex" runat="server" Text=""></asp:Label>
                        </div>

		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Дата рождения</div>
		                <div class="my_details_desc">
                            <%--23 сентября, 1978--%>
                            <asp:Label ID="lblday" runat="server" Text=""></asp:Label>&nbsp;
                            <asp:Label ID="lblmonth" runat="server" Text=""></asp:Label>,&nbsp;
                            <asp:Label ID="lblyear" runat="server" Text=""></asp:Label>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">

		                <div class="my_details_title">Часовой пояс GMT</div>
		                <div class="my_details_desc">
                            <%--+04.00--%>
                            <asp:Label ID="lbltimebias" runat="server" Text=""></asp:Label>
                        </div>
		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_item">
		                <div class="my_details_title">Валюта</div>
		                <div class="my_details_desc">
                            <%--AMD--%>
                            <asp:Label ID="lblcurrency" runat="server" Text=""></asp:Label>
                        </div>

		                <div class="breaker"></div>
	                </div>
	                <div class="my_details_actions">
		                <%--<input type="submit" value="Сохранить" class="my_details_button"/>
		                <input type="submit" value="Отменить" class="my_details_button"/>--%>
                        <asp:Button ID="btnsavechanges" runat="server" Text="Сохранить" CssClass="my_details_button"/>
                        <asp:Button ID="btncancelchanges" runat="server" Text="Отменить" CssClass="my_details_button"/>
	                </div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBank" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Банк' должно содержать в себе не больше 50 символов.<br />" 
                                        ControlToValidate="txtbank" ValidationExpression="([\w\d _,;\/]){0,50}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" 
                                        ErrorMessage="Email введен неправильно.<br />" ControlToValidate="txtemail" 
                                        ValidationExpression="^[-A-zА-я0-9!#$%&'*+/=?^_`{|}~]+(\.[-A-zА-я0-9!#$%&'*+/=?^_`{|}~]+)*@([A-zА-я0-9]([-A-zА-я0-9]{0,61}[A-zА-я0-9])?\.)*(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|рф|AERO|ARPA|ASIA|BIZ|CAT|COM|COOP|EDU|GOV|INFO|INT|JOBS|MIL|MOBI|MUSEUM|NAME|NET|ORG|PRO|TEL|TRAVEL|РФ|[A-z][A-z])$" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>                    
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorDepartment" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Отделение' должно содержать в себе не больше 50 символов.<br />" 
                                        ControlToValidate="txtbankdepartment" ValidationExpression="([\w\d _,;\/]){0,50}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator> 
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Телефон' должно содержать в себе не больше 20 цифр или символов _,;\/() .<br />" 
                                        ControlToValidate="txtphone" ValidationExpression="([\d _,;\/()]){0,20}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>     
    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBankcity" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Город' должно содержать в себе не больше 50 символов.<br />" 
                                        ControlToValidate="txtbankcity" ValidationExpression="([\w\d _,;\/]){0,50}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>     
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorAddress" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Адрес' должно содержать в себе не больше 50 символов.<br />" 
                                        ControlToValidate="txtaddress" ValidationExpression="([\w\d _,;\/]){0,50}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>    
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBankcode" 
                                        runat="server" 
                                        ErrorMessage="Поле 'БИК' должно содержать в себе не больше 50 символов.<br />" 
                                        ControlToValidate="txtbankcode" ValidationExpression="([\w\d _,;\/]){0,50}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>    
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPass" runat="server" 
                                        ErrorMessage="Пароль должен содержать не менее 6 и не более 20 символов. Разрешается использовать латинские буквы, цифры, а также символы .,!?_ <br />" 
                                        ControlToValidate="txtpass" ValidationExpression="([A-z,.!?_1-9]){6,20}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidatorPass" runat="server" 
                                        ErrorMessage="Значения полей 'Пароль' и 'Подтвердите пароль' должны совпадать.<br />" 
                                        ControlToValidate="txtpass" ControlToCompare="txtrepass" Display="Dynamic"></asp:CompareValidator>                                                                                                             
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBankaccount" 
                                        runat="server" 
                                        ErrorMessage="Поле 'р/с' должно содержать в себе не больше 90 символов.<br />" 
                                        ControlToValidate="txtbankaccount" ValidationExpression="([\w\d _,;\/]){0,90}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator> 
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorCheckword" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Контрольное слово' должно содержать в себе не больше 90 символов.<br />" 
                                        ControlToValidate="txtcheckword" ValidationExpression="([\w\d _,;\/]){0,90}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>    
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorWebmoney" 
                                        runat="server" 
                                        ErrorMessage="Поле 'Кошелёк Web Money' должно содержать в себе не больше 20 символов в формате: буква кошелька и цифры за ней без пробела, например, R111111111111.<br />" 
                                        ControlToValidate="txtwebmoney" ValidationExpression="([A-z])([\d ]){0,20}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>  
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEdram" 
                                        runat="server" 
                                        ErrorMessage="Поле 'E-Dram ID' должно содержать в себе не больше 20 цифр.<br />" 
                                        ControlToValidate="txtedram" ValidationExpression="([\d ]){0,20}" 
                                        Display="Dynamic"></asp:RegularExpressionValidator>                                                                                               
                                                                       
                </asp:View>
                <asp:View ID="status" runat="server">
                    <center>
                        <h2><asp:Label ID="lblstatus" runat="server" Text=""></asp:Label></h2>
                    </center>
                </asp:View>
            </asp:MultiView>
	        
        </div>

   <%-- </div>--%>
    
</asp:content>