#!/bin/bash


echo -e "\n----------------------\nWelcome $(whoami) \n ----------------------\n"


create_project () {

      read -p "What is your project name? (only alphabets, dashes and underscores accepted)   " project_name

      root="${project_name}"
      data="${root}/data"


      if [[ ! -d $project_name ]] && [[ $project_name =~ ^[a-zA-Z_-]+$ ]]
	    then

  	    mkdir $root

  	    mkdir $data

  	    mkdir -p $data/raw $data/versions $root/notebooks $root/models $root/metrics $root/deployment $root/logs $root/bash-scripts $root/src $root/reports

      	touch $root/.gitignore $root/README.md $root/requirements.txt $root/.env $root/params.yml "$root/notebooks/${project_name}.ipynb"

      	echo -e  ".env\ndata/\n.bash-scripts/" > $root/.gitignore

      	touch $root/src/__init__.py $root/src/eval.py $root/src/deploy.py $root/src/feature.py $root/src/train.py $root/src/cleaning.py $root/src/split.py $root/src/processor.py

      	echo -e "\n\nProject $project_name created\n\n"

      	exit
       else
        echo -e "\n\nInput a valid project name\n\n"
        create_project

     fi


}

main () {

      select option in "Project name" Exit
      do
        case $option in
          "Project name")
          create_project;;

          Exit)
          exit;;

          *)
          echo -e "\n\n!!! Invalid selection\n\n"
          main

        esac
      done
}

main
