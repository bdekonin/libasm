/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: bdekonin <bdekonin@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/04/14 10:14:10 by bdekonin      #+#    #+#                 */
/*   Updated: 2020/11/09 19:30:19 by bdekonin      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

#define TEMPSTRING "jashdjkas"

size_t		ft_strlen(const char *s);
char		*ft_strcpy(char * dst, const char * src);
int			ft_strcmp(const char *s1, const char *s2);
ssize_t 	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t 	ft_read(int fildes, void *buf, size_t nbyte);
char		*ft_strdup(const char *s1);

int			main(void)
{
	char *str;

	ft_write(1, "this is a super basic test\n", 28);
	str = ft_strdup(TEMPSTRING);
	if (!str)
		return (-1);
	ft_write(1, "strcpy now\n", 12);
	if (ft_strcmp(str, TEMPSTRING) == strcmp(str, TEMPSTRING))
		ft_write(1, "strcmp works again\n", 13);
	else
		ft_write(1, "strcmp doesnt work\n", 19);
	str = ft_strcpy(str, "k");
	if (ft_strlen(TEMPSTRING) == strlen(TEMPSTRING))
		ft_write(1, "strlen works\n", 13);
	else
		ft_write(1, "strlen doesnt work\n", 19);
	free(str);
	str = malloc(100 * sizeof(char));
	if (!str)
		return (-1);
	ft_read(0, str, 100);
	ft_write(1, str, ft_strlen(str));
	free(str);
	return (0);
}
