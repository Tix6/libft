/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_str_is.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mleconte <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/09/15 21:00:27 by mleconte          #+#    #+#             */
/*   Updated: 2015/09/15 21:10:28 by mleconte         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_str_is(int (*f)(int), char const *str)
{
	if (str && *str)
	{
		while (*str)
		{
			if (!f(*str))
				return (0);
			str++;
		}
		return (1);
	}
	else
		return (0);
}
