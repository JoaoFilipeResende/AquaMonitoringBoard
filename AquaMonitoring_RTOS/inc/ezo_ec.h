#ifndef EZO_EC_H_
#define EZO_EC_H_

#include "low_level.h"

#include <stdbool.h>
#include <inttypes.h>

enum ec_commands_t{
	ec_baud_enum,
	ec_c_enum,
	ec_cal_enum,
	ec_d_enum,
	ec_export_enum,
	ec_factory_enum,
	ec_find_enum,
	ec_i_enum,
	ec_import_enum,
	ec_l_enum,
	ec_m_enum,
	ec_name_enum,
	ec_plock_enum,
	ec_r_enum,
	ec_s_enum,
	ec_sleep_enum,
	ec_status_enum,
	ec_ok_enum
};

typedef struct ezo_ec
{
	float reading;
	uint8_t ack;
} ezo_ec;


bool EC_status(enum ec_commands_t command, char* status);
struct ezo_ec getEC ( void );

#endif
