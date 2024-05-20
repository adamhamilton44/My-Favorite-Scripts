#!/usr/bin/awk -f

BEGIN {
FS=":";
printf ("\n\n%s\n", "/etc/passwd accounts with login shells");
printf ("%s\n", "------------------------------------------");
}
{
	if ( $7 ~ /sh/ ) {
		printf ("%10s uses the shell %s\n", $1, $7);
	}
}
