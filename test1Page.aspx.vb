Imports WebReference

Partial Class test1Page
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim d As Decimal
        Dim int As Integer
        d = 124
    End Sub
End Class

'Public Class Game_vt_1
'    Private _id As Integer
'    Private _lineNo As String
'    Private _gameDate As Date
'    Private _status As String
'    Private _player1 As Player
'    Private _player2 As Player
'    Private _comments As String
'    Private _liveComments As String
'    'Private _events_others As List(Of Dictionary(Of Integer, WebReference.Event))
'    'Private _events_others() As List(Of WebReference.Event)
'    Private _events_others As Dictionary(Of Integer, List(Of WebReference.Event))
'    Private _events_f1 As List(Of WebReference.Event)
'    Private _events_f1_Odd As Single
'    Private _events_f1_Name As String
'    Private _events_f2 As List(Of WebReference.Event)
'    Private _events_f2_Odd As Single
'    Private _events_f2_Name As String
'    Private _results As WebReference.Result()
'    Private _ev_P1 As WebReference.Event
'    Private _ev_X As WebReference.Event
'    Private _ev_P2 As WebReference.Event
'    Private _ev_1X As WebReference.Event
'    Private _ev_12 As WebReference.Event
'    Private _ev_X2 As WebReference.Event
'    Private _ev_T As Single
'    Private _ev_T_Flag As Boolean
'    Private _ev_TB As WebReference.Event
'    Private _ev_TM As WebReference.Event
'    Private _empty_event As WebReference.Event




'    'Public test_may_delete_bvt As New List(Of String)

'#Region "propesries"

'    Public ReadOnly Property Empty_Event() As WebReference.Event
'        Get
'            Return _empty_event
'        End Get
'    End Property

