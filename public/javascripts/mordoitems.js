jQuery(document).ready(function() {
 jQuery('li.mordoitem').each(function(i){
  if (this.style.display != "inline-block"){
   this.style.display = "inline-block";
  }
 });
 jQuery('div.mordoitems').jcarousel({
  size:#{m_items.size}, scroll:1,auto:5, itemFallbackDimension:96
 });
});

