select count(*) from VentasVideojuegos;

select * from VentasVideojuegos;

create view regiones as
select Nombre, Plataforma, Ano, Genero, Editorial, VentasNA as Norteamerica, VentasEU as Europa, VentasJP as Japon, VentasOtros as Otros
from VentasVideojuegos;

select Nombre, Plataforma, Ano, Genero, Editorial, Region, Ventas
		from regiones 
		UNPIVOT
		(
		Ventas for Region in (Norteamerica, Europa, Japon, Otros)
) TAB
order by Nombre asc;
