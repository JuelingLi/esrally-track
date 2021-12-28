echo '{% import "rally.helpers" as rally %}' > generated.json
echo '{% set start_time, end_time = 1420070400,1426780800 %}' >> generated.json
# name="desc_sort_range_with_dense_query_1"
# cat template.json  >> generated.json
# for i in `seq 2 8`
# do 
# echo "," >> generated.json
# sed "s/${name}/desc_sort_range_with_dense_query_${i}/g"  template.json  >> generated.json
# done

name="asc_sort_range_with_dense_query_1"
cat template_asc_sort_range_with_dense_query.json  >> generated.json
for i in `seq 2 800`
do 
echo "," >> generated.json
sed "s/${name}/asc_sort_range_with_dense_query_${i}/g"  template_asc_sort_range_with_dense_query.json  >> generated.json
done