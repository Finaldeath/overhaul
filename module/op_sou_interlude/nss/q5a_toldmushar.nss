// the PC has been told about Musharak

#include "NW_I0_PLOT"

void main()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "q5a_Musharak_Status");
    if (nKnow == 0)
    {
        SetPLocalInt(GetPCSpeaker(), "q5a_Musharak_Status", 1);
    }
}
