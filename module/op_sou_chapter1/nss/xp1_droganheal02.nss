// the PC has been told about the Drogan Herb quest

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "Drogan_Herbs", 1);
}
