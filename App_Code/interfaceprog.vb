Imports Microsoft.VisualBasic
Imports WebReference
Imports System.IO
Imports System.Xml.XPath
Imports System.Xml


Public Class interfaceprog
    Private _userenv As ResponseUserEnv
    Private _countryDict As Dictionary(Of String, String)

    Public Property CountryDict() As Dictionary(Of String, String)
        Get
            Return _countryDict
        End Get
        Set(ByVal value As Dictionary(Of String, String))
            _countryDict = value
        End Set
    End Property
    Public Property UserEnv() as ResponseUserEnv
        Get
            Return _userenv
        End Get
        Set(ByVal value As ResponseUserEnv)
            _userenv = value
        End Set
    End Property

    Public Sub New()
        getEfuSession()
        
    End Sub

    Public Sub getCountryDict()
        Dim cd As Dictionary(Of String, String)
        Try
            cd = CType(HttpContext.Current.Session("countryDict"), Dictionary(Of String, String))
            If cd.Count > 0 Then
                _countryDict = cd
            End If
        Catch ex As Exception
            _countryDict = New Dictionary(Of String, String)
        End Try
    End Sub


    Public Function getEfuSession() As EFU
        Dim ef As EFU
        Try
            ef = CType(HttpContext.Current.Session("efu_sess"), EFU)
            If Equals(ef.GetType, Nothing) Then
                ef = newEfu()
            End If
        Catch ex As Exception
            ef = newEfu()
        End Try
        Return ef
    End Function

    Public Function getCountry(ByVal countryCode As String) As String
        If _countryDict Is Nothing OrElse _countryDict.Count = 0 Then
            getCountryDict()
        End If
        Dim countryName As String = ""
        If _countryDict.TryGetValue(countryCode, countryName) Then
            Return countryName
        Else
            Return countryCode
        End If
    End Function

    Public Function newEfu() As EFU
        Dim ef As New EFU
        Try
            ef.Credentials = New Net.NetworkCredential("morel333", "eufAJ395", "EFU")
            ef.CookieContainer = New Net.CookieContainer()
            _userenv = ef.Connect("RU")
            HttpContext.Current.Session("efu_sess") = ef
            HttpContext.Current.Session("user") = Nothing
            _countryDict = New Dictionary(Of String, String)
            For Each dictent As DictEntry In _userenv.UserEnv.Dictionary.Countries
                _countryDict.Add(dictent.Code, dictent.Name)
            Next
            HttpContext.Current.Session("countryDict") = _countryDict
        Catch ex As Exception
            ef = Nothing
        End Try
        Return ef
    End Function

    Public Shared Function getEfuUser() As User
        Dim user As User
        Try
            user = CType(HttpContext.Current.Session("user"), User)
            If Equals(user, Nothing) OrElse user.FirstName = "" OrElse user.LastName = "" Then
                user = Nothing
            End If
        Catch ex As Exception
            user = Nothing
        End Try
        Return user
    End Function

    Public Shared Function getUserLanguage() As String
        Dim language As String = ""
        Dim user As User = getEfuUser()
        If Not Equals(user, Nothing) Then
            language = user.LangCode.Trim
        Else
            language = "RU"
        End If
        Return language
    End Function

    Public Shared Function getPageName(ByVal requestRawUrl As String) As String
        Dim rexp As New Regex("/(?<page_name>\w+).aspx(.*)", RegexOptions.IgnoreCase)
        Dim match As Match = rexp.Match(requestRawUrl)
        Dim groups As GroupCollection = match.Groups
        Dim page_name As String = ""

        'match = rexp.Match(requestRawUrl)
        'groups = match.Groups
        page_name = groups("page_name").Value.ToString

        Return page_name
    End Function
End Class

Public Class Xml2Interface
    Private _sportDict As Dictionary(Of Integer, SportInterfacce)

    Public Property SportDict() As Dictionary(Of Integer, SportInterfacce)
        Get
            Return _sportDict
        End Get
        Set(ByVal value As Dictionary(Of Integer, SportInterfacce))
            _sportDict = value
        End Set
    End Property
    
    Public Sub New()
        _sportDict = New Dictionary(Of Integer, SportInterfacce)
        Dim sportCode As Integer = -100
        Dim sIface As SportInterfacce

        Dim doc As New XmlDocument

        Dim rootPath As String = HttpContext.Current.Server.MapPath("~")
        doc.Load(rootPath + "\xml\sport_default.xml")
        Dim sports As XmlNodeList = doc.GetElementsByTagName("sport")
        For Each sport As XmlNode In sports
            If Integer.TryParse(sport.Attributes("code").Value, sportCode) Then
                sIface = New SportInterfacce()

                sIface.addMain(sport.ChildNodes(0))
                sIface.addAdditional(sport.ChildNodes(1))

                _sportDict.Add(sportCode, sIface)
            Else
                'error sportCode tryparse
            End If

        Next
    End Sub
