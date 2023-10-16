//::///////////////////////////////////////////////
//:: Name q1b_death_chaos
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give small chaotic hit to whoever destroys
    this locked door...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastKiller();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nChaosHit") != 1)
    {
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
        SetLocalInt(OBJECT_SELF, "nChaosHit", 1);
        object oGuard1 = GetObjectByTag("q1bguard1");
        object oGuard2 = GetObjectByTag("q1bguard2");
        if (GetObjectSeen(oPC, oGuard1) == TRUE || GetObjectSeen(oPC, oGuard2) == TRUE)
        {
            AssignCommand(oGuard1, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard1, SpeakStringByStrRef(40361, TALKVOLUME_SHOUT));
            AssignCommand(oGuard2, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard2, SpeakStringByStrRef(40361, TALKVOLUME_SHOUT));

            if (GetLocalInt(OBJECT_SELF, "nAdded") != 1)
                SetLocalInt(oPC, "X1_nAttackedDoor", GetLocalInt(oPC, "X1_nAttackedDoor") + 1);
        }
    }
}
