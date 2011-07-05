Imports WebReference
Imports interfaceprog

Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ef As EFU
        Dim intProg As New interfaceprog
        ef = intProg.getEfuSession()

        'If Page.IsPostBack Then
        Dim aRequest As System.Web.HttpRequest
        aRequest = Page.Request
        Dim postedValues As NameValueCollection = Request.Form       
        Dim rLine As ResponseLine = Master.rLine
        If rLine.ErrorCode = 0 Then
            Dim sportsWD As SportsWithDates
            Dim sportsWDlist As New List(Of SportsWithDates)
            Dim sportnum As Integer = 0

            Dim x2i As New Xml2Interface()
            Dim gameIterface As New SportInterfacce
            For Each osport As Sport In rLine.Sports
                sportnum = sportnum + 1
                sportsWD = New SportsWithDates(osport.Id, osport.Name)
                For Each champ As Championship In osport.Championships
                    For Each onegame As Game In champ.Games
                        If Not x2i.SportDict.TryGetValue(osport.Id, gameIterface) Then
                            If Not x2i.SportDict.TryGetValue(-1, gameIterface) Then
                                'error
                            End If
                        End If
                        sportsWD.insertGameItem(onegame.GameDate.ToString("dd.MM.yy"), New Game_vt(osport.Id, onegame, x2i), sportnum, champ, gameIterface)
                    Next
                Next
                sportsWDlist.Add(sportsWD)
            Next


            lvSportsWDList.DataSource = sportsWDlist
            lvSportsWDList.DataBind()
        Else
            mvdefault.ActiveViewIndex = 1
        End If
    End Sub
End Class


Public Class SportsWithDates 'один спорт
    Private _id As Integer
    Private _name As String
    Private _gamedatelist As List(Of Gamedate)
    Private _gameMainTitle As SportInterfacce

    Private _championats As Dictionary(Of Integer, Championship)
    Private _champDateList As List(Of champDate)

    Property GameMainTitle() As SportInterfacce
        Get
            Return Me._gameMainTitle
        End Get
        Set(ByVal value As SportInterfacce)
            Me._gameMainTitle = value
        End Set
    End Property
    Property Id() As Integer
        Get
            Return Me._id
        End Get
        Set(ByVal value As Integer)
            Me._id = value
        End Set
    End Property
    Property Name() As String
        Get
            Return Me._name
        End Get
        Set(ByVal value As String)
            Me._name = value
        End Set
    End Property
    Property Gamedatelist() As List(Of Gamedate)
        Get
            Return Me._gamedatelist
        End Get
        Set(ByVal value As List(Of Gamedate))
            Me._gamedatelist = value
        End Set
    End Property

    Public Sub New(ByVal Id As Integer, ByVal Name As String, ByVal Gamedatelist As List(Of Gamedate))
        Me._id = Id
        Me._name = Name
        Me._gamedatelist = Gamedatelist
        _championats = New Dictionary(Of Integer, Championship)
    End Sub

    Public Sub New(ByVal id As Integer, ByVal name As String)
        Me._id = id
        Me._name = name
        Me._gamedatelist = New List(Of Gamedate)
    End Sub

    Public Sub addChamp(ByVal champ As Championship)
        _championats.Add(champ.Id, champ)
    End Sub

    Public Sub insertGameItem(ByVal gamedate As String, ByVal onegame As Game_vt, ByVal sportnum As Integer, ByVal champ As Championship, ByVal extGameMainTitle As SportInterfacce)
        Dim tempDict As New champDate
        Dim tempList As New List(Of Game_vt)
        For i As Integer = 0 To Me._gamedatelist.Count - 1
            If Me._gamedatelist(i).Gamedate = gamedate Then
                If Me._gamedatelist(i).ChampDict.TryGetValue(champ.Id, tempDict) Then
                    Me._gamedatelist(i).ChampDict(champ.Id).GameList.Add(onegame)
                Else
                    tempList.Add(onegame)
                    Me._gamedatelist(i).ChampDict.Add(champ.Id, New champDate(champ.Id, champ.Country, champ.Comment, champ.Name, tempList, _id, sportnum, gamedate, extGameMainTitle))
                End If
                'Me.Gamedatelist(i).Gamelist.Add(onegame)
                i = i + 1 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''CHECK THIS
                Return
            End If
        Next
        'Dim gamel As New List(Of Game_vt)
        tempList.Add(onegame)
        Dim champDict As New Dictionary(Of Integer, champDate)
        champDict.Add(champ.Id, New champDate(champ.Id, champ.Country, champ.Comment, champ.Name, tempList, _id, sportnum, gamedate, extGameMainTitle))
        Dim gamed As New Gamedate(gamedate, champDict, sportnum, extGameMainTitle)
        'Dim gamed As New Gamedate(gamedate, gamel, sportnum)
        Me.Gamedatelist.Add(gamed)
    End Sub
