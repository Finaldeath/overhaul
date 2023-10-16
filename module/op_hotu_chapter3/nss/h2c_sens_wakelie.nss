//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sensei Beleives Lie, Wakes Sleeping Man (Condition Script)
//:: H2c_Sens_WakeLie.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the the Sensei believes
     herself to be the Sleeping Man's one true
     love but is not.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    int bThinksSheIs = GetLocalInt(OBJECT_SELF, "bThinksSheIsSleepingMansTrueLove");
    if (sLove != "Sensei" &&
        bThinksSheIs == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
