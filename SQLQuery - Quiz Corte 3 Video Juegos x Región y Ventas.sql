select count(*) from VentasVideojuegos;

select * from VentasVideojuegos;


create view vista_regiones as
select Nombre, Plataforma, Ano, Genero, Editorial, VentasNA as Norteamerica, VentasEU as Europa, VentasJP as Japon, VentasOtros as Otros
from VentasVideojuegos;

create view vista_regionesyventas as
select Nombre, Plataforma, Ano, Genero, Editorial, Region, Ventas
		from vista_regiones 
		UNPIVOT
		(
		Ventas for Region in (Norteamerica, Europa, Japon, Otros)
) TAB;

select * from vista_regionesyventas
order by Nombre asc;


