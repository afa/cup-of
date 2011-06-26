jQuery(document).ready(function() {
 jQuery('li.mordoitem').each(function(i){
  if (this.style.display != "inline-block"){
   this.style.display = "inline-block";
  }
 });
});

