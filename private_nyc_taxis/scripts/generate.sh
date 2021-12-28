query_name=$1
index_name=$2
request_num=$3

query_template_name="../template/$query_name.json"
generated_query_name="../operations/generated.json"
generated_challenge_name="../challenges/parallel.json"

# generate time range in 2015-01-01 00:00:00 to 2015-01-01 23:59:59 as the random time for query start time
echo '{% import "rally.helpers" as rally %}' > $generated_query_name
echo '{% set start_time, end_time = 1420070400,1420156799 %}' >> $generated_query_name 

sed "s/${query_name}/`echo $query_name`_1/g"  $query_template_name >> $generated_query_name
for i in `seq 2 $request_num`
do 
echo "," >> $generated_query_name
sed "s/${query_name}/`echo $query_name`_${i}/g"  $query_template_name >> $generated_query_name
done

gsed -i  "s/INDEX-NAME/$index_name/g" $generated_query_name

sed "s/TOTAL_NUM/$request_num/g"  template_parallel.json  > $generated_challenge_name
gsed -i "s/QUERY_NAME/$query_name/g" $generated_challenge_name
