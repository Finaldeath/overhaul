//::///////////////////////////////////////////////
//:: Name: q2a_door_align
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When this door is openned - adjust the openners
    Alignment towards Chaos (away from Law).
    Break and Enter...tsk..tsk...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 23/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
    object oPC = GetLastOpenedBy();
    AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
}
