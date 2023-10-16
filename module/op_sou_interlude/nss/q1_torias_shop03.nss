// the PC now knows about Torias's shop

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "q1_Know_Torias_Store", 1);
}
