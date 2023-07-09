#ifndef EZO_PH_H_
#define EZO_PH_H_

#include "low_level.h"

#include <stdbool.h>
#include <inttypes.h>

enum ph_commands_t{
	ph_baud_enum,
	ph_c_enum,
	ph_cal_enum,
	ph_d_enum,
	ph_export_enum,
	ph_factory_enum,
	ph_find_enum,
	ph_i_enum,
	ph_import_enum,
	ph_l_enum,
	ph_m_enum,
	ph_name_enum,
	ph_plock_enum,
	ph_r_enum,
	ph_s_enum,
	ph_sleep_enum,
	ph_status_enum,
	ph_ok_enum
};

typedef struct ezo_ph
{
	float reading;
	uint8_t ack;
} ezo_ph;


bool pH_status (enum ph_commands_t command, char* status);
struct ezo_ph getpH ( void );

#endif
