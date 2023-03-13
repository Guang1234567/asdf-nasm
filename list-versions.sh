BUILDS_URL=https://www.nasm.us/pub/nasm/releasebuilds/

request_builds_page(){
  curl -s $BUILDS_URL
}

get_versions_href(){
   grep -Po '(href=").+?(?=/)' 
}

remove_href_prefix(){
  sed -r 's/href="//'
}

unlist_headers_hrefs(){
  tail -n +7
}

list(){
  request_builds_page | get_versions_href | remove_href_prefix | unlist_headers_hrefs
}
