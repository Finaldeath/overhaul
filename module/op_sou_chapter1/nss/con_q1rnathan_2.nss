//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     PC knows of Nathan's troubles.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 27, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_NATHANSPEAK") < 30 && GetLocalInt(OBJECT_SELF, "nRumgutGiveUp") != 1
        &&GetLocalInt(GetModule(), "X1_Q1RuralRebFree")!= 70 &&GetLocalInt(oPC, "X1_NATHANSPEAK") != 0)
        return TRUE;
    return FALSE;
}
