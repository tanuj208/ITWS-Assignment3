#!/bin/bash
cd ~
data=`ls`
echo "<html>
<head>
	<title>q14.html</title>
</head>
<body>
<table border>" > q14.html
homeaddress=`pwd`
echo "<tr>
	<th colspan=3>$homeaddress</th>
</tr>
<tr>
	<th>Name</th>
	<th>Size</th>
	<th>File/Dir</th>
</tr>" >> q14.html
for m in $data
do
	if [ -f "$m" ]
	then
		sizefile=`du -ch ~/$m | grep total | awk {'print $1'}`
		echo "
		<tr>
			<td>$m</td>
			<td>$sizefile</td>
			<td>File</td>
		</tr>
		" >> q14.html
	elif [ -d "$m" ]
	then
		sizedir=`du -sh ~/$m | awk {'print $1'}`
		echo "
		<tr>
			<td>$m</td>
			<td>$sizedir</td>
			<td>Dir</td>
		</tr>
		" >> q14.html
	fi
done
for i in $data
do
	if [ -d "$i" ]
	then
		echo "
		<tr>
			<th colspan=3>$i</th>
		</tr>
		<tr>
			<th>Name</th>
			<th>Size</th>
			<th>File/Dir</th>
		</tr>
		" >> q14.html
		file=`ls ~/$i`
		for j in $file
		do
			if [ -f "$i/$j" ]
			then
				sizefiles=`du -ch ~/$i/$j | grep total | awk {'print $1'}`
				echo "
				<tr>
					<td>$j</td>
					<td>$sizefiles</td>
					<td>File</td>
				</tr>
				" >> q14.html
			elif [ -d "$i/$j" ]
			then
				sizedirs=`du -sh ~/$i/$j | awk {'print $1'}`
				echo "
				<tr>
					<td>$j</td>
					<td>$sizedirs</td>
					<td>Dir</td>
				</tr>
				" >> q14.html
			fi
		done
	fi
	done
echo "
</table>
</body>
</html>
" >> q14.html
firefox q14.html
