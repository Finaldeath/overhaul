//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sensei is Sleeping Man's Love 2 (Condition Script)
//:: H2c_Sens_Love_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sensei is the Sleeping
     Man's one true love but she doesn't know
     that yet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bBelief = GetLocalInt(OBJECT_SELF, "bThinksSheIsSleepingMansTrueLove");
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (bBelief == FALSE &&
        sLove == "Sensei")
    {
        return TRUE;
    }
    return FALSE;
}
