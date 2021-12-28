query_name=$1
index_name=$2
request_num=$3
sh generate.sh $query_name $index_name $request_num

tag="$query_name-$index_name-$request_num"
esrally race --track-repository=private --track=private_nyc_taxis --target-hosts=127.0.0.1:9200 --pipeline=benchmark-only --challenge="parallel" --user-tag="nyc_text:$tag" --report-file=$tag
