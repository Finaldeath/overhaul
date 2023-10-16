// the PC is not the party leader or a single player

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetFirstPC();
    string sName1 = GetName(GetPCSpeaker());
    string sName2 = GetName(oPC);
    if ((sName1 != sName2) && (CheckIntelligenceLow()))
    {
        object oArea1 = GetArea(GetPCSpeaker());
        object oArea2 = GetArea(oPC);
        if (oArea1 != oArea2)
        {
            return TRUE;
        }
    }
    return FALSE;
}
