//::///////////////////////////////////////////////
//:: q2_elderbrain1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Player granted permission to see Elder Brain
   Not yet agreed to get the mirror
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(GetModule(),"elder_brain") >= 1 && GetLocalInt(oPC, "X2_Q2DMindShielded") == 1)
        return TRUE;

    return FALSE;

}
