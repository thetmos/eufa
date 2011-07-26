Imports WebReference
Imports interfaceprog
Imports System.Globalization

Partial Class MastPage
    Inherits System.Web.UI.MasterPage
    Public _rLine As ResponseLine
    Public _ef As WebReference.EFU
    Public _dateFilterInput As Date
    Public Property dateFilterInput() As Date
        Get
            Return _dateFilterInput
        End Get
        Set(ByVal value As Date)
            _dateFilterInput = value
        End Set
    End Property
    Public Property ef() As WebReference.EFU
        Get
            Return _ef
        End Get
        Set(ByVal value As WebReference.EFU)
            _ef = value
        End Set
    End Property
    Public Property rLine() As WebReference.ResponseLine
        Get
            Return _rLine
        End Get
        Set(ByVal value As WebReference.ResponseLine)
            _rLine = value
        End Set
    End Property


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'Dim a As EFU = getEfuSession()
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()
        Dim page_name As String = ""
        page_name = getPageName(Page.Request.RawUrl.ToString().ToLower)
        Select Case page_name
            Case "default", "live"
                rLine = ef.ReadFullLine()
            Case "results"
                Dim dateFrom As Date
                Dim dateTo As Date
                Dim divdateFilterInput As String = Request.Form("divdateFilterInput")
                If Page.IsPostBack AndAlso divdateFilterInput <> "" Then
                    'read date
                    'Date.TryParseExact(divdateFilterInput, )
                    If Not Date.TryParseExact(divdateFilterInput, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, dateTo) Then
                        dateTo = Date.Today
                    End If
                    dateFrom = dateTo
                Else
                    dateTo = Date.Today
                    Dim diffDate As New TimeSpan(3, 0, 0, 0)
                    dateFrom = Date.Today.Subtract(diffDate)
                End If
                dateFilterInput = dateTo
                Dim sportIdslist() As Integer = {}
                Dim statuses As String = "DNPR"
                Dim mode As Integer = 1
                rLine = ef.ReadResults(dateFrom, dateTo, statuses, sportIdslist, mode)
        End Select
    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load        
        Dim user As User = getEfuUser()
        If Not Equals(user, Nothing) Then
            mvuserlogon.ActiveViewIndex = 1
            lblfirstname.Text = user.FirstName
            lbllastname.Text = user.LastName
            lblmoney_sum.Text = user.Balance.ToString() + user.Currency
            If mvtop_actions_bar.ActiveViewIndex = 1 Then
                lblmoney_sum.Text = user.Balance.ToString
                lblmoney_currency.Text = user.Currency
            End If
            'Dim currRate As Currency
            'Dim rCurrRates As ResponseCurrencyRates = ef.ReadCurrencyRates()
            'If rCurrRates.ErrorCode = 0 Then
            '    For Each curr As Currency In rCurrRates.Rates
            '        If curr.Code = user.Currency Then
            '            currRate = curr
            '            lblmaxwin.Text = " " + (1000000 / currRate.Rate).ToString().Replace(",", ".") + " "
            '            lblcurrency1.Text = user.Currency
            '        End If
            '    Next
            'End If

            lblcurrency.Text = user.Currency + "&nbsp;"
            If Session("loginErrorText") <> "" Then
                lblmaststat.Text = Session("loginErrorText")
                Session("loginErrorText") = ""
            End If
        Else
            mvuserlogon.ActiveViewIndex = 0
        End If

        Dim page_name As String = ""
        page_name = getPageName(Page.Request.RawUrl.ToString().ToLower)
        Select Case page_name
            Case "default"
                lidefault.Attributes.Add("class", "selected")
                Dim sportArr() As sport_leftActions
                ReDim sportArr(rLine.Sports.Count - 1)
                Dim i As Integer
                Dim countGames As Integer = 0
                For i = 0 To rLine.Sports.Count - 1
                    sportArr(i) = New sport_leftActions(rLine.Sports(i))
                    countGames = countGames + sportArr(i).CountGames
                Next
                lblcountGames.Text = countGames.ToString()
                'lvallevents.DataSource = sportArr
                'lvallevents.DataBind()
                lvSports_leftActions.DataSource = sportArr
                lvSports_leftActions.DataBind()
            Case "live"
                lilivebetting.Attributes.Add("class", "live selected")
                mvleft_actions.ActiveViewIndex = 3
                Dim liveSportsGamesList As New List(Of LiveSportLeftActions)
                Dim livesportLA As LiveSportLeftActions
                For Each onesport As Sport In _rLine.Sports
                    livesportLA = New LiveSportLeftActions(onesport.Name, onesport.Id)
                    For Each onechamp As Championship In onesport.Championships
                        For Each onegame As Game In onechamp.Games
                            For Each onevent As WebReference.Event In onegame.Events
                                If (onevent.IsLive = "Y" OrElse onevent.IsLive = "O") AndAlso (onevent.Status = "L") Then
                                    'liveSportsGamesList.Add(New LiveSportLeftActions(onesport.name))
                                    livesportLA.insertGame(onesport.Name, onechamp.Name, onegame.Id, onegame.Player1.Name, onegame.Player2.Name, onegame.Id, onegame.GameDate, onechamp.Country)
                                    Exit For
                                    Exit For
                                End If
                            Next
                        Next
                    Next
                    If livesportLA.Games.Count > 0 Then
                        liveSportsGamesList.Add(livesportLA)
                    End If
                Next

                lvLiveSports.DataSource = liveSportsGamesList
                lvLiveSports.DataBind()
            Case "results"
                date_filter_input.Text = dateFilterInput.ToString("dd.MM.yyy") 'Date.Today().ToString("dd.MM.yyy")
                liresults.Attributes.Add("class", "selected")
                mvleft_actions.ActiveViewIndex = 2
                Dim sportArr() As sport_leftActions
                ReDim sportArr(rLine.Sports.Count - 1)
                Dim i As Integer
                Dim countGames As Integer = 0
                For i = 0 To rLine.Sports.Count - 1
                    sportArr(i) = New sport_leftActions(rLine.Sports(i))
                    countGames = countGames + sportArr(i).CountGames
                Next
                lblcountGames1.Text = countGames.ToString()
                'lvallevents1.DataSource = sportArr
                'lvallevents1.DataBind()
                lvSports_leftActions1.DataSource = sportArr
                lvSports_leftActions1.DataBind()
            Case "rules"
                lirules.Attributes.Add("class", "selected")
            Case "help"
                lihelp.Attributes.Add("class", "selected")
            Case "addmoney", "withdraw", "payments", "payment_cards"
                mvleft_actions.ActiveViewIndex = 1
                mvtop_actions_bar.ActiveViewIndex = 1
                main_content.Attributes.Add("class", "my_account_container")
            Case "account", "account_details", "account_history", "rates_history"
                limyaccount.Attributes("class") = "account_link_expanded"
                limyacc.Attributes("class") = limyacc.Attributes("class") + " account_link_selected"
                mvleft_actions.ActiveViewIndex = 1
                mvtop_actions_bar.ActiveViewIndex = 1
                main_content.Attributes.Add("class", "my_account_container")
            Case "account_history"
                limyaccount.Attributes("class") = "account_link_expanded"
                liacchist.Attributes("class") = limyacc.Attributes("class") + " account_link_selected"
                mvleft_actions.ActiveViewIndex = 1
                mvtop_actions_bar.ActiveViewIndex = 1
                main_content.Attributes.Add("class", "my_account_container")
            Case "rates_history"
                limyaccount.Attributes("class") = "account_link_expanded"
                lirathist.Attributes("class") = limyacc.Attributes("class") + " account_link_selected"
                mvleft_actions.ActiveViewIndex = 1
                mvtop_actions_bar.ActiveViewIndex = 1
                main_content.Attributes.Add("class", "my_account_container")
            Case Else
                lidefault.Attributes.Add("class", "selected")

        End Select

    End Sub

    Protected Sub btnlogon_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogon.Click
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()

        Dim respUser As ResponseUser = ef.DoLogon(txtlogon.Text, txtpassword.Text)
        If respUser.ErrorCode = 0 Then
            mvuserlogon.ActiveViewIndex = 1
            If mvtop_actions_bar.ActiveViewIndex = 1 Then
                lblmoney_sum.Text = respUser.User.Balance.ToString
                lblmoney_currency.Text = respUser.User.Currency
            End If
            lblfirstname.Text = respUser.User.FirstName
            lbllastname.Text = respUser.User.LastName
            'lblcurrency.Text = respUser.User.Currency
            Session("user") = respUser.User
        Else
            lblmaststat.Text = respUser.ErrorMessage
            Session("loginErrorText") = respUser.ErrorMessage
        End If
        Session("efu_sess") = ef
        Response.Redirect(Page.Request.RawUrl.ToString())
    End Sub

    Protected Sub btnlogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogout.Click
        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()

        Dim boolDoLogoff As Boolean = ef.DoLogoff()
        If Not boolDoLogoff Then
            ef = Nothing
            Session("efu_sess") = ef
        End If
        Session("efu_sess") = intProg.newEfu()
        mvuserlogon.ActiveViewIndex = 0

        Response.Redirect(Page.Request.RawUrl.ToString())
    End Sub


    Protected Sub btnsearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsearch.Click
              
    End Sub


    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click

    End Sub
