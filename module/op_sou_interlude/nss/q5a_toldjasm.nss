// the PC has been told about Jasmeena

#include "NW_I0_PLOT"

void main()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status");
    if (nKnow == 0)
    {
        SetPLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status", 1);
    }
}