End Class

Public Class SportInterfacce
    Private _main As List(Of Dictionary(Of String, List(Of xmlBet)))
    Private _additional As Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of xmlBet))))
    Private _userLanguage As String

    Property Main() As List(Of Dictionary(Of String, List(Of xmlBet)))
        Get
            Return _main
        End Get
        Set(ByVal value As List(Of Dictionary(Of String, List(Of xmlBet))))
            _main = value
        End Set
    End Property
    Property Additional() As Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of xmlBet))))
        Get
            Return _additional
        End Get
        Set(ByVal value As Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of xmlBet)))))
            _additional = value
        End Set
    End Property
    Property UserLanguage() As String
        Get
            Return _userLanguage
        End Get
        Set(ByVal value As String)
            _userLanguage = value
        End Set
    End Property

    Public Sub addMain(ByVal part As XmlNode)
        _main = New List(Of Dictionary(Of String, List(Of xmlBet)))
        Dim tempDict As Dictionary(Of String, List(Of xmlBet))
        Dim tempList As New List(Of xmlBet)
        'Dim tempInt As Integer = -100
        Dim tempTypecode As Integer = -100
        Dim tempAllowance As Single = 0
        Dim tempTotal As Single = 0
        Dim tempScore1 As Integer = 0
        Dim tempScore2 As Integer = 0
        Dim tempPeriodnr As Integer = 0
        Dim isEnabledEvent As Boolean = True
        For Each group As XmlNode In part.ChildNodes
            tempDict = New Dictionary(Of String, List(Of xmlBet))
            For Each bet As XmlNode In group.ChildNodes            
                If Integer.TryParse(bet.Attributes("TypeCode").Value, tempTypecode) Then
                    If Not Single.TryParse(bet.Attributes("allowance").Value, tempAllowance) Then
                        tempAllowance = 0
                    End If
                    If Not Single.TryParse(bet.Attributes("total").Value, tempTotal) Then
                        tempTotal = 0
                    End If
                    If Not Integer.TryParse(bet.Attributes("score1").Value, tempScore1) Then
                        tempScore1 = 0
                    End If
                    If Not Integer.TryParse(bet.Attributes("score2").Value, tempScore2) Then
                        tempScore2 = 0
                    End If
                    If Not Integer.TryParse(bet.Attributes("periodnr").Value, tempPeriodnr) Then
                        tempPeriodnr = 0
                    End If
                    If Not Boolean.TryParse(bet.Attributes("enabled").Value, isEnabledEvent) Then
                        isEnabledEvent = True
                    End If
                    If tempDict.TryGetValue(bet.Attributes(_userLanguage).Value, tempList) Then
                        tempList.Add(New xmlBet(tempTypecode, tempAllowance, tempTotal, tempScore1, tempScore2, tempPeriodnr, "", isEnabledEvent))
                        tempDict(bet.Attributes(_userLanguage).Value) = tempList
                    Else
                        tempList = New List(Of xmlBet)
                        tempList.Add(New xmlBet(tempTypecode, tempAllowance, tempTotal, tempScore1, tempScore2, tempPeriodnr, "", isEnabledEvent))
                        tempDict.Add(bet.Attributes(_userLanguage).Value, tempList)
                    End If
                    'tempDict.Add(bet.Attributes(_userLanguage).Value, tempInt) 'keexist
                Else
                    'not critical error
                End If
            Next
            _main.Add(tempDict)
        Next
    End Sub

    Public Sub addAdditional(ByVal data As XmlNode)
        _additional = New Dictionary(Of String, Dictionary(Of String, Dictionary(Of String, List(Of xmlBet))))
        Dim tempDict As Dictionary(Of String, List(Of xmlBet))
        Dim tempPartDict As Dictionary(Of String, Dictionary(Of String, List(Of xmlBet)))
        Dim tempList As List(Of xmlBet)
        Dim tempTypecode As Integer = -100
        Dim tempAllowance As Single = 0
        Dim tempTotal As Single = 0
        Dim tempScore1 As Integer = 0
        Dim tempScore2 As Integer = 0
        Dim tempPeriodnr As Integer = 0
        Dim isEnabledEvent As Boolean = True
        Dim repitionDict As New Dictionary(Of String, Integer)
        Dim tempRepitionInt As Integer = 0
        Dim tempname As String = ""
        For Each onepart As XmlNode In data.ChildNodes
            tempPartDict = New Dictionary(Of String, Dictionary(Of String, List(Of xmlBet)))
            For Each section As XmlNode In onepart.ChildNodes
                tempDict = New Dictionary(Of String, List(Of xmlBet))

                For Each group As XmlNode In section.ChildNodes
                    tempList = New List(Of xmlBet)
                    For Each bet As XmlNode In group.ChildNodes
                        If Integer.TryParse(bet.Attributes("TypeCode").Value, tempTypecode) Then
                            If Not Single.TryParse(bet.Attributes("allowance").Value, tempAllowance) Then
                                tempAllowance = 0
                            End If
                            If Not Single.TryParse(bet.Attributes("total").Value, tempTotal) Then
                                tempTotal = 0
                            End If
                            If Not Integer.TryParse(bet.Attributes("score1").Value, tempScore1) Then
                                tempScore1 = 0
                            End If
                            If Not Integer.TryParse(bet.Attributes("score2").Value, tempScore2) Then
                                tempScore2 = 0
                            End If
                            If Not Integer.TryParse(bet.Attributes("periodnr").Value, tempPeriodnr) Then
                                tempPeriodnr = 0
                            End If
                            Try
                                tempname = bet.Attributes(_userLanguage).Value.ToString()
                            Catch ex As Exception
                                tempname = ""
                            End Try

                            tempList.Add(New xmlBet(tempTypecode, tempAllowance, tempTotal, tempScore1, tempScore2, tempPeriodnr, tempname))
                        End If
                    Next
                    If tempDict.ContainsKey(group.Attributes(_userLanguage).Value) Then
                        If repitionDict.TryGetValue(group.Attributes(_userLanguage).Value, tempRepitionInt) Then
                            tempRepitionInt += 1
                            repitionDict(group.Attributes(_userLanguage).Value) = tempRepitionInt
                        Else
                            tempRepitionInt = 1
                            repitionDict.Add(group.Attributes(_userLanguage).Value, tempRepitionInt)
                        End If
                        tempDict.Add(group.Attributes(_userLanguage).Value + tempRepitionInt.ToString(), tempList)
                    Else
                        tempDict.Add(group.Attributes(_userLanguage).Value, tempList)
                    End If
                    'tempDict.Add(group.Attributes(_userLanguage).Value, tempList)
                Next
                '_additional.Add(section.Attributes(_userLanguage).Value, tempDict)
                tempPartDict.Add(section.Attributes(_userLanguage).Value, tempDict)
            Next
            _additional.Add(onepart.Attributes(_userLanguage).Value, tempPartDict)
        Next
    End Sub

    Public Sub New()
        _userLanguage = interfaceprog.getUserLanguage
    End Sub
