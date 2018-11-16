import django_filters
from heritagesites.models import CountryArea, HeritageSite, HeritageSiteCategory, \
	IntermediateRegion, SubRegion, Region


class HeritageSiteFilter(django_filters.FilterSet):
	site_name = django_filters.CharFilter(
		field_name='site_name',
		label='Heritage Site Name',
		lookup_expr='icontains'
	)

	# Add description, heritage_site_category, region, sub_region and intermediate_region filters here

	description = django_filters.CharFilter(
		field_name='description',
		label='Description',
		lookup_expr='icontains'
	)

	heritage_site_category = django_filters.CharFilter(
		field_name='heritage_site_category',
		label='Heritage Site Category',
		lookup_expr='icontains'
	)

	region = django_filters.ModelChoiceFilter(
		field_name='country_area__location__region',
		label='Region',
		queryset=Region.objects.all().order_by('region_name'),
		lookup_expr='icontains'
	)

	sub_region = django_filters.ModelChoiceFilter(
		field_name='country_area__location__sub_region',
		label='Sub Region',
		queryset=SubRegion.objects.all().order_by('sub_region_name'),
		lookup_expr='icontains'
	)

	intermediate_region = django_filters.ModelChoiceFilter(
		field_name='country_area__location__intermediate_region',
		label='Intermediate Region',
		queryset=IntermediateRegion.objects.all().order_by('intermediate_region_name'),
		lookup_expr='icontains'
	)

	country_area = django_filters.ModelChoiceFilter(
		field_name='country_area',
		label='Country/Area',
		queryset=CountryArea.objects.all().order_by('country_area_name'),
		lookup_expr='icontains'
	)

	# Add date_inscribed filter here

	date_inscribed = django_filters.CharFilter(
		field_name='date_inscribed',
		label='Description',
		lookup_expr='icontains'
	)


	class Meta:
		model = HeritageSite
		# form = SearchForm
		# fields [] is required, even if empty.
		fields = []