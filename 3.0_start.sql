--Query will look like this, but with extra joins
SELECT r.region, sr.sub_region, ca.country_area_name, hs.site_name, hsc.category_name    
	FROM heritage_site hs        
		LEFT JOIN heritage_site_jurisdiction hsj                
			ON hs.heritage_site_id = hsj.heritage_site_id       
		LEFT JOIN country_area ca                
			ON hsj.country_area_id = ca.country_area_id
		LEFT JOIN region r
			ON ca.region_id = r.region_id
		LEFT JOIN sub_region sr
			ON ca.sub_region_id = sr.sub_region_id
		LEFT JOIN heritage_site_category hsc
			ON hs.heritage_site_category_id = hsc.category_id
	WHERE ca.country_area_id = 47    
		OR ca.country_area_id = 48
		OR ca.country_area_id = 49
	ORDER BY r.region, sr.sub_region, ca.country_area_name, hs.site_name, hsc.category_name;