// Starting conditional for Ali: talking to Ali again.
// He has already told his tale

#include "x1_inc_plot"

int StartingConditional()
{
    int nTalk = GetLocalInt(GetPCSpeaker(), "Q2_TALKED_TO_ALI");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q2a_Ali_Story");

    if ((nTalk == 1) && (nPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
