Imports interfaceprog
Imports WebReference

Partial Class testPage
    Inherits System.Web.UI.Page

End Class

'Public Class Game_vt_NEW
'    Private _eventsMain As List(Of List(Of List(Of WebReference.Event)))
'    Private _eventsOthers As Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))
'    Private _empty_event As WebReference.Event

'    Public ReadOnly Property Empty_Event() As WebReference.Event
'        Get
'            Return _empty_event
'        End Get
'    End Property
'    Public Property EventsMain() As List(Of List(Of List(Of WebReference.Event)))
'        Get
'            Return _eventsMain
'        End Get
'        Set(ByVal value As List(Of List(Of List(Of WebReference.Event))))
'            _eventsMain = value
'        End Set
'    End Property

'    Public Property EventsOthers() As Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))
'        Get
'            Return _eventsOthers
'        End Get
'        Set(ByVal value As Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event))))
'            _eventsOthers = value
'        End Set
'    End Property

'    Public Sub New(ByVal sportId As Integer, ByVal oneGame As Game, ByRef x2i As Xml2Interface)
'        _eventsMain = New List(Of List(Of List(Of WebReference.Event)))
'        _eventsOthers = New Dictionary(Of String, Dictionary(Of String, List(Of WebReference.Event)))

'        _empty_event = New WebReference.Event
'        _empty_event.Id = -1

'        Dim gameInterface As New SportInterfacce
'        If Not x2i.SportDict.TryGetValue(sportId, gameInterface) Then
'            If Not x2i.SportDict.TryGetValue(-1, gameInterface) Then
'                'error
'            End If
'        End If

'        Dim eventsArr As List(Of WebReference.Event)
'        eventsArr = oneGame.Events.ToList
'        Dim addedFlag As Boolean = False
'        Dim eventsList As List(Of WebReference.Event)
'        Dim groupEventsLists As List(Of List(Of WebReference.Event))
'        For Each group As Dictionary(Of String, List(Of Integer)) In gameInterface.Main
'            groupEventsLists = New List(Of List(Of WebReference.Event))
'            For Each kvpBetsWithTitle As KeyValuePair(Of String, List(Of Integer)) In group
'                eventsList = New List(Of WebReference.Event)
'                For Each bet As Integer In kvpBetsWithTitle.Value
'                    addedFlag = False
'                    For Each oneEvent As WebReference.Event In eventsArr
'                        If oneEvent.TypeCode = bet Then
'                            eventsList.Add(oneEvent)
'                            eventsArr.Remove(oneEvent)
'                            addedFlag = True
'                            Exit For
'                        End If                        
'                    Next
'                    If addedFlag = False Then
'                        eventsList.Add(_empty_event)
'                    End If
'                Next
'                groupEventsLists.Add(eventsList)
'            Next
'            _eventsMain.Add(groupEventsLists)
'        Next

'        'Dim sectionsDict
'        Dim additGroups As Dictionary(Of String, List(Of WebReference.Event))
'        Dim additEventsList As List(Of WebReference.Event)

'        For Each kvpSection As KeyValuePair(Of String, Dictionary(Of String, List(Of Integer))) In gameInterface.Additional
'            additGroups = New Dictionary(Of String, List(Of WebReference.Event))
'            For Each kvpGroups As KeyValuePair(Of String, List(Of Integer)) In kvpSection.Value
'                additEventsList = New List(Of WebReference.Event)
'                For Each bet As Integer In kvpGroups.Value
'                    addedFlag = False
'                    For Each oneEvent As WebReference.Event In eventsArr
'                        If oneEvent.TypeCode = bet Then
'                            additEventsList.Add(oneEvent)
'                            eventsArr.Remove(oneEvent)
'                            Exit For
'                        End If
'                    Next
'                    If addedFlag = False Then
'                        additEventsList.Add(_empty_event)
'                    End If
'                Next
'                additGroups.Add(kvpGroups.Key, additEventsList)
'            Next
'            _eventsOthers.Add(kvpSection.Key, additGroups)
'        Next

'        Dim othersGroup As New Dictionary(Of String, List(Of WebReference.Event))
'        Dim othersList As New List(Of WebReference.Event)
'        For Each oneEvent As WebReference.Event In eventsArr
'            othersList.Add(oneEvent)
'        Next
'        If othersList.Count > 0 Then
'            othersGroup.Add("Others", othersList)
'            _eventsOthers.Add("Others", othersGroup)
'        End If

'        'For Each listItem As List(Of List(Of WebReference.Event)) In _eventsMain
'        '    For Each li As List(Of WebReference.Event) In listItem
'        '        For Each oneevent As WebReference.Event In li

'        '        Next
'        '    Next
'        'Next
'        'For Each group As Dictionary(Of String, List(Of Integer)) In gameInterface.Main
'        '    'groupEventsLists = New List(Of List(Of WebReference.Event))
'        '    For Each kvpBetsWithTitle As KeyValuePair(Of String, List(Of Integer)) In group
'        '        'eventsList = New List(Of WebReference.Event)
'        '        For Each bet As Integer In kvpBetsWithTitle.Value
'        '            For Each oneEvent As WebReference.Event In eventsArr
'        '                If oneEvent.TypeCode = bet Then
'        '                    'eventsList.Add(oneEvent)
'        '                    eventsArr.Remove(oneEvent)
'        '                    Exit For
'        '                End If
'        '            Next
'        '        Next
'        '        'groupEventsLists.Add(eventsList)
'        '    Next
'        '    '_eventsMain.Add(groupEventsLists)
'        'Next

'    End Sub



'End Class
