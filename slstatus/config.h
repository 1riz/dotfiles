/* interval between updates (in ms) */
const unsigned int interval = 5000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length */
#define MAXLEN 2048

static const struct arg args[] = {
	/* function        format                   argument */
	{  cpu_perc,       "  \uf4bc  %s%% ",       NULL },
	{  ram_perc,       "  \uefc5  %s%% ",       NULL },
	{  disk_perc,      "  \uf0a0  %s%% ",       "/home" },
	{  temp,           "  \uf2c9 %s\u00B0 ",    NULL },
	{  vol_perc,       "  \uf028  %s%% ",       NULL },
	{  battery_perc,   "  \uf240  %s%% ",       NULL },
	{  datetime,       "  %s  ",                "%a %d %b %H:%M" },
};
