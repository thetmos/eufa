<%@ Page Language="VB" AutoEventWireup="false" CodeFile="registration.aspx.vb" Inherits="registration" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Еврофутбол</title>
<link rel="stylesheet" type="text/css" href="css/styles_popup.css" />
<script type="text/javascript" src="js/jquery-1.5.2.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
<script type="text/javascript" >
    $(document).ready(function () {
        $("#cbagreement").click(function () {
            if ($('#cbagreement').is(':checked') == false) {
                $("#btnregister").attr('disabled', 'disabled');
                $(".spanagreement").css('display', 'block');
            }
            else {
                $(".spanagreement").css('display', 'none');
                $('#btnregister').removeAttr('disabled');
            }

        });
    });
</script>
</head>

<body>
<form id="form1" runat="server">
<asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
    <asp:View runat="server" ID="do_registr">
    <div id="popup_wrapper">
    
        <h1><span>Регистрация нового пользователя</span></h1>
        <div class="content">
        <table boreder="0">
        <tr>
            <td><b style="color:yellow;">Логин:</b></td><td><asp:TextBox ID="txtlogon" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td><b style="color:yellow;">Пароль:</b></td><td><asp:TextBox ID="txtpass" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td><b style="color:yellow;">Подтверждение пароля:</b></td><td><asp:TextBox ID="txtrepass" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td> <b style="color:yellow;">Контрольное слово для восстановления утерянного пароля:</b></td><td><asp:TextBox ID="txtcheckword" runat="server" TextMode="Password"></asp:TextBox><br /></td>
        </tr>
       
        <tr>
            <td><b style="color:yellow;">Фамилия:</b></td><td><asp:TextBox ID="txtlastname" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td><b style="color:yellow;">Имя:</b></td><td><asp:TextBox ID="txtname" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td><b style="color:yellow;">Отчество:</b></td><td><asp:TextBox ID="txtmiddlename" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td><b style="color:yellow;">Валюта:</b></td>
            <td>
            <asp:DropDownList ID="ddlcurrency" runat="server" style="width: 127px;margin-left: 2px;">
                <asp:ListItem Value="AMD"> Драм </asp:ListItem>
                <asp:ListItem Value="RUR"> Российский рубль </asp:ListItem>
                <asp:ListItem Value="USD"> Доллар США </asp:ListItem>
                <asp:ListItem Value="EUR"> Евро </asp:ListItem>
            </asp:DropDownList>
            <br />
            </td>
        </tr>
        
            
        <tr>
            <td><b style="color:yellow;">Язык:</b></td>
            <td>
            <asp:DropDownList ID="ddllang" runat="server" style="width: 127px;