End Class

Public Class xmlBet
    Private _typecode As Integer
    Private _allowance As Single
    Private _total As Single
    Private _score1 As Integer
    Private _score2 As Integer
    Private _periodnr As Integer
    Private _isEnabledEvent As Boolean
    Private _name As String

    Public Property Name As String
        Get
            Return _name
        End Get
        Set(ByVal value As String)
            _name = value
        End Set
    End Property
    Public Property Typecode As Integer
        Get
            Return _typecode
        End Get
        Set(ByVal value As Integer)
            _typecode = value
        End Set
    End Property
    Public Property Allowance As Single
        Get
            Return _allowance
        End Get
        Set(ByVal value As Single)
            _allowance = value
        End Set
    End Property
    Public Property Total As Single
        Get
            Return _total
        End Get
        Set(ByVal value As Single)
            _total = value
        End Set
    End Property
    Public Property Score1 As Integer
        Get
            Return _score1
        End Get
        Set(ByVal value As Integer)
            _score1 = value
        End Set
    End Property
    Public Property Score2 As Integer
        Get
            Return _score2
        End Get
        Set(ByVal value As Integer)
            _score2 = value
        End Set
    End Property
    Public Property Periodnr As Integer
        Get
            Return _periodnr
        End Get
        Set(ByVal value As Integer)
            _periodnr = value
        End Set
    End Property
    Public Property IsEnabledEvent As Boolean
        Get
            Return _isEnabledEvent
        End Get
        Set(ByVal value As Boolean)
            _isEnabledEvent = value
        End Set
    End Property

    Public Sub New(ByVal Typecodeext As Integer, ByVal Allowanceext As Single, ByVal Totalext As Single, ByVal Score1ext As Integer, ByVal Score2ext As Single, ByVal Periodnrext As Integer, Optional ByVal Nameext As String = "", Optional ByVal IsEnabledEventext As Boolean = True)
        _typecode = Typecodeext
        _allowance = Allowanceext
        _total = Totalext
        _score1 = Score1ext
        _score2 = Score2ext
        _periodnr = Periodnr
        _isEnabledEvent = IsEnabledEventext
        _name = Nameext
    End Sub
