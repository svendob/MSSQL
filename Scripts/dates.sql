declare @Dato datetime

select @Dato = getdate()
select @Dato = '19700708 23:59'

select @Dato 'Default'
      ,dbo.fCSPPadNumber(day(@Dato), 2) + dbo.fCSPPadNumber(month(@Dato), 2) + substring(convert(varchar, year(@Dato)), 3,2) 'ddmmyy'
      ,convert(varchar, @Dato, 0) 'Default'
      ,convert(varchar, @Dato, 100) 'Default mon dd yyyy hh:miAM (or PM)'
      ,convert(varchar, @Dato, 1) 'USA'
      ,convert(varchar, @Dato, 101) 'USA mm/dd/yy'
      ,convert(varchar, @Dato, 2) 'ANSI'
      ,convert(varchar, @Dato, 102) 'ANSI yy.mm.dd'
      ,convert(varchar, @Dato, 3) 'British/French'
      ,convert(varchar, @Dato, 103) 'British/French dd/mm/yy'
      ,convert(varchar, @Dato, 4) 'German'
      ,convert(varchar, @Dato, 104) 'German dd.mm.yy'
      ,convert(varchar, @Dato, 5) 'Italian'
      ,convert(varchar, @Dato, 105) 'Italian dd-mm-yy'
      ,convert(varchar, @Dato, 6) 'Var1'
      ,convert(varchar, @Dato, 106) 'Var1 - dd mon yy'
      ,convert(varchar, @Dato, 7) 'Var2'
      ,convert(varchar, @Dato, 107) 'Var2 - Mon dd, yy'
      ,convert(varchar, @Dato, 8) 'Var3'
      ,convert(varchar, @Dato, 108) 'Var3 - hh:mm:ss '
      ,convert(varchar, @Dato, 9) 'DefaultMilliseconds'
      ,convert(varchar, @Dato, 109) 'DefaultMilliseconds mon dd yyyy hh:mi:ss:mmmAM (or PM) '
      ,convert(varchar, @Dato, 10) 'USA'
      ,convert(varchar, @Dato, 110) 'USA mm-dd-yy '
      ,convert(varchar, @Dato, 11) 'JAPAN'
      ,convert(varchar, @Dato, 111) 'JAPAN yy/mm/dd'
      ,convert(varchar, @Dato, 12) 'ISO'
      ,convert(varchar, @Dato, 112) 'ISO yymmdd'
      ,convert(varchar, @Dato, 13) 'EuropeDefaultMilliseconds'
      ,convert(varchar, @Dato, 113) 'EuropeDefaultMilliseconds dd mon yyyy hh:mm:ss:mmm(24h)'
      ,convert(varchar, @Dato, 14) 'Time'
      ,convert(varchar, @Dato, 114) 'Time hh:mi:ss:mmm(24h)'
      ,convert(varchar, @Dato, 20) 'ODBC'
      ,convert(varchar, @Dato, 120) 'ODBC canonical yyyy-mm-dd hh:mi:ss(24h)'
      ,convert(varchar, @Dato, 21) 'ODBCMilliseconds'

      ,convert(varchar, @Dato, 22) 'Undocumented mm/dd/yy hh:mi:ss AM/PM'

      ,convert(varchar, @Dato, 121) 'ODBCMilliseconds yyyy-mm-dd hh:mi:ss.mmm(24h)' 
      ,convert(varchar, @Dato, 126) 'XMLISO8601 yyyy-mm-dd Thh:mm:ss.mmm(no spaces)'
      ,convert(varchar, @Dato, 130) 'Hijri dd mon yyyy hh:mi:ss:mmmAM'
      ,convert(varchar, @Dato, 131) 'Hijri dd/mm/yy hh:mi:ss:mmmAM'


declare @xSec int
set @xSec = datediff(second, getdate(), getdate()+1)
select 
  convert(varchar(10), (@xSec/86400)) + ':' + 
  convert(varchar(10), ((@xSec%86400)/3600)) + ':'+
  convert(varchar(10), (((@xSec%86400)%3600)/60)) + ':'+
  convert(varchar(10), (((@xSec%86400)%3600)%60)) as 'DD:HH:MM:SS'


declare @anyDate datetime 
--select @anyDate = '20161230'
--select @anyDate = '20170101'
select @anyDate = getdate()

--Last year, from 01.01 00:00 this year
select DATEADD(yy, DATEDIFF(yy, 0, @anyDate), 0)
--Last month, from 01 00:00 this month
select DATEADD(m, DATEDIFF(m, 0, @anyDate), 0) 
--Last week, from mon. 00:00 this week
select CAST(FLOOR(CAST(
      DATEADD(dd, ((DATEPART(dw,@anyDate) + @@DateFirst - 1 + 13) % 7) * -1, @anyDate)
        AS float)) AS datetime)
--Last day, from 00:00 today
select CAST(FLOOR(CAST(@anyDate AS float)) AS datetime)