margin-left: 2px;">
                <asp:ListItem Value="AM"> Армянский </asp:ListItem>
                <asp:ListItem Value="RU"> Русский </asp:ListItem>
                <asp:ListItem Value="EN"> Английский </asp:ListItem>
            </asp:DropDownList>
            <br />
            </td>
        </tr>
        
            
        <tr>
            <td><b style="color:yellow;">Часовой пояс:</b></td>
            <td>
             <asp:DropDownList ID="ddltimezone" runat="server" Width="300px" style="margin-left:1px;">
                <asp:ListItem Value="-12">(GMT -12:00) Эневеток, Кваджалейн</asp:ListItem>
                <asp:ListItem Value="-11">(GMT -11:00) Остров Мидуэй, Самоа</asp:ListItem>
                <asp:ListItem Value="-10">(GMT -10:00) Гавайи</asp:ListItem>
                <asp:ListItem Value="-9">(GMT -9:00) Аляска</asp:ListItem>
                <asp:ListItem Value="-8">(GMT -8:00) Тихоокеанское время (США и Канада), Тихуана</asp:ListItem> 
                <asp:ListItem Value="-7">(GMT -7:00) Горное время (США и Канада), Аризона</asp:ListItem> 
                <asp:ListItem Value="-6">(GMT -6:00) Центральное время (США и Канада), Мехико</asp:ListItem> 
                <asp:ListItem Value="-5">(GMT -5:00) Восточное время (США и Канада), Богота, 
                Лима</asp:ListItem> 
                <asp:ListItem Value="-4.5">(GMT -4:30) Каракас</asp:ListItem> 
                <asp:ListItem Value="-4">(GMT -4:00) Атлантическое время (Канада), Ла Пас</asp:ListItem> 
                <asp:ListItem Value="-3.5">(GMT -3:30) Ньюфаундленд</asp:ListItem> 
                <asp:ListItem Value="-3">(GMT -3:00) Бразилия, Буэнос-Айрес, Джорджтаун</asp:ListItem> 
                <asp:ListItem Value="-2">(GMT -2:00) Среднеатлантическое время</asp:ListItem> 
                <asp:ListItem Value="-1">(GMT -1:00) Азорские острова, острова Зелёного Мыса</asp:ListItem> 
                <asp:ListItem Value="0">(GMT) Дублин, Лондон, Лиссабон, Касабланка, Эдинбург</asp:ListItem> 
                <asp:ListItem Value="1">(GMT +1:00) Брюссель, Копенгаген, Мадрид, Париж, Берлин</asp:ListItem> 
                <asp:ListItem Value="2">(GMT +2:00) Калининград, Киев, Минск, Прибалтика, Южная 
                Африка, Каир</asp:ListItem> 
                <asp:ListItem Value="3" selected="selected">(GMT +3:00) Москва, Санкт-Петербург, 
                Волгоград</asp:ListItem> 
                <asp:ListItem Value="3.5">(GMT +3:30) Тегеран</asp:ListItem> 
                <asp:ListItem Value="4">(GMT +4:00) Абу-Даби, Баку, Тбилиси, Ереван</asp:ListItem> 
                <asp:ListItem Value="4.5">(GMT +4:30) Кабул</asp:ListItem> 
                <asp:ListItem Value="5">(GMT +5:00) Екатеринбург, Исламабад, Карачи, Ташкент</asp:ListItem> 
                <asp:ListItem Value="5.5">(GMT +5:30) Мумбай, Колката, Ченнаи, Нью-Дели</asp:ListItem> 
                <asp:ListItem Value="5.75">(GMT +5:45) Катманду</asp:ListItem> 
                <asp:ListItem Value="6">(GMT +6:00) Омск, Новосибирск, Кемерово, Астана, Бишкек</asp:ListItem> 
                <asp:ListItem Value="6.5">(GMT +6:30) Янгон, Кокосовые острова</asp:ListItem> 
                <asp:ListItem Value="7">(GMT +7:00) Красноярск, Абакан, Бангкок, Ханой, Джакарта</asp:ListItem> 
                <asp:ListItem Value="8">(GMT +8:00) Иркутск, Улан-Удэ, Пекин, Сингапур, Гонконг</asp:ListItem> 
                <asp:ListItem Value="9">(GMT +9:00) Якутск, Благовещенск, Токио, Пхеньян, Сеул</asp:ListItem> 
                <asp:ListItem Value="9.5">(GMT +9:30) Аделаида, Дарвин</asp:ListItem> 
                <asp:ListItem Value="10">(GMT +10:00) Владивосток, Сахалин, Восточная Австралия, 
                Гуам</asp:ListItem> 
                <asp:ListItem Value="11">(GMT +11:00) Магадан, Камчатка, Соломоновы Острова</asp:ListItem> 
                <asp:ListItem Value="12">(GMT +12:00) Веллингтон, Окленд, Фиджи</asp:ListItem> 
            </asp:DropDownList>
            <br />
            </td>
        </tr>
        
           
        <tr>
            <td><b style="color:yellow;">Дата рождения в формате:</b></td>
            <td>
            <asp:DropDownList ID="ddlday" runat="server">
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
            <asp:DropDownList ID="ddlmonth" runat="server">
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
            <asp:DropDownList ID="ddlyear" runat="server">
                <asp:ListItem Value="1940">1940</asp:ListItem>
                <asp:ListItem Value="1941">1941</asp:ListItem>                
                <asp:ListItem Value="1942">1942</asp:ListItem>
                <asp:ListItem Value="1943">1943</asp:ListItem>
                <asp:ListItem Value="1944">1944</asp:ListItem>
                <asp:ListItem Value="1945">1945</asp:ListItem>
                <asp:ListItem Value="1946">1946</asp:ListItem>
                <asp:ListItem Value="1947">1947</asp:ListItem>
                <asp:ListItem Value="1948">1948</asp:ListItem>
                <asp:ListItem Value="1949">1949</asp:ListItem>
                <asp:ListItem Value="1950">1950</asp:ListItem>
                <asp:ListItem Value="1951">1951</asp:ListItem>                
                <asp:ListItem Value="1952">1952</asp:ListItem>
                <asp:ListItem Value="1953">1953</asp:ListItem>
                <asp:ListItem Value="1954">1954</asp:ListItem>
                <asp:ListItem Value="1955">1955</asp:ListItem>
                <asp:ListItem Value="1956">1956</asp:ListItem>
                <asp:ListItem Value="1957">1957</asp:ListItem>
                <asp:ListItem Value="1958">1958</asp:ListItem>
                <asp:ListItem Value="1959">1959</asp:ListItem>
                <asp:ListItem Value="1960">1960</asp:ListItem>
                <asp:ListItem Value="1961">1961</asp:ListItem>                
                <asp:ListItem Value="1962">1962</asp:ListItem>
                <asp:ListItem Value="1963">1963</asp:ListItem>
                <asp:ListItem Value="1964">1964</asp:ListItem>
                <asp:ListItem Value="1965">1965</asp:ListItem>
                <asp:ListItem Value="1966">1966</asp:ListItem>
                <asp:ListItem Value="1967">1967</asp:ListItem>
                <asp:ListItem Value="1968">1968</asp:ListItem>
                <asp:ListItem Value="1969">1969</asp:ListItem>      
                <asp:ListItem Value="1970">1970</asp:ListItem>
                <asp:ListItem Value="1971">1971</asp:ListItem>                
                <asp:ListItem Value="1972">1972</asp:ListItem>
                <asp:ListItem Value="1973">1973</asp:ListItem>
                <asp:ListItem Value="1974">1974</asp:ListItem>
                <asp:ListItem Value="1975">1975</asp:ListItem>
                <asp:ListItem Value="1976">1976</asp:ListItem>
                <asp:ListItem Value="1977">1977</asp:ListItem>
                <asp:ListItem Value="1978">1978</asp:ListItem>
                <asp:ListItem Value="1979">1979</asp:ListItem>
                <asp:ListItem Value="1980">1980</asp:ListItem>
                <asp:ListItem Value="1981">1981</asp:ListItem>                
                <asp:ListItem Value="1982">1982</asp:ListItem>
                <asp:ListItem Value="1983">1983</asp:ListItem>
                <asp:ListItem Value="1984">1984</asp:ListItem>
                <asp:ListItem Value="1985">1985</asp:ListItem>
                <asp:ListItem Value="1986">1986</asp:ListItem>
                <asp:ListItem Value="1987">1987</asp:ListItem>
                <asp:ListItem Value="1988">1988</asp:ListItem>
                <asp:ListItem Value="1989">1989</asp:ListItem>
                <asp:ListItem Value="1990">1990</asp:ListItem>
                <asp:ListItem Value="1991">1991</asp:ListItem>                
                <asp:ListItem Value="1992">1992</asp:ListItem>
                <asp:ListItem Value="1993">1993</asp:ListItem>
                <asp:ListItem Value="1994">1994</asp:ListItem>
                <asp:ListItem Value="1995">1995</asp:ListItem>
                <asp:ListItem Value="1996">1996</asp:ListItem>
                <asp:ListItem Value="1997">1997</asp:ListItem>
                <asp:ListItem Value="1998">1998</asp:ListItem>
                <asp:ListItem Value="1999">1999</asp:ListItem>   
                <asp:ListItem Value="2000">2000</asp:ListItem>
                <asp:ListItem Value="2001">2001</asp:ListItem>                
                <asp:ListItem Value="2002">2002</asp:ListItem>
                <asp:ListItem Value="2003">2003</asp:ListItem>
                <asp:ListItem Value="2004">2004</asp:ListItem>
                <asp:ListItem Value="2005">2005</asp:ListItem>
                <asp:ListItem Value="2006">2006</asp:ListItem>
                <asp:ListItem Value="2007">2007</asp:ListItem>
                <asp:ListItem Value="2008">2008</asp:ListItem>
                <asp:ListItem Value="2009">2009</asp:ListItem>                                                                                                       
            </asp:DropDownList>
            <br />
            </td>
        </tr>
        
            
        <tr>
            <td><b style="color:yellow;">Пол:</b></td>
            <td>
                <asp:RadioButtonList runat="server" ID="rblsex" >
                    <asp:ListItem Value="M" Selected="True">Мужской</asp:ListItem>
                    <asp:ListItem value="F">Женский</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        
        
        <br />
        <tr>
            <td><b style="color:yellow;">email:</b></td><td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox><br /></td>
        </tr>
        
        <tr>
            <td><b style="color:yellow;">Адрес:</b></td><td><asp:TextBox ID="txtaddress" runat="server"></asp:TextBox><br /></td>
        </tr>
        <tr>
            <td colspan="2">
                <recaptcha:RecaptchaControl
                ID="recaptcha"
                runat="server"
                PublicKey="6LcJ_cISAAAAANfw1OanlDMATpUD5OAUGJ2Z6Qc_"
                PrivateKey="6LcJ_cISAAAAAF9w7hSjuUl99TvPbhffyRSFYprF"
                />
            </td>
        </tr>
        
        </table>

            <%--ЗДЕСЬ БУДЕТ reCAPTCHA<br />--%>

        <a href="rules.aspx">Правила использования сервиса</a><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtlogon" ErrorMessage="Поле 'Логин' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpass" ErrorMessage="Поле 'Пароль' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtrepass" ErrorMessage="Поле 'Повторите пароль' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcheckword" ErrorMessage="Поле 'Контрольное слово' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtlastname" ErrorMessage="Поле 'Фамилия' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtname" ErrorMessage="Поле 'Имя' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtmiddlename" ErrorMessage="Поле 'Отчество' обязательно для заполнения, заполните его, пожалуйста"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator ID="RegularExpressionValidatorLogon" runat="server" 
                ErrorMessage="Логин дожен содержать не более 30 латинских символов.<br />" 
                ControlToValidate="txtlogon" ValidationExpression="([A-z]){1,20}" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPass" runat="server" 
                ErrorMessage="Пароль должен содержать не менее 6 и не более 20 символов. Разрешается использовать латинские буквы, цифры, а также символы .,!?_ <br />" 
                ControlToValidate="txtpass" ValidationExpression="([A-z,.!?_1-9]){6,20}" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidatorPass" runat="server" 
                ErrorMessage="Значения полей 'Пароль' и 'Подтверждение пароля' должны совпадать.<br />" 
                ControlToValidate="txtpass" ControlToCompare="txtrepass" Display="Dynamic"></asp:CompareValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorСheckword" 
                runat="server" 
                ErrorMessage="Контрольное слово должно содержать не более 30 символов.<br />" 
                ControlToValidate="txtcheckword" ValidationExpression="([\w\d _,;\/]){1,30}" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorName" runat="server" 
                ErrorMessage="Поле 'Имя' должно содержать в себе не больше 30 символов.<br />" ControlToValidate="txtname" 
                ValidationExpression="([\w -]){1,30}" Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorLastname" 
                runat="server" ErrorMessage="Поле 'Фамилия' должно содержать в себе не больше 30 символов.<br />" 
                ControlToValidate="txtlastname" ValidationExpression="([\w -]){1,30}" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorMiddlename" 
                runat="server" ErrorMessage="Поле 'Отчество' должно содержать в себе не больше 30 символов.<br />" 
                ControlToValidate="txtmiddlename" ValidationExpression="([\w -]){0,30}" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" 
                ErrorMessage="Email введен неправильно.<br />" ControlToValidate="txtemail" 
                ValidationExpression="^[-A-zА-я0-9!#$%&'*+/=?^_`{|}~]+(\.[-A-zА-я0-9!#$%&'*+/=?^_`{|}~]+)*@([A-zА-я0-9]([-A-zА-я0-9]{0,61}[A-zА-я0-9])?\.)*(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|рф|AERO|ARPA|ASIA|BIZ|CAT|COM|COOP|EDU|GOV|INFO|INT|JOBS|MIL|MOBI|MUSEUM|NAME|NET|ORG|PRO|TEL|TRAVEL|РФ|[A-z][A-z])$" 
                Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorAddress" 
                runat="server" 
                ErrorMessage="Поле 'адрес' должно содержать в себе не больше 50 символов.<br />" 
                ControlToValidate="txtaddress" ValidationExpression="([\w\d _,;\/]){0,50}" 
                Display="Dynamic"></asp:RegularExpressionValidator>

        <span style="color:Red;" class="spanagreement">Для регистрации нужно поставить 
            галочку напротив &#39;Согласен с правилами букмекерской организации&#39;<br /></span>
        <asp:CheckBox ID="cbagreement" name="cbagreement" runat="server" />Согласен с 
            правилами букмекерской организации:<br />
        <asp:Button ID="btnregister" runat="server" Text="Зарегистрироваться" Enabled="False" />
        <br />
            &nbsp;
        </div>
    
    </div>        
    </asp:View>
    <asp:View runat="server" ID="registration_succefull">
        <div id="popup_wrapper">
            <h1><span>Регистрация нового пользователя</span></h1>
            <div class="content">
                 <h2>
                    <asp:Label ID="lblregstat" runat="server" Text="Регистрация прошла успешно"></asp:Label>
                </h2>
                <center>
                    <asp:Label ID="lblregerror" runat="server" Text=""></asp:Label></center>
            </div>
        </div> 
    </asp:View>
</asp:MultiView>
    
</form>
</body>
</html>