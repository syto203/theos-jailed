
__currentOS=$(echo $OSTYPE);  
__CFid=$1
__newID=$2;
__file=$3;

if [[ "${__currentOS}" == "darwin"*  ]]; then
   __currentOS=$(sw_vers | awk '/ProductName:/ {print$2}');
fi   

__convertToXML(){
  plutil --format xml --infile "$__file" --outfile "$__file";
}   

__convertToPlist(){
  plutil --format bin --infile "$__file" --outfile "$__file";
}  

__changeBundleID(){
  if [[ $__currentOS == "Mac" ]]; then
    /usr/libexec/PlistBuddy -c "Add :"${__CFid}" string" "$__file"
    /usr/libexec/PlistBuddy -c "Set :"$__CFid" $__newID" "$__file"
    # plutil -replace $__CFid -string "$__newID" "$__file"
  elif [[ $__currentOS == "iPhone" ]]; then
    plutil -key $__CFid -value "$__newID" "$__file"
  elif [[ $__currentOS == "linux"* ]]; then 
#	local old=$(awk "/$__CFid/ {getline;print$1}" "$__file" | sed -n '/^$/!{s/<[^>]*>//g;p;}');
	local old=$(sed -n "/$__CFid/{n;p;}" "$__file" | sed -n '/^$/!{s/<[^>]*>//g;p;}');
	local temp=$(echo $old);
	local new="${__newID}";
	local temp2=$(echo $new);
	sed -i -e  "/$__CFid/,/string/ s/${temp}/${temp2}/" "$__file"
  else
    local old=$(awk "/$__CFid/ {getline;print$1}" "$__file" | sed -n '/^$/!{s/<[^>]*>//g;p;}');
    local new=$__newID
    sed -i -e "/$__CFid/,/string/ s/$old/$new/" "$__file"
fi
}

if [[ $__currentOS == "Mac" ]] || [[ $__currentOS == "iPhone" ]] ; then
  __changeBundleID;
elif [[ $__currentOS == "linux"* ]]; then 
  __convertToXML;
  __changeBundleID;
  __convertToPlist;
else
  __changeBundleID;
fi
#
exit
