/*  Upit koji prikazuje naziv lijeka i njegovu kolicinu koja je prodana,
	sortirano od najprodavanijeg lijeka
*/

select l.naziv,sum(f.kolicina) as kolicina,v.godina
from Fact_Prodaja f
join Dim_Lijek l on l.lijek_id = f.dim_lijek_id
join Dim_Apoteka a on a.apoteka_id = f.dim_apoteka_id 
join Dim_Kupac k on k.kupac_id = f.dim_kupac_id
join Dim_Vrijeme v on v.vrijeme_id = f.dim_vrijeme_id
group by l.naziv,v.godina

/*
Upit koji prikazuje naziv apoteke,grada u kojem se nalazi apoteka,nazive lijekova koje je apoteka nabavila
 i koje ih je godine nabavila.
*/
select a.naziv,
	   a.grad,
	   l.naziv,
	   sum(f.kolicina)as kolicina,
	   v.godina
from Fact_Nabavka f
join Dim_Lijek l on l.lijek_id = f.dim_lijek_id
join Dim_Apoteka a on a.apoteka_id = f.dim_apoteka_id 
join Dim_Dobavljac d on d.dobavljac_id= f.dim_dobavljac_id
join Dim_Vrijeme v on v.vrijeme_id = f.dim_vrijeme_id
group by a.naziv,l.naziv,a.grad,v.godina


/*Upit koji prikazuje naziv apoteke,u kojem se gradu nalazi apoteka 
i njene uposlenike koji su prodali najveæu kolièinu lijekova u odreðenoj godini
*/

select a.naziv,
	   a.grad,
	   z.ime,
	   z.prezime,
	   sum(f.kolicina) as "kolicina prodatih lijekova",
	   v.godina
from Fact_Promet_Zaposlenika f
join Dim_Zaposlenik z on z.zaposlenik_id = f.dim_zaposlenik_id
join Dim_Vrijeme v on v.vrijeme_id = f.dim_vrijeme_id
join Dim_Apoteka a on a.apoteka_id = f.dim_apoteka_id
group by a.naziv,a.grad,z.ime,z.prezime,v.godina