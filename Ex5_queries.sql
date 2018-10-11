--3.2 - Largest protected area in Africa

SELECT r.region_name as 'region', sr.sub_region_name as 'sub region', ca.country_area_name as 'country / area', hs.site_name, MAX(hs.area_hectares) as 'area (hectares)'
	FROM heritage_site hs
		LEFT JOIN heritage_site_jurisdiction hsj
			ON hs.heritage_site_id = hsj.heritage_site_id
		LEFT JOIN country_area ca
			ON hsj.country_area_id = ca.country_area_id
		LEFT JOIN location l
			ON ca.location_id = l.location_id
		JOIN region r
			ON l.region_id = r.region_id
		JOIN sub_region sr
			ON l.sub_region_id = sr.sub_region_id
	WHERE r.region_name = "Africa"
	GROUP BY r.region_name
	LIMIT 1;

--3.3 - Developed vs Developing Countries in Asia

#In Django python shell

from heritagesites.models import Location, Region, CountryArea, DevStatus
from django.db.models import Count
from django.db.models import F

loc = CountryArea.objects.select_related('location__region').select_related('location__sub_region').select_related('dev_status')

loc = loc.filter(location__region__region_name__in=['Asia'])


////


loc = CountryArea.objects.values(region_name=F('location__region__region_name'),dev_status1=F('dev_status__dev_status_name')).annotate(count=Count('country_area_id')).filter(location__region__region_name='Asia').order_by('dev_status__dev_status_name')

for l in loc:
    print(l)


////


loc = Location.objects.values(region_name = F('region__region_name'), dev_status = F('countryarea__dev_status__dev_status_name')).annotate(count=Count('countryarea__dev_status__dev_status_name')).filter(region__region_name = 'Asia').order_by('countryarea__dev_status__dev_status_name')

for l in loc:
    print(l)