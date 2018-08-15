
```
rm *.unparse.json
rm *.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-181998.json.bz2
bunzip2 documents-181998.json.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-191998.json.bz2
bunzip2 documents-191998.json.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-201998.json.bz2
bunzip2 documents-201998.json.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-211998.json.bz2
bunzip2 documents-211998.json.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-221998.json.bz2
bunzip2 documents-221998.json.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-231998.json.bz2
bunzip2 documents-231998.json.bz2

wget http://benchmarks.elasticsearch.org.s3.amazonaws.com/corpora/http_logs/documents-241998.json.bz2
bunzip2 documents-241998.json.bz2


ruby unparse.rb .
```