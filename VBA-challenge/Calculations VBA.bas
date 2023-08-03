Attribute VB_Name = "Module1"
Sub BonusOrganize()
'Print Column Titles
Cells(1, 9).Value = "Ticker"
Cells(1, 10).Value = "Yearly Change"
Cells(1, 11).Value = "Percent Change"
Cells(1, 12).Value = "Total Stock Volume"
Cells(1, 15).Value = "Ticker"
Cells(1, 16).Value = "Value"
Cells(2, 14).Value = "Greatest % Increase"
Cells(3, 14).Value = "Greatest % Decrease"
Cells(4, 14).Value = "Greatest Total Volume"
ActiveSheet.Range("I1:P1").Font.Bold = True

    Dim LastRowA As Long
    Dim TickRow As Integer
    Dim VolumeCount As Double
    Dim OpenPrice As Double
    Dim ClosePrice As Double
    Dim PriceDiff As Double
' OPRCOunt = Opener Row Count
    Dim OPRCount As Double
    Dim OPSpot As Double

'BONUS Additions=======================================================================
    Dim LastRowL As Long
    Dim LastRowK As Long
    Dim GrIncrease As Double
    Dim GrIncreaseTicker As String
    Dim GrDecrease As Double
    Dim GrDecreaseTicker As String
    Dim GrTotalVol As Double
    Dim GrTotalVolTicker As String
'======================================================================================
    ' Last row of column "A" in the current sheet
    LastRowA = ActiveSheet.Cells(ActiveSheet.Rows.Count, "A").End(xlUp).Row
    LastRowL = ActiveSheet.Cells(ActiveSheet.Rows.Count, "L").End(xlUp).Row
    LastRowK = ActiveSheet.Cells(ActiveSheet.Rows.Count, "K").End(xlUp).Row
    
    'Moves the chart row
    TickRow = 2
    
    For i = 2 To LastRowA
        If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
            'Subtract i by OPRCount to get the Opener Price(DO NO MAKE OPSPOT = 0)
            OPSpot = i - OPRCount
            
            ' Saves Year's Open Price and Close Price
            OpenPrice = Cells(OPSpot, 3).Value
            ClosePrice = Cells(i, 6).Value
            PriceDiff = ClosePrice - OpenPrice
            
            ' Print the ticker/volume count of Cells(i, 1) under Ticker
            Cells(TickRow, 9).Value = Cells(i, 1).Value
            Cells(TickRow, 10).Value = PriceDiff
            Cells(TickRow, 11).Value = ((OpenPrice * PriceDiff) / 100)
            Cells(TickRow, 12).Value = VolumeCount
    
            ' Add 1 to TickRow (Moves to NextRow)
            ' Resets Count for others
            TickRow = TickRow + 1
            VolumeCount = 0
            OPRCount = 0
            PriceDiff = 0
    
        ' LET ELSE ADD UP THE DATA FOR THE CURRENT TICKER
        Else
            ' Will count rows up to the next ticker
            OPRCount = OPRCount + 1
            
            'Add Ticker's Volume
            VolumeCount = VolumeCount + Cells(i, 7).Value
        End If
    Next i
    
'Bonus============================================================================
    'Greatest Total Volume Loop
    Dim j As Long
    GrTotalVol = 0
    For j = 2 To LastRowL
        If Cells(j, 12).Value >= GrTotalVol Then
            GrTotalVol = Cells(j, 12).Value
            GrTotalVolTicker = Cells(j, 9).Value
        End If
        Cells(4, 15).Value = GrTotalVolTicker
        Cells(4, 16).Value = GrTotalVol
    Next j
    
    'Greatest Increase and Decrease Loop
    Dim k As Long
    GrIncrease = 0
    GrDecrease = 0
    For k = 2 To LastRowK
        If Cells(k, 11).Value >= GrIncrease Then
        GrIncrease = Cells(k, 11).Value
        GrIncreaseTicker = Cells(k, 9).Value
        
        ElseIf Cells(k, 11).Value <= GrDecrease Then
        GrDecrease = Cells(k, 11).Value
        GrDecreaseTicker = Cells(k, 9).Value
        
        End If
        Cells(2, 16).Value = GrIncrease
        Cells(2, 15).Value = GrIncreaseTicker
        Cells(3, 16).Value = GrDecrease
        Cells(3, 15).Value = GrDecreaseTicker
    Next k
End Sub

