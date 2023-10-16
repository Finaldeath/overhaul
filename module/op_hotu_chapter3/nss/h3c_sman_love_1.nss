//::///////////////////////////////////////////////
//:: Sleeping Man, PC has learned the identity of his one true love (Condition Script)
//:: H3c_SMan_Love_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     the identity of the Sleeping Man's one true
     love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove != "")
    {
        return TRUE;
    }
    return FALSE;
}
