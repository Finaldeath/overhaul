//::///////////////////////////////////////////////
//:: Sensei Dharvana, PC has learned Sleeping Man's Love (Condition Script)
//:: H2c_Sens_Love_1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Knower has told the PC
     the Sleeping Man's one true love and the PC
     has not yet told the Sensei about it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    int bThinksSheIs = GetLocalInt(OBJECT_SELF, "bThinksSheIsSleepingMansTrueLove");
    int bThinksSheIsNot = GetLocalInt(OBJECT_SELF, "bThinksSheIsNotSleepingMansTrueLove");
    if (sLove != "" &&
        (bThinksSheIs == TRUE || bThinksSheIsNot == TRUE))
    {
        return TRUE;
    }
    return FALSE;
}
