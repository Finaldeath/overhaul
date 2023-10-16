// Deekin tells the PC what he wants

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "q6_Deekin_Job", 1);
    SetPLocalInt(GetPCSpeaker(), "Know_Deekin", 1);
}
