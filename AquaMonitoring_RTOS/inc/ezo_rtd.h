#ifndef EZO_RTD_H_
#define EZO_RTD_H_

#include "low_level.h"

#include <stdbool.h>
#include <inttypes.h>

enum rtd_commands_t{
	rtd_baud_enum,
	rtd_c_enum,
	rtd_cal_enum,
	rtd_d_enum,
	rtd_export_enum,
	rtd_factory_enum,
	rtd_find_enum,
	rtd_i_enum,
	rtd_import_enum,
	rtd_l_enum,
	rtd_m_enum,
	rtd_name_enum,
	rtd_plock_enum,
	rtd_r_enum,
	rtd_s_enum,
	rtd_sleep_enum,
	rtd_status_enum,
	rtd_ok_enum
};

typedef struct ezo_rtd
{
	float reading;
	uint8_t ack;
} ezo_rtd;


bool RTD_status (enum rtd_commands_t command, char* answer);
struct ezo_rtd getRTD ( void );

#endif
