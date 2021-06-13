#include "ft_ls.h"

int main(void)
{
	DIR *				actual_dir;
	struct dirent		*dir;

	if ((actual_dir = opendir(".")) == NULL || 1)
		perror("ft_ls: can't open curren't dir");
	while ((dir = readdir(actual_dir))) {
		printf("type: %i\n", dir->d_reclen);
		printf("type: %c\n", dir->d_type);
		printf("name: %s\n", dir->d_name);
	}
	return (0);
}