//::///////////////////////////////////////////////
//:: Scrivener, Wrong 2nd/3rd Nav Point (Condition Script)
//:: H2c_Scrv_NavBadX.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Scrivener is looking for
     a Nav Point other than the first ("Treason")
     and has been led to the wrong one.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    /*int bAtStone = GetLocalInt(OBJECT_SELF, "bAtStone");
    string sNavPoint = GetLocalString(OBJECT_SELF, "sNavPoint");
    string sStoneBoolean = "b"+sNavPoint+"Stone";
    int bCorrectStone = GetLocalInt(OBJECT_SELF, sStoneBoolean);

    if (bAtStone == TRUE &&
        sNavPoint != "Treason" &&
        bCorrectStone == FALSE)
    {
        return TRUE;
    }*/
    return FALSE;
}
