
__currentOS=$(echo $OSTYPE); 
__readID=$1;
__file=$2;
__result="";

if [[ "${__currentOS}" == "darwin"*  ]]; then
   __currentOS=$(sw_vers | awk '/ProductName:/ {print$2}');
fi

__convertToXML(){
  plutil --format xml --infile "$__file" --outfile "$__file";
}

__convertToPlist(){
  plutil --format bin --infile "$__file" --outfile "$__file";
}

__readFromPlist(){
  if [[ $__currentOS == "Mac" ]]; then
      local data=$(/usr/libexec/PlistBuddy -c "Print :$__readID" "$__file")
      __result="$data"
  elif [[ $__currentOS == "iPhone" ]]; then
      local data=$(plutil -key "$__readID" "$__file");
      __result="$data"
  else
      local data=`awk "/$__readID/ {getline;print$1}" "$__file" | sed  -E "s/[[:space:]]+//" | sed -n '/^$/!{s/<[^>]*>//g;p;}'`;
      __result="$data";
  fi
}

if [[ $__currentOS == "Mac" ]] || [[ $__currentOS == "iPhone" ]]
  then
    __readFromPlist;
elif [[ $__currentOS == "linux"* ]]; then
  __convertToXML;
  __readFromPlist;
  __convertToPlist;
else
  __readFromPlist;
fi


# result=$(__readFromPlist)
echo "$__result";
