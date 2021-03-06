Data sourced from http://ita.ee.lbl.gov/html/contrib/WorldCup.html

## Create a JSON lines compressed file
```
export DAY=56
cd world-cup-98
rm -rf ita_public_tools
rm ../day${DAY}/wc_day${DAY}.out
tar xfz WorldCup_tools.tar.gz
cd ita_public_tools/
make recreate
find ../day${DAY}/*.gz | xargs gzip -dc  | bin/recreate state/object_mappings.sort >> ../day${DAY}/wc_day${DAY}.out
cd ../
ruby http_logs_to_json.rb day${DAY}
cd day${DAY}
rm wc_day${DAY}.out
ls -la wc_day${DAY}.out.json
cat wc_day${DAY}.out.json | wc -l
bzip2 -z wc_day${DAY}.out.json

```
    
Output example:
```$json
{ "message" : "127.0.0.1 - - [30/Apr/1998:21:30:17 +0000] \"GET /images/hm_bg.jpg HTTP/1.0\" 200 -"}
{ "message" : "127.0.0.1 - - [30/Apr/1998:21:30:53 +0000] \"GET /images/hm_bg.jpg HTTP/1.0\" 200 -"}
{ "message" : "127.0.0.1 - - [30/Apr/1998:21:31:12 +0000] \"GET /images/hm_bg.jpg HTTP/1.0\" 200 -"}
```
## Create a log line compressed file
```
export DAY=56
cd world-cup-98
rm -rf ita_public_tools
rm ../day${DAY}/wc_day${DAY}.out
tar xfz WorldCup_tools.tar.gz
cd ita_public_tools/
make recreate
find ../day${DAY}/*.gz | xargs gzip -dc  | bin/recreate state/object_mappings.sort >> ../day${DAY}/wc_day${DAY}.out
cd ../
ruby http_logs_to_valid_utf8.rb day${DAY}
cd day${DAY}
rm wc_day${DAY}.out
cat wc_day${DAY}.out.txt | wc -l
gzip -9 wc_day${DAY}.out.txt
```

Output example:
```
127.0.0.1 - - [19/Jun/1998:22:00:01 +0000] "GET /english/competition/matchprog8902.htm HTTP/1.0" 200 47408
127.0.0.1 - - [19/Jun/1998:22:00:01 +0000] "GET /english/splash_inet.html HTTP/1.0" 200 47652
127.0.0.1 - - [19/Jun/1998:22:00:01 +0000] "GET /english/history/images/football_on.GIF HTTP/1.0" 200 1767
```


### License

Original license text:

               Copyright (C) 1997, 1998, 1999 Hewlett-Packard Company
                             ALL RIGHTS RESERVED.
     
      The enclosed software and documentation includes copyrighted works
      of Hewlett-Packard Co. For as long as you comply with the following
      limitations, you are hereby authorized to (i) use, reproduce, and
      modify the software and documentation, and to (ii) distribute the
      software and documentation, including modifications, for
      non-commercial purposes only.
          
      1.  The enclosed software and documentation is made available at no
          charge in order to advance the general development of
          the Internet, the World-Wide Web, and Electronic Commerce.
     
      2.  You may not delete any copyright notices contained in the
          software or documentation. All hard copies, and copies in
          source code or object code form, of the software or
          documentation (including modifications) must contain at least
          one of the copyright notices.
     
      3.  The enclosed software and documentation has not been subjected
          to testing and quality control and is not a Hewlett-Packard Co.
          product. At a future time, Hewlett-Packard Co. may or may not
          offer a version of the software and documentation as a product.
      
      4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
          HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
          REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
          DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
          PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
          DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
          EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
          DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
          MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
      
      5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
          DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
          (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
          MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.