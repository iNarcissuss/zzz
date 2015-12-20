#!/usr/bin/env bash
# set -x
pthOrg=`pwd`

arrIgnore=(
	barf-project
	klee
	netifera
	)

function githubCommit(){ git ls-remote $1 | grep -P 'HEAD$' | cut -f 1; }

cp ./mVer.tsv /tmp/mVer.tsv
cat /tmp/mVer.tsv | while read i; do
	read prj cCommit url typ rst <<< "$i"
	[[ " ${arrIgnore[*]} " == *" $prj "* ]] && continue;	# ignore
	
	[[ $typ = 'git' ]] && lCommit=`githubCommit $url`
	[[ $typ = 'dyn' ]] && { chmod 777 ./build/$prj/mk.sh; lCommit=`./build/$prj/mk.sh ver`; }
	
	[[ -n $lCommit ]] && {
		[[ "$cCommit" != "$lCommit" ]] && {
			echo "______________________________________________[ $prj ]"
			# ...
			sed -i "/$prj\s/d" ./mVer.tsv
			echo -e "$prj\t$lCommit\t$url\t$typ" >> ./mVer.tsv; sort -o ./mVer.tsv ./mVer.tsv

			[[ $typ = 'git' ]] && git clone $url /tmp/$prj
			[[ $typ = 'dyn' ]] && mkdir /tmp/$prj
			
			touch /tmp/mmm
			cp -a ./build/$prj/mk.sh /tmp/$prj
			rm -rf ./build/$prj/*
			
			cd /tmp/$prj
			chmod 777 ./mk.sh; bash -x ./mk.sh
			find ./* -type f -newer /tmp/mmm | xargs -I xxx cp -a --parents xxx $pthOrg/build/$prj
			cp -a /tmp/$prj/mk.sh $pthOrg/build/$prj/

			cd $pthOrg
			git add --all $pthOrg/build/$prj/*
			git add --all $pthOrg/mVer.tsv
			git commit -m ${prj}"_`date '+%Y-%m-%d-%H:%M'`"
			git push origin
		}
	}
done
sed -i 's/\r$//' ./mVer.tsv
# __________________________________________________________________________
# homePath=`pwd`
# chmod 777 ./mk.sh
# sSed="sed 's|^[- ]||gi'" 
# # git submodule | eval $sSed | cut -d ' ' -f1,2 | sort > /tmp/cVer.txt
# git submodule | eval $sSed | awk '{ print $2" "$1}' | sort > /tmp/cVer.txt

# arrIgnore=(
# 	barf-project
# 	klee
# 	)
# sed -i 's/\r$//' ./mVer.tsv
# sed -i 's/\r$//' /tmp/cVer.txt
# for prj in $(comm ./mVer.tsv /tmp/cVer.txt -31 | cut -d ' ' -f1); do
# 	[[ " ${arrIgnore[*]} " == *" $prj "* ]] && continue;
# 	echo "___________________________________________["$prj"]"
# 	./mk.sh $prj
# 	sed -i "/$prj/d" ./mVer.tsv
# 	git submodule status $prj | eval $sSed | awk '{print $2" "$1}' >> ./mVer.tsv
# 	sort -o ./mVer.tsv ./mVer.tsv
	
# 	git add --all
# 	git commit -m "ver_${prj}_`date '+%Y-%m-%d-%H:%M'`"
# 	git push origin
# done
# prj="afl-fuzz"
# ver_afl_fuzz=`date -d "$(curl --head  http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz | grep 'Last' | cut -d':' -f2-)" "+%Y%m%d"`
# mVer_afl_fuzz=`cat ./mVer.tsv | grep "${prj}" | awk '{print $2}'`

# [[ $ver_afl_fuzz != $mVer_afl_fuzz ]] && cd ./build/$prj; chmod 777 ./mk.sh && ./mk.sh && cd $homePath && echo "$prj $ver_afl_fuzz" >> ./mVer.tsv
# sort -u -o ./mVer.tsv ./mVer.tsv

# git add --all
# git commit -m "ver_${prj}_`date '+%Y-%m-%d-%H:%M'`"
# git push origin
