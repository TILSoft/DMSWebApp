﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.18449
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection


<Global.System.Data.Linq.Mapping.DatabaseAttribute(Name:="DMSDAQPROD3")>  _
Partial Public Class LinqLabourDataContext
	Inherits System.Data.Linq.DataContext
	
	Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource()
	
  #Region "Extensibility Method Definitions"
  Partial Private Sub OnCreated()
  End Sub
  Partial Private Sub InserttblLabourUtilisation(instance As tblLabourUtilisation)
    End Sub
  Partial Private Sub UpdatetblLabourUtilisation(instance As tblLabourUtilisation)
    End Sub
  Partial Private Sub DeletetblLabourUtilisation(instance As tblLabourUtilisation)
    End Sub
  #End Region
	
	Public Sub New()
		MyBase.New(Global.System.Configuration.ConfigurationManager.ConnectionStrings("DowntimeDBv2ConnectionString").ConnectionString, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public ReadOnly Property tblLabActivities() As System.Data.Linq.Table(Of tblLabActivity)
		Get
			Return Me.GetTable(Of tblLabActivity)
		End Get
	End Property
	
	Public ReadOnly Property tblLabourUtilisations() As System.Data.Linq.Table(Of tblLabourUtilisation)
		Get
			Return Me.GetTable(Of tblLabourUtilisation)
		End Get
	End Property
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.tblLabActivity")>  _
Partial Public Class tblLabActivity
	
	Private _LabourActivity As String
	
	Public Sub New()
		MyBase.New
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_LabourActivity", DbType:="NVarChar(50)")>  _
	Public Property LabourActivity() As String
		Get
			Return Me._LabourActivity
		End Get
		Set
			If (String.Equals(Me._LabourActivity, value) = false) Then
				Me._LabourActivity = value
			End If
		End Set
	End Property
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.tblLabourUtilisation")>  _
Partial Public Class tblLabourUtilisation
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _LabID As Integer
	
	Private _WkCtr As String
	
	Private _NoStaff As System.Nullable(Of Integer)
	
	Private _Hours As System.Nullable(Of Integer)
	
	Private _Date As System.Nullable(Of Date)
	
	Private _Signed As System.Nullable(Of Integer)
	
	Private _Activity As String
	
	Private _Shift As String
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub OnLabIDChanging(value As Integer)
    End Sub
    Partial Private Sub OnLabIDChanged()
    End Sub
    Partial Private Sub OnWkCtrChanging(value As String)
    End Sub
    Partial Private Sub OnWkCtrChanged()
    End Sub
    Partial Private Sub OnNoStaffChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnNoStaffChanged()
    End Sub
    Partial Private Sub OnHoursChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnHoursChanged()
    End Sub
    Partial Private Sub OnDateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub OnDateChanged()
    End Sub
    Partial Private Sub OnSignedChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnSignedChanged()
    End Sub
    Partial Private Sub OnActivityChanging(value As String)
    End Sub
    Partial Private Sub OnActivityChanged()
    End Sub
    Partial Private Sub OnShiftChanging(value As String)
    End Sub
    Partial Private Sub OnShiftChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		OnCreated
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_LabID", AutoSync:=AutoSync.OnInsert, DbType:="Int NOT NULL IDENTITY", IsPrimaryKey:=true, IsDbGenerated:=true)>  _
	Public Property LabID() As Integer
		Get
			Return Me._LabID
		End Get
		Set
			If ((Me._LabID = value)  _
						= false) Then
				Me.OnLabIDChanging(value)
				Me.SendPropertyChanging
				Me._LabID = value
				Me.SendPropertyChanged("LabID")
				Me.OnLabIDChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_WkCtr", DbType:="NVarChar(50)")>  _
	Public Property WkCtr() As String
		Get
			Return Me._WkCtr
		End Get
		Set
			If (String.Equals(Me._WkCtr, value) = false) Then
				Me.OnWkCtrChanging(value)
				Me.SendPropertyChanging
				Me._WkCtr = value
				Me.SendPropertyChanged("WkCtr")
				Me.OnWkCtrChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_NoStaff", DbType:="Int")>  _
	Public Property NoStaff() As System.Nullable(Of Integer)
		Get
			Return Me._NoStaff
		End Get
		Set
			If (Me._NoStaff.Equals(value) = false) Then
				Me.OnNoStaffChanging(value)
				Me.SendPropertyChanging
				Me._NoStaff = value
				Me.SendPropertyChanged("NoStaff")
				Me.OnNoStaffChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Hours", DbType:="Int")>  _
	Public Property Hours() As System.Nullable(Of Integer)
		Get
			Return Me._Hours
		End Get
		Set
			If (Me._Hours.Equals(value) = false) Then
				Me.OnHoursChanging(value)
				Me.SendPropertyChanging
				Me._Hours = value
				Me.SendPropertyChanged("Hours")
				Me.OnHoursChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Name:="Date", Storage:="_Date", DbType:="DateTime")>  _
	Public Property [Date]() As System.Nullable(Of Date)
		Get
			Return Me._Date
		End Get
		Set
			If (Me._Date.Equals(value) = false) Then
				Me.OnDateChanging(value)
				Me.SendPropertyChanging
				Me._Date = value
				Me.SendPropertyChanged("[Date]")
				Me.OnDateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Signed", DbType:="Int")>  _
	Public Property Signed() As System.Nullable(Of Integer)
		Get
			Return Me._Signed
		End Get
		Set
			If (Me._Signed.Equals(value) = false) Then
				Me.OnSignedChanging(value)
				Me.SendPropertyChanging
				Me._Signed = value
				Me.SendPropertyChanged("Signed")
				Me.OnSignedChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Activity", DbType:="NVarChar(50)")>  _
	Public Property Activity() As String
		Get
			Return Me._Activity
		End Get
		Set
			If (String.Equals(Me._Activity, value) = false) Then
				Me.OnActivityChanging(value)
				Me.SendPropertyChanging
				Me._Activity = value
				Me.SendPropertyChanged("Activity")
				Me.OnActivityChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Shift", DbType:="NVarChar(10)")>  _
	Public Property Shift() As String
		Get
			Return Me._Shift
		End Get
		Set
			If (String.Equals(Me._Shift, value) = false) Then
				Me.OnShiftChanging(value)
				Me.SendPropertyChanging
				Me._Shift = value
				Me.SendPropertyChanged("Shift")
				Me.OnShiftChanged
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class
