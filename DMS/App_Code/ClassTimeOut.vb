Imports Microsoft.VisualBasic

Namespace OEEtableadapters

    Partial Public Class OEEMasterByWeekTableAdapter


        Public Property Selectcommandtimeout() As Integer
            Get
                'Me.CommandCollection[0].CommandTimeout()

            End Get
            Set(ByVal value As Integer)

                For i = 0 To Me.CommandCollection.Length



                Next




            End Set
        End Property






    End Class





End Namespace