End Class

Public Class Gamedate
    Private _sportNum As Integer
    Private _gamedate As String
    Private _gameMainTitle As SportInterfacce
    'Private _gamelist As List(Of Game_vt)

    Private _champDict As Dictionary(Of Integer, champDate)

    Property GameMainTitle() As SportInterfacce
        Get
            Return _gameMainTitle
        End Get
        Set(ByVal value As SportInterfacce)
            _gameMainTitle = value
        End Set
    End Property
    Property Gamedate() As String
        Get
            Return Me._gamedate
        End Get
        Set(ByVal value As String)
            Me._gamedate = value
        End Set
    End Property

    Property ChampDict() As Dictionary(Of Integer, champDate)
        Get
            Return Me._champDict
        End Get
        Set(ByVal value As Dictionary(Of Integer, champDate))
            Me._champDict = value
        End Set
    End Property
    Property SportNum() As Integer
        Get
            Return Me._sportNum
        End Get
        Set(ByVal value As Integer)
            Me._sportNum = value
        End Set
    End Property
    Public Sub New(ByVal Gamedate As String, ByVal ChampDict As Dictionary(Of Integer, champDate), ByVal SportNum As Integer, ByVal extGameMainTitle As SportInterfacce)
        Me._gamedate = Gamedate
        'Me._gamelist = Gamelist
        Me._champDict = ChampDict
        Me._sportNum = SportNum
        Me._gameMainTitle = extGameMainTitle
    End Sub

End Class

Public Class champDate
    Private _sportId As Integer
    Private _sportNum As Integer
    Private _gamedate As String
    Private _id As Integer
    Private _name As String
    Private _gameList As List(Of Game_vt)
    Private _gameMainTitle As SportInterfacce
    Private _country As String
    Private _comment As String

    Property GameMainTitle() As SportInterfacce
        Get
            Return _gameMainTitle
        End Get
        Set(ByVal value As SportInterfacce)
            _gameMainTitle = value
        End Set
    End Property
    Property Comment() As String
        Get
            Return _comment
        End Get
        Set(ByVal value As String)
            _comment = value
        End Set
    End Property
    Property Country() As String
        Get
            Return _country
        End Get
        Set(ByVal value As String)
            _country = value
        End Set
    End Property
    Property SportId() As Integer
        Get
            Return Me._sportId
        End Get
        Set(ByVal value As Integer)
            Me._sportId = value
        End Set
    End Property
    Property SportNum() As Integer
        Get
            Return Me._sportNum
        End Get
        Set(ByVal value As Integer)
            Me._sportNum = value
        End Set
    End Property
    Property Gamedate() As String
        Get
            Return Me._gamedate
        End Get
        Set(ByVal value As String)
            Me._gamedate = value
        End Set
    End Property
    Property Id() As Integer
        Get
            Return _id
        End Get
        Set(ByVal value As Integer)
            _id = value
        End Set
    End Property
    Property Name() As String
        Get
            Return _name
        End Get
        Set(ByVal value As String)
            _name = value
        End Set
    End Property
    Property GameList() As List(Of Game_vt)
        Get
            Return _gameList
        End Get
        Set(ByVal value As List(Of Game_vt))
            _gameList = value
        End Set
    End Property

    Public Sub New(ByVal IdExt As Integer, ByVal CountryExt As String, ByVal CommentExt As String, ByVal NameExt As String, ByVal GamedateListExt As List(Of Game_vt), ByVal sportId As Integer, ByVal SportnumExt As Integer, ByVal GamedateExt As String, ByVal extGameMainTitle As SportInterfacce)
        _comment = CommentExt
        If CountryExt <> "INT" Then
            Dim intProg As New interfaceprog
            _country = intProg.getCountry(CountryExt)
        End If
        _sportNum = SportnumExt
        _gamedate = GamedateExt
        _id = IdExt
        _name = NameExt
        _gameList = GamedateListExt
        _gameMainTitle = extGameMainTitle
    End Sub

    Public Sub New()
        _id = -1
        _name = ""
        _gameList = New List(Of Game_vt)
    End Sub