'    Public Property Ev_T() As Single
'        Get
'            Return _ev_T
'        End Get
'        Set(ByVal value As Single)
'            _ev_T = value
'        End Set
'    End Property
'    Public Property Ev_T_Flag() As Boolean
'        Get
'            Return _ev_T_Flag
'        End Get
'        Set(ByVal value As Boolean)
'            _ev_T_Flag = value
'        End Set
'    End Property
'    Public Property Events_f1_Name() As String
'        Get
'            Return _events_f1_Name
'        End Get
'        Set(ByVal value As String)
'            _events_f1_Name = value
'        End Set
'    End Property
'    Public Property Events_f2_Name() As String
'        Get
'            Return _events_f2_Name
'        End Get
'        Set(ByVal value As String)
'            _events_f2_Name = value
'        End Set
'    End Property
'    Public Property Events_f1_Odd() As Single
'        Get
'            Return _events_f1_Odd
'        End Get
'        Set(ByVal value As Single)
'            _events_f1_Odd = value
'        End Set
'    End Property
'    Public Property Events_f2_Odd() As Single
'        Get
'            Return _events_f2_Odd
'        End Get
'        Set(ByVal value As Single)
'            _events_f2_Odd = value
'        End Set
'    End Property
'    Public Property Ev_TM() As WebReference.Event
'        Get
'            Return _ev_TM
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_TM = value
'        End Set
'    End Property
'    Public Property Ev_TB() As WebReference.Event
'        Get
'            Return _ev_TB
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_TB = value
'        End Set
'    End Property
'    Public Property Ev_X2() As WebReference.Event
'        Get
'            Return _ev_X2
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_X2 = value
'        End Set
'    End Property
'    Public Property Ev_12() As WebReference.Event
'        Get
'            Return _ev_12
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_12 = value
'        End Set
'    End Property
'    Public Property Ev_1X() As WebReference.Event
'        Get
'            Return _ev_1X
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_1X = value
'        End Set
'    End Property
'    Public Property Ev_P2() As WebReference.Event
'        Get
'            Return _ev_P2
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_P2 = value
'        End Set
'    End Property
'    Public Property Ev_X() As WebReference.Event
'        Get
'            Return _ev_X
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_X = value
'        End Set
'    End Property
'    Public Property Ev_P1() As WebReference.Event
'        Get
'            Return _ev_P1
'        End Get
'        Set(ByVal value As WebReference.Event)
'            _ev_P1 = value
'        End Set
'    End Property
'    Public Property Id() As Integer
'        Get
'            Return _id
'        End Get
'        Set(ByVal value As Integer)
'            _id = value
'        End Set
'    End Property
'    Public Property LineNo() As String
'        Get
'            Return _lineNo
'        End Get
'        Set(ByVal value As String)
'            _lineNo = value
'        End Set
'    End Property
'    Public Property GameDate() As Date
'        Get
'            Return _gameDate
'        End Get
'        Set(ByVal value As Date)
'            _gameDate = value
'        End Set
'    End Property
'    Public Property Player1() As Player
'        Get
'            Return _player1
'        End Get
'        Set(ByVal value As Player)
'            _player1 = value
'        End Set
'    End Property
'    Public Property Player2() As Player
'        Get
'            Return _player2
'        End Get
'        Set(ByVal value As Player)
'            _player2 = value
'        End Set
'    End Property
'    Public Property Comments() As String
'        Get
'            Return _comments
'        End Get
'        Set(ByVal value As String)
'            _comments = value
'        End Set
'    End Property
'    Public Property LiveComments() As String
'        Get
'            Return _liveComments
'        End Get
'        Set(ByVal value As String)
'            _liveComments = value
'        End Set
'    End Property
'    'Public Property Events_others() As List(Of Dictionary(Of Integer, WebReference.Event))
'    '    Get
'    '        Return _events_others
'    '    End Get
'    '    Set(ByVal value As List(Of Dictionary(Of Integer, WebReference.Event)))
'    '        _events_others = value
'    '    End Set
'    'End Property
'    Public Property Events_others() As Dictionary(Of Integer, List(Of WebReference.Event))
'        Get
'            Return _events_others
'        End Get
'        Set(ByVal value As Dictionary(Of Integer, List(Of WebReference.Event)))
'            _events_others = value
'        End Set
'    End Property
'    Public Property Events_f1() As List(Of WebReference.Event)
'        Get
'            Return _events_f1
'        End Get
'        Set(ByVal value As List(Of WebReference.Event))
'            _events_f1 = value
'        End Set
'    End Property
'    Public Property Events_f2() As List(Of WebReference.Event)
'        Get
'            Return _events_f2
'        End Get
'        Set(ByVal value As List(Of WebReference.Event))
'            _events_f2 = value
'        End Set
'    End Property
'    Public Property Results() As WebReference.Result()
'        Get
'            Return _results
'        End Get
'        Set(ByVal value As WebReference.Result())
'            _results = value
'        End Set
'    End Property

'#End Region

'    Public Sub New(ByVal onegame As Game)
'        _id = onegame.Id
'        _lineNo = onegame.LineNo
'        _gameDate = onegame.GameDate
'        _status = onegame.Status
'        _player1 = onegame.Player1
'        _player2 = onegame.Player2
'        _comments = onegame.Comments
'        _liveComments = onegame.LiveComments
'        _results = onegame.Results
'        _events_f1 = New List(Of WebReference.Event)
'        _events_f2 = New List(Of WebReference.Event)
'        '_events_others = New List(Of Dictionary(Of Integer, WebReference.Event))        

'        _empty_event = New WebReference.Event
'        _empty_event.Id = -1

