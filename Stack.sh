#!/bin/bash 

stackSize=$1
otherParameter=$2

function errorHandling {

	getLength=${#otherParameter}

	if [ $getLength -gt 0 ]; then
		echo "invalid Input"
		exit
	fi

	if [[ ! $stackSize =~ ^[0-9]+$  ]]; then
	    echo "Invalid Input"
	    exit
	fi

}

function push {

	if [ $topIndex -eq $(( $stackSize - 1 )) ]; then
		echo "OverFlow"
	else 
		read -p "Enter the value: "  getElement
		topIndex=$(( $topIndex + 1 ))
		stack[topIndex]=$getElement
	fi

}

function pop {

	if [ $topIndex -eq -1 ]; then
		echo "underFlow"
	else 
		topIndex=$(( $topIndex - 1 ))	
	fi

}

function show {

	for (( iterator=$topIndex; iterator>=0; iterator-- ))
	do
		echo "${stack[$iterator]}"
	done
	
	if [ $topIndex -eq -1 ]; then 
		echo "stack is empty"
	fi

}

function stackImplement {

	topIndex=-1

	echo "1.Insertion"
	echo "2.Deletion"
	echo "3.Display"
	echo "4.Exit "

	while [ 1 ] 
	do 
	    read -p " Enter your operation " option

	    case $option in 
		    1) push ;;
			2) pop ;;
		    3) show ;;
		    4) exit ;;
			*) echo "INVALID CHOICE!" ;;
	    esac	   
	done

}

errorHandling
stackImplement