End Class

Public Class sport_leftActions
    Private _id As Integer
    Private _name As String
    'Private _champsCountriesList As List(Of ChampsCountries)
    Private _countriesDict As Dictionary(Of String, List(Of WebReference.Championship))
    Private _countGames As Integer

    Public Property CountGames() As Integer
        Get
            Return _countGames
        End Get
        Set(ByVal value As Integer)
            _countGames = value
        End Set
    End Property
    Public Property Id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property

    Public Property Name() As String
        Get
            Return _name
        End Get
        Set(ByVal value As String)
            _name = value
        End Set
    End Property

    Public Property CountriesDict() As Dictionary(Of String, List(Of WebReference.Championship))
        Get
            Return _countriesDict
        End Get
        Set(ByVal value As Dictionary(Of String, List(Of WebReference.Championship)))
            _countriesDict = value
        End Set
    End Property

    Public Sub New(ByVal sport_ext As WebReference.Sport)
        Dim intProg As New interfaceprog
        Dim tempCountry As String = ""
        _id = sport_ext.Id
        _name = sport_ext.Name
        'Dim countriesDict As New Dictionary(Of String, List(Of WebReference.Championship))
        '_champsCountriesList = New List(Of ChampsCountries)
        _countriesDict = New Dictionary(Of String, List(Of WebReference.Championship))
        _countGames = 0
        Dim tempChampsList As New List(Of WebReference.Championship)
        For Each onechamp As WebReference.Championship In sport_ext.Championships
            If onechamp.Country = "INT" OrElse onechamp.Country = "" Then
                tempCountry = "DONTVIEW"
            Else
                tempCountry = intProg.getCountry(onechamp.Country)
            End If

            If _countriesDict.TryGetValue(tempCountry, tempChampsList) Then
                tempChampsList.Add(onechamp)
                _countriesDict(tempCountry) = tempChampsList
            Else
                tempChampsList = New List(Of WebReference.Championship)
                tempChampsList.Add(onechamp)
                Try
                    _countriesDict.Add(tempCountry, tempChampsList)
                Catch ex As Exception
                    Try
                        _countriesDict.Add(tempCountry + ".", tempChampsList)
                    Catch ex1 As Exception

                    End Try
                End Try

            End If
            _countGames = _countGames + onechamp.Games.Count
        Next
    End Sub
