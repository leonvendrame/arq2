all:
	cd 1/ ; make 
	cd 2/ ; make
	cd 3/ ; make
	cd 4/ ; make
	cd 5/ ; make
	cd 6/ ; make

clean:
	cd 1/ ; make clean 
	cd 2/ ; make clean 
	cd 3/ ; make clean 
	cd 4/ ; make clean 
	cd 5/ ; make clean 

cleanrelat:
	cd 6/ ; make clean 

cleanresults:
	rm -rf 1/out_files 2/out_files 3/out_files 4/out_files 5/out_files
