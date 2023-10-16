// the PC has spoken to Jasmeena

#include "NW_I0_PLOT"

void main()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status");
    if (nKnow < 2)
    {
        SetPLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status", 2);
    }
}

