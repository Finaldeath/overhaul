//::///////////////////////////////////////////////
//:: Scrivener, Correct Nav Point (Condition Script)
//:: H2c_Scrv_NavGood.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener has been led
     to the correct Nav Point (fired by trigger).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAtStone = GetLocalInt(OBJECT_SELF, "bAtStone");
    string sNavPoint = GetLocalString(OBJECT_SELF, "sNavPoint");
    string sStoneBoolean = "b"+sNavPoint+"Stone";
    int bCorrectStone = GetLocalInt(OBJECT_SELF, sStoneBoolean);

    if (bAtStone == TRUE &&
        bCorrectStone != TRUE)
    {
        if(GetMaster() != OBJECT_INVALID)
        {
            return TRUE;
        }
    }
    return FALSE;
}
