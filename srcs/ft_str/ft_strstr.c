/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strstr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleconte <mleconte@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/06 22:12:52 by mleconte          #+#    #+#             */
/*   Updated: 2015/08/25 18:17:36 by mleconte         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

char	*ft_strstr(const char *s1, const char *s2)
{
	unsigned int i;

	if (!s2 || !*s2)
		return ((char *)s1);
	while (*s1)
	{
		i = 0;
		while (s1[i] == s2[i])
		{
			i++;
			if (!s2[i])
				return ((char *)s1);
		}
		s1++;
	}
	return (NULL);
}