'        Dim maineventsIds As New Dictionary(Of Integer, Integer)
'        Dim boolOtherEvents As Boolean = False
'        Dim i As Integer = 0
'        'Dim events_dict_vt_may_delete As New Dictionary(Of Integer, WebReference.Event)
'        '72 группы элементов
'        'Dim _events_others(71) As List(Of WebReference.Event)
'        'ReDim _events_others(71)
'        'Dim vt_test_listof_listof_list As New List(Of Dictionary(Of String, List(Of WebReference.Event)))
'        'othereventslistArray(1) = New List(Of WebReference.Event)
'        'othereventslistArray(2) = New List(Of WebReference.Event)
'        'othereventslistArray(3) = New List(Of WebReference.Event)
'        'othereventslistArray(3).Add(_empty_event)
'        'othereventslistArray(4).Add(_empty_event)
'        _events_others = New Dictionary(Of Integer, List(Of WebReference.Event))
'        '_events_others.Add(0, _events_f1)
'        'For countAr = 0 To 70
'        '    '_events_others(countAr) = New List(Of WebReference.Event)
'        '    _events_others.Add(countAr, New List(Of WebReference.Event))
'        'Next    
'        Dim tempEventList As New List(Of WebReference.Event)
'        For Each oneEvent As WebReference.Event In onegame.Events
'            If oneEvent.Status <> "" Then
'                Dim a As String = "b"
'            End If
'            If boolOtherEvents = False AndAlso (oneEvent.TypeCode = 86 OrElse oneEvent.TypeCode = 87 OrElse Not maineventsIds.ContainsValue(oneEvent.TypeCode)) AndAlso oneEvent.TypeCode <> 7 Then
'                Select Case oneEvent.TypeCode
'                    Case 86
'                        _events_f1.Add(oneEvent)
'                    Case 87
'                        _events_f2.Add(oneEvent)
'                    Case 1
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_P1 = oneEvent
'                    Case 2
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_P2 = oneEvent
'                    Case 3
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_X = oneEvent
'                    Case 4
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_1X = oneEvent
'                    Case 18
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_12 = oneEvent
'                    Case 5
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_X2 = oneEvent
'                    Case 6
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_TB = oneEvent
'                    Case 7
'                        maineventsIds.Add(i, oneEvent.TypeCode)
'                        Ev_TM = oneEvent
'                End Select
'            Else
'                boolOtherEvents = True

