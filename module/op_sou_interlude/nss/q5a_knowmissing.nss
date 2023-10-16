// The PC knows that men from the camp have been sent to the dig site

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "q5a_Know_Missing", 1);
}
