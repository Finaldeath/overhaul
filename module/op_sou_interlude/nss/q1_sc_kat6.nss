// Katriana starting conditional: Player found Zidan, but did not rescue him yet.
#include "x1_inc_plot"

int StartingConditional()
{
    int nTalked = GetLocalInt(GetPCSpeaker(), "Q1_TALKED_TO_ZIDAN");
    int nFree = GetLocalInt(GetModule(), "q1_Altar_Destroyed");

    if ((nTalked == 1) && (nFree == 0))
    {
        return TRUE;
    }
    return FALSE;
}
