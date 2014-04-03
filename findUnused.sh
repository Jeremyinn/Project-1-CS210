#!/bin/bash
fileList=$(find . | grep -E ".+(txt|json|xml|html)")
imageFileList=$(find . | grep -E ".+(jpg|png|gif|jpeg)" | sed -r 's/^.{2}//' | sed -e 's/^/"/' | sed 's/$/"/')
#### Need to make file list pull out strings from within instead of referencing files.####
variable=0
array=()
recursivefilelist=()
for directoryfile in ${fileList[@]};
do
    recursivefilelist+=$(grep -e path $directoryfile | sed 's/,//')
done
#for list in ${recursivefilelist[@]}
#do
#    echo $list
#done
#echo ====
#for imagefile in ${imageFileList[@]};
#do
#    
#    echo $imagefile
#done
for imagefile in ${imageFileList[@]};
do
    for file in ${recursivefilelist[@]};
    do
	if [ "$imagefile" = "$file" ];
 	then
 	    variable=1;
	    break
 	fi
	
    done
    
    if [ $variable = 0 ]
    then
 	array+=($imagefile) 
    fi
    variable=0
done
echo ${array[@]}