End Class



Public Class Game_vt
    Private _eventsMain As List(Of Dictionary(Of List(Of WebReference.Event), String))
    Private _eventsOthers As Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event))))
    Private _id As Integer
    Private _lineNo As String
    Private _gameDate As Date
    Private _status As String
    Private _player1 As Player
    Private _player2 As Player
    Private _comments As String
    Private _liveComments As String
    Private _empty_event As WebReference.Event
    Private _isLive As String
    Private _printComment As String

    Public Property IsLive() As String
        Get
            Return _isLive
        End Get
        Set(ByVal value As String)
            _isLive = value
        End Set
    End Property
    Public Property PrintComment() As String
        Get
            Return _printComment
        End Get
        Set(ByVal value As String)
            _printComment = value
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
    Public Property LineNo() As String
        Get
            Return _lineNo
        End Get
        Set(ByVal value As String)
            _lineNo = value
        End Set
    End Property
    Public Property GameDate() As Date
        Get
            Return _gameDate
        End Get
        Set(ByVal value As Date)
            _gameDate = value
        End Set
    End Property
    Public Property Player1() As Player
        Get
            Return _player1
        End Get
        Set(ByVal value As Player)
            _player1 = value
        End Set
    End Property
    Public Property Player2() As Player
        Get
            Return _player2
        End Get
        Set(ByVal value As Player)
            _player2 = value
        End Set
    End Property
    Public Property Comments() As String
        Get
            Return _comments
        End Get
        Set(ByVal value As String)
            _comments = value
        End Set
    End Property
    Public Property LiveComments() As String
        Get
            Return _liveComments
        End Get
        Set(ByVal value As String)
            _liveComments = value
        End Set
    End Property
    Public ReadOnly Property Empty_Event() As WebReference.Event
        Get
            Return _empty_event
        End Get
    End Property
    Public Property EventsMain() As List(Of Dictionary(Of List(Of WebReference.Event), String))
        Get
            Return _eventsMain
        End Get
        Set(ByVal value As List(Of Dictionary(Of List(Of WebReference.Event), String)))
            _eventsMain = value
        End Set
    End Property

    Public Property EventsOthers() As Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event))))
        Get
            Return _eventsOthers
        End Get
        Set(ByVal value As Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))))
            _eventsOthers = value
        End Set
    End Property

    Public Sub New(ByVal sportId As Integer, ByVal oneGame As Game, ByRef x2i As Xml2Interface)
        _id = oneGame.Id
        'Dim aa As String
        'If oneGame.Id = 239821 Then
        '    aa = "b"
        'End If
        _printComment = oneGame.PrintComment
        _lineNo = oneGame.LineNo
        _gameDate = oneGame.GameDate
        _status = oneGame.Status
        _player1 = oneGame.Player1
        _player2 = oneGame.Player2
        _comments = oneGame.Comment
        _liveComments = oneGame.LiveComment        
        _eventsMain = New List(Of Dictionary(Of List(Of WebReference.Event), String))

        _eventsOthers = New Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event))))

        _empty_event = New WebReference.Event
        _empty_event.Id = -1
        _isLive = "0"

        Dim gameInterface As New SportInterfacce
        If Not x2i.SportDict.TryGetValue(sportId, gameInterface) Then
            If Not x2i.SportDict.TryGetValue(-1, gameInterface) Then
                'error
            End If
        End If

        Dim a As String = ""
        Dim icount As Integer = 0
        Dim lasttotalcount As Integer = 0

        'Dim isTotalInMainTitle As Boolean = False
        Dim tempEvent As WebReference.Event
        'Dim rexp As New Regex("(.*)команда 1(.*)")
        'Dim rexp2 As New Regex("(.*)команда 2(.*)")

        Dim eventsArr As List(Of WebReference.Event)
        eventsArr = oneGame.Events.ToList
        Dim addedFlag As Boolean = False
        Dim eventsList As List(Of WebReference.Event)
        Dim groupEventsLists As Dictionary(Of List(Of WebReference.Event), String)
        For Each group As Dictionary(Of String, List(Of xmlBet)) In gameInterface.Main
            groupEventsLists = New Dictionary(Of List(Of WebReference.Event), String)
            For Each kvpBetsWithTitle As KeyValuePair(Of String, List(Of xmlBet)) In group
                eventsList = New List(Of WebReference.Event)
                For Each bet As xmlBet In kvpBetsWithTitle.Value
                    addedFlag = False
                    For Each oneEvent As WebReference.Event In eventsArr
                        If (oneEvent.IsLive = "Y" OrElse oneEvent.IsLive = "O") AndAlso (oneEvent.Status <> "C" AndAlso oneEvent.Status <> "N" AndAlso oneEvent.Status <> "D") Then
                            _isLive = "1"
                        End If
                        'If oneEvent.TypeCode = bet Then
                        If oneEvent.TypeCode = bet.Typecode _
                                                    AndAlso (bet.Allowance = 0 OrElse bet.Allowance = oneEvent.Allowance) _
                                                    AndAlso (bet.Score1 = 0 OrElse bet.Score1 = oneEvent.Score1) _
                                                    AndAlso (bet.Score2 = 0 OrElse bet.Score1 = oneEvent.Score2) _
                                                    AndAlso (bet.Periodnr = 0 OrElse bet.Periodnr = oneEvent.PeriodNr) _
                                                    AndAlso (bet.Total = 0 OrElse bet.Total = oneEvent.Total) _
                                                    AndAlso bet.IsEnabledEvent = True Then
                            'If rexp.IsMatch(oneEvent.Name) Then
                            '    oneEvent.Name += " (" + _player1.Name + ")"
                            'End If
                            'If rexp2.IsMatch(oneEvent.Name) Then
                            '    oneEvent.Name += " (" + _player2.Name + ")"
                            'End If
                            oneEvent.Name.Replace("команда 1", _player1.Name).Replace("команда 2", _player2.Name)
                            icount = icount + 1
                            If oneEvent.Total <> 0 Then
                                oneEvent.Total = 0
                            End If
                            eventsList.Add(oneEvent)
                            eventsArr.Remove(oneEvent)
                            addedFlag = True

                            Exit For

                        ElseIf oneEvent.TypeCode = bet.Typecode AndAlso bet.IsEnabledEvent = False Then

                            tempEvent = New WebReference.Event()
                            tempEvent.Id = -2
                            tempEvent.Total = oneEvent.Total
                            eventsList.Add(tempEvent)
                        End If
                    Next
                    If addedFlag = False Then
                        eventsList.Add(_empty_event)
                    End If
                Next
                If eventsList.Count = 1 Then
                    groupEventsLists.Add(eventsList, "one")
                ElseIf eventsList.Count > 1 Then
                    groupEventsLists.Add(eventsList, "many")
                End If

            Next
            _eventsMain.Add(groupEventsLists)
        Next
        Dim tempkey As String = ""
        'Dim sectionsDict
        Dim additGroups As Dictionary(Of String, List(Of WebReference.Event))
        Dim additgroupsUp As Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))
        Dim additEventsList As List(Of WebReference.Event)

        For Each kvpup As KeyValuePair(Of String, Dictionary(Of String, Dictionary(Of String, List(Of xmlBet)))) In gameInterface.Additional
            additgroupsUp = New Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))
            For Each kvpSection As KeyValuePair(Of String, Dictionary(Of String, List(Of xmlBet))) In kvpup.Value
                additGroups = New Dictionary(Of String, List(Of WebReference.Event))
                For Each kvpGroups As KeyValuePair(Of String, List(Of xmlBet)) In kvpSection.Value
                    additEventsList = New List(Of WebReference.Event)
                    For Each bet As xmlBet In kvpGroups.Value
                        addedFlag = False
                        For Each oneEvent As WebReference.Event In eventsArr
                            'If oneEvent.Name.Length > 16 Then
                            '    oneEvent.Name = oneEvent.Name.Substring(0, 15)
                            'End If
                            If (oneEvent.IsLive = "Y" OrElse oneEvent.IsLive = "O") AndAlso (oneEvent.Status <> "C" AndAlso oneEvent.Status <> "N" AndAlso oneEvent.Status <> "D") Then
                                _isLive = "1"
                            End If
                            If oneEvent.TypeCode = bet.Typecode _
                                                    AndAlso (bet.Allowance = 0 OrElse bet.Allowance = oneEvent.Allowance) _
                                                    AndAlso (bet.Score1 = 0 OrElse bet.Score1 = oneEvent.Score1) _
                                                    AndAlso (bet.Score2 = 0 OrElse bet.Score1 = oneEvent.Score2) _
                                                    AndAlso (bet.Periodnr = 0 OrElse bet.Periodnr = oneEvent.PeriodNr) _
                                                    AndAlso (bet.Total = 0 OrElse bet.Total = oneEvent.Total) Then
                                'If rexp.IsMatch(oneEvent.Name) Then
                                '    oneEvent.Name += " (" + _player1.Name + ")"
                                'End If
                                'If rexp2.IsMatch(oneEvent.Name) Then
                                '    oneEvent.Name += " (" + _player2.Name + ")"
                                'End If
                                oneEvent.Name.Replace("команда 1", _player1.Name).Replace("команда 2", _player2.Name)
                                additEventsList.Add(oneEvent)
                                eventsArr.Remove(oneEvent)
                                addedFlag = True
                                'If oneEvent.TypeCode <> 86 AndAlso oneEvent.TypeCode <> 87 AndAlso oneEvent.TypeCode <> 6 AndAlso oneEvent.TypeCode <> 7 Then
                                Exit For
                                'End If
                            End If
                        Next
                        'If addedFlag = False Then
                        '    additEventsList.Add(_empty_event)
                        'End If
                    Next
                    If additEventsList.Count > 0 Then
                        tempkey = kvpGroups.Key
                        'If rexp.IsMatch(tempkey) Then
                        '    tempkey += " (" + _player1.Name + ")"
                        'End If
                        'If rexp2.IsMatch(tempkey) Then
                        '    tempkey += " (" + _player2.Name + ")"
                        'End If
                        tempkey.Replace("команда 1", _player1.Name).Replace("команда 2", _player2.Name)
                        additGroups.Add(tempkey, additEventsList)
                    End If
                Next
                If additGroups.Count > 0 Then
                    tempkey = kvpSection.Key
                    'If rexp.IsMatch(tempkey) Then
                    '    tempkey += " (" + _player1.Name + ")"
                    'End If
                    'If rexp2.IsMatch(tempkey) Then
                    '    tempkey += " (" + _player2.Name + ")"
                    'End If
                    tempkey.Replace("команда 1", _player1.Name).Replace("команда 2", _player2.Name)
                    additgroupsUp.Add(tempkey, additGroups)
                End If
                '_eventsOthers.Add(kvpSection.Key, additGroups)
            Next
            _eventsOthers.Add(kvpup.Key, additgroupsUp)
        Next

        Dim othersgroupUp As New Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))
        Dim othersGroup As New Dictionary(Of String, List(Of WebReference.Event))
        Dim othersList As New List(Of WebReference.Event)
        Dim temptypecode As String = ""
        For Each oneEvent As WebReference.Event In eventsArr
            'oneEvent.TypeCode = -100
            'othersList.Add(oneEvent)
            temptypecode = oneEvent.TypeCode.ToString()
            oneEvent.TypeCode = -100
            If othersGroup.TryGetValue(temptypecode, othersList) Then
                othersList.Add(oneEvent)
            Else                
                othersList = New List(Of WebReference.Event)
                othersList.Add(oneEvent)
                othersGroup.Add(temptypecode, othersList)
            End If
        Next
        If othersGroup.Count > 0 Then
            'othersGroup.Add("Others", othersList)
            othersgroupUp.Add("Others", othersGroup)
            _eventsOthers.Add("Others", othersgroupUp)
        End If

    End Sub



End Class

