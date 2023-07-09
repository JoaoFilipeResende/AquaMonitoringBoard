#ifndef EZO_do_H_
#define EZO_do_H_

#include "low_level.h"

#include <stdbool.h>
#include <inttypes.h>

enum do_commands_t{
	do_baud_enum,
	do_c_enum,
	do_cal_enum,
	do_d_enum,
	do_export_enum,
	do_factory_enum,
	do_find_enum,
	do_i_enum,
	do_import_enum,
	do_l_enum,
	do_m_enum,
	do_name_enum,
	do_plock_enum,
	do_r_enum,
	do_s_enum,
	do_sleep_enum,
	do_status_enum,
	do_ok_enum
};

typedef struct ezo_do
{
	float reading;
	uint8_t ack;
} ezo_do;

bool DO_status (enum do_commands_t command, char* status);
struct ezo_do getDO ( void );

#endif