End Class

Public Class LiveSportLeftActions
    Private _sport As String
    Private _sportId As Integer
    Private _games As List(Of LivegameClass)

    Public Property Sport As String
        Get
            Return _sport
        End Get
        Set(ByVal value As String)
            _sport = value
        End Set
    End Property
    Public Property SportId As Integer
        Get
            Return _sportId
        End Get
        Set(ByVal value As Integer)
            _sportId = value
        End Set
    End Property
    Public Property Games As List(Of LivegameClass)
        Get
            Return _games
        End Get
        Set(ByVal value As List(Of LivegameClass))
            _games = value
        End Set
    End Property

    Public Sub New(ByVal Sportname As String, ByVal SportIdext As Integer)
        _sport = Sportname
        _sportId = SportIdext
        _games = New List(Of LivegameClass)
    End Sub

    Public Sub insertGame(ByVal Sportnameext As String, ByVal Champnameext As String, ByVal Gameidext As Integer, ByVal Player1ext As String, ByVal Player2ext As String, ByVal Idext As Integer, ByVal Gamedateext As Date, ByVal Countryext As String)
        'Onegame.pla()
        _games.Add(New LivegameClass(Sportnameext, Champnameext, Gameidext, Player1ext, Player2ext, Idext, Gamedateext, Countryext))
    End Sub
End Class

Public Class LivegameClass
    'Inherits Game
    Private _sportname As String
    Private _champname As String
    Private _player1 As String
    Private _player2 As String
    Private _id As Integer
    Private _gamedate As Date
    Private _country As String
    Private _gameId As Integer
    ' Private _onegame As Game

    Public Property GameId As Integer
        Get
            Return _gameId
        End Get
        Set(ByVal value As Integer)
            _gameId = value
        End Set
    End Property
    Public Property Sportname As String
        Get
            Return _sportname
        End Get
        Set(ByVal value As String)
            _sportname = value
        End Set
    End Property
    Public Property Champname As String
        Get
            Return _champname
        End Get
        Set(ByVal value As String)
            _champname = value
        End Set
    End Property
    Public Property Player1 As String
        Get
            Return _player1
        End Get
        Set(ByVal value As String)
            _player1 = value
        End Set
    End Property
    Public Property Player2 As String
        Get
            Return _player2
        End Get
        Set(ByVal value As String)
            _player2 = value
        End Set
    End Property
    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property
    Public Property Gamedate As Date
        Get
            Return _gamedate
        End Get
        Set(ByVal value As Date)
            _gamedate = value
        End Set
    End Property
    Public Property Country As String
        Get
            Return _country
        End Get
        Set(ByVal value As String)
            _country = value
        End Set
    End Property

    Public Sub New(ByVal Sportnameext As String, ByVal Champnameext As String, ByVal Gameidext As Integer, ByVal Player1ext As String, ByVal Player2ext As String, ByVal Idext As Integer, ByVal Gamedateext As Date, ByVal Countryext As String)
        '_onegame.
        _sportname = Sportnameext
        _champname = Champnameext
        _player1 = Player1ext
        _player2 = Player2ext
        _id = Idext
        _gamedate = Gamedateext
        _country = Countryext
        _gameId = Gameidext
    End Sub
End Class




