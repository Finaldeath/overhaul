//::///////////////////////////////////////////////
//:: Quarry Grinder, Not Grinder 5 (Condition Script)
//:: H2c_Grind_Not5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this is not Quarry Grinder 5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //First check to see if the quest has even been given out.
    int bQuest = GetLocalInt(GetModule(), "bGruulQuestGiven");
    string sTag = GetTag(OBJECT_SELF);
    if (bQuest == FALSE)
    {
        return TRUE;
    }
    //If it has, only return true if you're not Grinder #5
    else if (sTag != "QuarryGrinder5")
    {
        return TRUE;
    }
    return FALSE;
}