'                Select Case oneEvent.TypeCode
'                    'Case 1 To 99999
'                    'events_dict_vt_may_delete.Add(i, oneEvent)
'                    'test_may_delete_bvt.Add("ID=" + oneEvent.TypeCode.ToString() + "; NAME=" + oneEvent.Name + "; ODD=" + oneEvent.Odd.ToString())
'                    Case 9, 10, 12, 13
'                        'Dim dict_9 As New Dictionary(Of String, List(Of WebReference.Event))
'                        'Dim i_9 As Int16 = 0
'                        'If i_9 Mod 3 Then
'                        '    dict_9.Add()
'                        'End If
'                        'i_9 = i_9 + 1
'                        If _events_others.TryGetValue(0, tempEventList) Then
'                            _events_others(0).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(0, tempEventList)
'                        End If
'                        '_events_others(0).Add(oneEvent)
'                    Case 16, 17
'                        If _events_others.TryGetValue(1, tempEventList) Then
'                            _events_others(1).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(1, tempEventList)
'                        End If
'                        '_events_others(1).Add(oneEvent)
'                    Case 381, 382
'                        If _events_others.TryGetValue(2, tempEventList) Then
'                            _events_others(2).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(2, tempEventList)
'                        End If
'                        '_events_others(2).Add(oneEvent)
'                    Case 30, 65, 31, 66, 32, 67
'                        If _events_others.TryGetValue(3, tempEventList) Then
'                            _events_others(3).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(3, tempEventList)
'                        End If
'                        '_events_others(3).Add(oneEvent)
'                    Case 33, 34, 88, 37, 383
'                        If _events_others.TryGetValue(4, tempEventList) Then
'                            _events_others(4).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(4, tempEventList)
'                        End If
'                        '_events_others(4).Add(oneEvent)
'                    Case 68, 89
'                        If _events_others.TryGetValue(5, tempEventList) Then
'                            _events_others(5).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(5, tempEventList)
'                        End If
'                        '_events_others(5).Add(oneEvent)
'                    Case 35, 36, 90, 38, 91
'                        If _events_others.TryGetValue(6, tempEventList) Then
'                            _events_others(6).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(6, tempEventList)
'                        End If
'                        '_events_others(6).Add(oneEvent)
'                    Case 501, 502, 503
'                        If _events_others.TryGetValue(7, tempEventList) Then
'                            _events_others(7).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(7, tempEventList)
'                        End If
'                        '_events_others(7).Add(oneEvent)
'                    Case 78, 79
'                        If _events_others.TryGetValue(8, tempEventList) Then
'                            _events_others(8).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(8, tempEventList)
'                        End If
'                        '_events_others(8).Add(oneEvent)
'                    Case 40, 63
'                        If _events_others.TryGetValue(8, tempEventList) Then
'                            _events_others(8).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(8, tempEventList)
'                        End If
'                        '_events_others(9).Add(oneEvent)
'                    Case 41, 64
'                        If _events_others.TryGetValue(10, tempEventList) Then
'                            _events_others(10).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(10, tempEventList)
'                        End If
'                        '_events_others(10).Add(oneEvent)
'                    Case 83, 84, 85
'                        If _events_others.TryGetValue(11, tempEventList) Then
'                            _events_others(11).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(11, tempEventList)
'                        End If
'                        '_events_others(11).Add(oneEvent)
'                    Case 51, 52, 53, 54, 55, 56, 57, 58, 59, 15, 19
'                        If _events_others.TryGetValue(12, tempEventList) Then
'                            _events_others(12).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(12, tempEventList)
'                        End If
'                        '_events_others(12).Add(oneEvent)
'                    Case 61, 62
'                        If _events_others.TryGetValue(13, tempEventList) Then
'                            _events_others(13).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(13, tempEventList)
'                        End If
'                        '_events_others(13).Add(oneEvent)
'                    Case 1001, 1003, 1002, 1004, 1018, 1005
'                        If _events_others.TryGetValue(14, tempEventList) Then
'                            _events_others(14).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(14, tempEventList)
'                        End If
'                        '_events_others(14).Add(oneEvent)
'                    Case 1086, 1087
'                        If _events_others.TryGetValue(15, tempEventList) Then
'                            _events_others(15).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(15, tempEventList)
'                        End If
'                        '_events_others(15).Add(oneEvent)
'                    Case 1006, 1007, 1009, 1010, 1012, 1013
'                        If _events_others.TryGetValue(16, tempEventList) Then
'                            _events_others(16).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(16, tempEventList)
'                        End If
'                        '_events_others(16).Add(oneEvent)
'                    Case 1030, 1065, 1031, 1066, 1032, 1067
'                        If _events_others.TryGetValue(17, tempEventList) Then
'                            _events_others(17).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(17, tempEventList)
'                        End If
'                        '_events_others(17).Add(oneEvent)
'                    Case 562, 561
'                        If _events_others.TryGetValue(18, tempEventList) Then
'                            _events_others(18).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(18, tempEventList)
'                        End If
'                        '_events_others(18).Add(oneEvent)
'                    Case 2001, 2003, 2002, 2004, 2018, 2005
'                        If _events_others.TryGetValue(19, tempEventList) Then
'                            _events_others(19).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(19, tempEventList)
'                        End If
'                        '_events_others(19).Add(oneEvent)
'                    Case 2086, 2087
'                        If _events_others.TryGetValue(20, tempEventList) Then
'                            _events_others(20).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(20, tempEventList)
'                        End If
'                        '_events_others(20).Add(oneEvent)
'                    Case 2006, 2007, 2009, 2010, 2012, 2013
'                        If _events_others.TryGetValue(21, tempEventList) Then
'                            _events_others(21).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(21, tempEventList)
'                        End If
'                        '_events_others(21).Add(oneEvent)
'                    Case 2030, 2065, 2031, 2066, 2032, 2067
'                        If _events_others.TryGetValue(22, tempEventList) Then
'                            _events_others(22).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(22, tempEventList)
'                        End If
'                        '_events_others(22).Add(oneEvent)
'                    Case 562, 561
'                        If _events_others.TryGetValue(23, tempEventList) Then
'                            _events_others(23).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(23, tempEventList)
'                        End If
'                        '_events_others(23).Add(oneEvent)
'                    Case 231, 233, 232, 234, 245, 235
'                        If _events_others.TryGetValue(24, tempEventList) Then
'                            _events_others(24).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(24, tempEventList)
'                        End If
'                        '_events_others(24).Add(oneEvent)
'                    Case 246, 247
'                        If _events_others.TryGetValue(25, tempEventList) Then
'                            _events_others(25).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(25, tempEventList)
'                        End If
'                        '_events_others(25).Add(oneEvent)
'                    Case 236, 237, 71, 239, 240, 242, 243
'                        If _events_others.TryGetValue(26, tempEventList) Then
'                            _events_others(26).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(26, tempEventList)
'                        End If
'                        '_events_others(26).Add(oneEvent)
'                    Case 75, 76, 77
'                        If _events_others.TryGetValue(27, tempEventList) Then
'                            _events_others(27).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(27, tempEventList)
'                        End If
'                        '_events_others(27).Add(oneEvent)
'                    Case 531, 532, 533
'                        If _events_others.TryGetValue(28, tempEventList) Then
'                            _events_others(28).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(28, tempEventList)
'                        End If
'                        '_events_others(28).Add(oneEvent)
'                    Case 246, 247
'                        If _events_others.TryGetValue(29, tempEventList) Then
'                            _events_others(29).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(29, tempEventList)
'                        End If
'                        '_events_others(29).Add(oneEvent)
'                    Case 236, 237
'                        If _events_others.TryGetValue(30, tempEventList) Then
'                            _events_others(30).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(30, tempEventList)
'                        End If
'                        '_events_others(30).Add(oneEvent)
'                    Case 246, 247
'                        If _events_others.TryGetValue(31, tempEventList) Then
'                            _events_others(31).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(31, tempEventList)
'                        End If
'                        '_events_others(31).Add(oneEvent)
'                    Case 236, 237
'                        If _events_others.TryGetValue(32, tempEventList) Then
'                            _events_others(32).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(32, tempEventList)
'                        End If
'                        '_events_others(32).Add(oneEvent)
'                    Case 201, 203, 202, 204, 215, 205
'                        If _events_others.TryGetValue(33, tempEventList) Then
'                            _events_others(33).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(33, tempEventList)
'                        End If
'                        '_events_others(33).Add(oneEvent)
'                    Case 216, 217
'                        If _events_others.TryGetValue(34, tempEventList) Then
'                            _events_others(34).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(34, tempEventList)
'                        End If
'                        '_events_others(34).Add(oneEvent)
'                    Case 206, 207, 209, 210, 212, 213
'                        If _events_others.TryGetValue(35, tempEventList) Then
'                            _events_others(35).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(35, tempEventList)
'                        End If
'                        '_events_others(35).Add(oneEvent)
'                    Case 69, 92, 72, 73, 74
'                        If _events_others.TryGetValue(36, tempEventList) Then
'                            _events_others(36).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(36, tempEventList)
'                        End If
'                        '_events_others(36).Add(oneEvent)
'                    Case 216, 217
'                        If _events_others.TryGetValue(37, tempEventList) Then
'                            _events_others(37).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(37, tempEventList)
'                        End If
'                        '_events_others(37).Add(oneEvent)
'                    Case 206, 207
'                        If _events_others.TryGetValue(38, tempEventList) Then
'                            _events_others(38).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(38, tempEventList)
'                        End If
'                        '_events_others(38).Add(oneEvent)
'                    Case 216, 217
'                        If _events_others.TryGetValue(39, tempEventList) Then
'                            _events_others(39).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(39, tempEventList)
'                        End If
'                        '_events_others(39).Add(oneEvent)
'                    Case 206, 207
'                        If _events_others.TryGetValue(40, tempEventList) Then
'                            _events_others(40).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(40, tempEventList)
'                        End If
'                        '_events_others(40).Add(oneEvent)
'                    Case 351, 353, 352, 354, 365, 355
'                        If _events_others.TryGetValue(41, tempEventList) Then
'                            _events_others(41).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(41, tempEventList)
'                        End If
'                        '_events_others(41).Add(oneEvent)
'                    Case 366, 367
'                        If _events_others.TryGetValue(42, tempEventList) Then
'                            _events_others(42).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(42, tempEventList)
'                        End If
'                        '_events_others(42).Add(oneEvent)
'                    Case 356, 357, 359, 360, 362, 363
'                        If _events_others.TryGetValue(43, tempEventList) Then
'                            _events_others(43).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(43, tempEventList)
'                        End If
'                        '_events_others(43).Add(oneEvent)
'                    Case 366, 367
'                        If _events_others.TryGetValue(44, tempEventList) Then
'                            _events_others(44).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(44, tempEventList)
'                        End If
'                        '_events_others(44).Add(oneEvent)
'                    Case 356, 357
'                        If _events_others.TryGetValue(45, tempEventList) Then
'                            _events_others(45).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(45, tempEventList)
'                        End If
'                        '_events_others(45).Add(oneEvent)
'                    Case 366, 367
'                        If _events_others.TryGetValue(46, tempEventList) Then
'                            _events_others(46).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(46, tempEventList)
'                        End If
'                        '_events_others(46).Add(oneEvent)
'                    Case 356, 357
'                        If _events_others.TryGetValue(47, tempEventList) Then
'                            _events_others(47).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(47, tempEventList)
'                        End If
'                        '_events_others(47).Add(oneEvent)
'                    Case 261, 263, 262, 264, 275, 265
'                        If _events_others.TryGetValue(48, tempEventList) Then
'                            _events_others(48).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(48, tempEventList)
'                        End If
'                        '_events_others(48).Add(oneEvent)
'                    Case 276, 277
'                        If _events_others.TryGetValue(49, tempEventList) Then
'                            _events_others(49).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(49, tempEventList)
'                        End If
'                        '_events_others(49).Add(oneEvent)
'                    Case 266, 267, 269, 270, 272, 273
'                        If _events_others.TryGetValue(50, tempEventList) Then
'                            _events_others(50).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(50, tempEventList)
'                        End If
'                        '_events_others(50).Add(oneEvent)
'                    Case 276, 277
'                        If _events_others.TryGetValue(51, tempEventList) Then
'                            _events_others(51).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(51, tempEventList)
'                        End If
'                        '_events_others(51).Add(oneEvent)
'                    Case 266, 267
'                        If _events_others.TryGetValue(52, tempEventList) Then
'                            _events_others(52).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(52, tempEventList)
'                        End If
'                        '_events_others(52).Add(oneEvent)
'                    Case 276, 277
'                        If _events_others.TryGetValue(53, tempEventList) Then
'                            _events_others(53).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(53, tempEventList)
'                        End If
'                        '_events_others(53).Add(oneEvent)
'                    Case 266, 267
'                        If _events_others.TryGetValue(54, tempEventList) Then
'                            _events_others(54).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(54, tempEventList)
'                        End If
'                        '_events_others(54).Add(oneEvent)
'                    Case 291, 293, 292, 294, 305, 295
'                        If _events_others.TryGetValue(55, tempEventList) Then
'                            _events_others(55).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(55, tempEventList)
'                        End If
'                        '_events_others(55).Add(oneEvent)
'                    Case 306, 307
'                        If _events_others.TryGetValue(56, tempEventList) Then
'                            _events_others(56).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(56, tempEventList)
'                        End If
'                        '_events_others(56).Add(oneEvent)
'                    Case 296, 297, 299, 300, 302, 303
'                        If _events_others.TryGetValue(57, tempEventList) Then
'                            _events_others(57).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(57, tempEventList)
'                        End If
'                        '_events_others(57).Add(oneEvent)
'                    Case 306, 307
'                        If _events_others.TryGetValue(58, tempEventList) Then
'                            _events_others(58).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(58, tempEventList)
'                        End If
'                        '_events_others(58).Add(oneEvent)
'                    Case 296, 297
'                        If _events_others.TryGetValue(59, tempEventList) Then
'                            _events_others(59).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(59, tempEventList)
'                        End If
'                        '_events_others(59).Add(oneEvent)
'                    Case 306, 307
'                        If _events_others.TryGetValue(60, tempEventList) Then
'                            _events_others(60).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(60, tempEventList)
'                        End If
'                        '_events_others(60).Add(oneEvent)
'                    Case 296, 297
'                        If _events_others.TryGetValue(61, tempEventList) Then
'                            _events_others(61).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(61, tempEventList)
'                        End If
'                        '_events_others(61).Add(oneEvent)
'                    Case 321, 323, 322, 324, 335, 325
'                        If _events_others.TryGetValue(62, tempEventList) Then
'                            _events_others(62).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(62, tempEventList)
'                        End If
'                        '_events_others(62).Add(oneEvent)
'                    Case 336, 337
'                        If _events_others.TryGetValue(63, tempEventList) Then
'                            _events_others(63).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(63, tempEventList)
'                        End If
'                        '_events_others(63).Add(oneEvent)
'                    Case 326, 327, 329, 330, 332, 333
'                        If _events_others.TryGetValue(64, tempEventList) Then
'                            _events_others(64).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(64, tempEventList)
'                        End If
'                        '_events_others(64).Add(oneEvent)
'                    Case 336, 337
'                        If _events_others.TryGetValue(65, tempEventList) Then
'                            _events_others(65).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(65, tempEventList)
'                        End If
'                        '_events_others(65).Add(oneEvent)
'                    Case 326, 327
'                        If _events_others.TryGetValue(66, tempEventList) Then
'                            _events_others(66).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(66, tempEventList)
'                        End If
'                        '_events_others(66).Add(oneEvent)
'                    Case 336, 337
'                        If _events_others.TryGetValue(67, tempEventList) Then
'                            _events_others(67).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(67, tempEventList)
'                        End If
'                        '_events_others(67).Add(oneEvent)
'                    Case 326, 327
'                        If _events_others.TryGetValue(68, tempEventList) Then
'                            _events_others(68).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(68, tempEventList)
'                        End If
'                        '_events_others(68).Add(oneEvent)
'                    Case 391, 392, 393, 80, 81, 82
'                        If _events_others.TryGetValue(69, tempEventList) Then
'                            _events_others(69).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(69, tempEventList)
'                        End If
'                        '_events_others(69).Add(oneEvent)
'                    Case 1, 3, 2, 4, 18, 5, 86, 87, 6, 7
'                        If _events_others.TryGetValue(70, tempEventList) Then
'                            _events_others(70).Add(oneEvent)
'                        Else
'                            tempEventList = New List(Of WebReference.Event)
'                            _events_others.Add(70, tempEventList)
'                        End If
'                        '_events_others(70).Add(oneEvent)
'                End Select
'                '_events_others.Add(events_dict_vt_may_delete)
'            End If
'            i = i + 1
'        Next
'        _ev_T_Flag = False
'        If _events_f1.Count > 0 Then
'            _events_f1_Odd = _events_f1(0).Odd
'            _events_f1_Name = _events_f1(0).Name
'        Else
'            _events_f1_Odd = -100
'            _events_f1_Name = ""
'        End If
'        If _events_f2.Count > 0 Then
'            _events_f2_Odd = _events_f2(0).Odd
'            _events_f2_Name = _events_f2(0).Name
'        Else
'            _events_f2_Odd = -100
'            _events_f2_Name = ""
'        End If
'        If Equals(_ev_P1, Nothing) Then
'            _ev_P1 = _empty_event
'        End If
'        If Equals(_ev_X, Nothing) Then
'            _ev_X = _empty_event
'        End If
'        If Equals(_ev_P2, Nothing) Then
'            _ev_P2 = _empty_event
'        End If
'        If Equals(_ev_1X, Nothing) Then
'            _ev_1X = _empty_event
'        End If
'        If Equals(_ev_12, Nothing) Then
'            _ev_12 = _empty_event
'        End If
'        If Equals(_ev_X2, Nothing) Then
'            _ev_X2 = _empty_event
'        End If
'        If Equals(_ev_TB, Nothing) Then
'            _ev_TB = _empty_event
'        Else
'            _ev_T = _ev_TB.Total
'            _ev_T_Flag = True
'        End If
'        If Equals(_ev_TM, Nothing) Then
'            _ev_TM = _empty_event
'        Else
'            _ev_T = _ev_TB.Total
'            _ev_T_Flag = True
'        End If
'        'If Equals(_ev_T, Nothing) Then
'        '    _ev_T = -9999
'        'End If
'    End Sub

'End Class