End Class

Public Class LiveInterface
    Private _groupList As Dictionary(Of String, List(Of xmlBet))
    Private _userLanguage As String

    Public Property GroupList() As Dictionary(Of String, List(Of xmlBet))
        Get
            Return _groupList
        End Get
        Set(ByVal value As Dictionary(Of String, List(Of xmlBet)))
            _groupList = value
        End Set
    End Property
    Property UserLanguage() As String
        Get
            Return _userLanguage
        End Get
        Set(ByVal value As String)
            _userLanguage = value
        End Set
    End Property

    Public Sub New(ByVal sportId As Integer)
        _userLanguage = interfaceprog.getUserLanguage
        _groupList = New Dictionary(Of String, List(Of xmlBet))
        'Dim onegroup As New Dictionary(Of String, List(Of xmlBet))
        Dim templist As List(Of xmlBet)

        'Dim sportCode As Integer = -100
        Dim tempTypecode As Integer = -100
        Dim tempAllowance As Single = 0
        Dim tempTotal As Single = 0
        Dim tempScore1 As Integer = 0
        Dim tempScore2 As Integer = 0
        Dim tempPeriodnr As Integer = 0
        Dim isEnabledEvent As Boolean = True

        Dim doc As New XmlDocument

        Dim rootPath As String = HttpContext.Current.Server.MapPath("~")        
        If File.Exists(rootPath + "\xml\livexml\" + sportId.ToString() + ".xml") Then
            doc.Load(rootPath + "\xml\livexml\" + sportId.ToString() + ".xml")
        Else
            doc.Load(rootPath + "\xml\livexml\0.xml")
        End If

        Dim groups As XmlNodeList = doc.GetElementsByTagName("group")
        For Each groupxml As XmlNode In groups
            'onegroup = New Dictionary(Of String, List(Of WebReference.Event))
            templist = New List(Of xmlBet)
            For Each bet As XmlNode In groupxml.ChildNodes
                If Not Single.TryParse(bet.Attributes("TypeCode").Value, tempTypecode) Then
                    tempTypecode = 0
                End If
                If Not Single.TryParse(bet.Attributes("allowance").Value, tempAllowance) Then
                    tempAllowance = 0
                End If
                If Not Single.TryParse(bet.Attributes("total").Value, tempTotal) Then
                    tempTotal = 0
                End If
                If Not Integer.TryParse(bet.Attributes("score1").Value, tempScore1) Then
                    tempScore1 = 0
                End If
                If Not Integer.TryParse(bet.Attributes("score2").Value, tempScore2) Then
                    tempScore2 = 0
                End If
                If Not Integer.TryParse(bet.Attributes("periodnr").Value, tempPeriodnr) Then
                    tempPeriodnr = 0
                End If
                templist.Add(New xmlBet(tempTypecode, tempAllowance, tempTotal, tempScore1, tempScore2, tempPeriodnr))
            Next
            If _groupList.TryGetValue(groupxml.Attributes(_userLanguage).Value, templist) Then
                templist.Add(New xmlBet(tempTypecode, tempAllowance, tempTotal, tempScore1, tempScore2, tempPeriodnr, isEnabledEvent))
                _groupList(groupxml.Attributes(_userLanguage).Value) = templist
            Else
                templist = New List(Of xmlBet)
                templist.Add(New xmlBet(tempTypecode, tempAllowance, tempTotal, tempScore1, tempScore2, tempPeriodnr, isEnabledEvent))
                _groupList.Add(groupxml.Attributes(_userLanguage).Value, templist)
            End If
        Next
    End Sub
End Class