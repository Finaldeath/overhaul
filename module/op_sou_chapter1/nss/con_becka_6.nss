//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        If a PC has been thrown into the cage
        with Becka and the PCSpeaker is actually
        in the cage with her at the moment
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 23/03
//:://////////////////////////////////////////////

int GetIsInTrigger(object oTrigger, object oCreature);

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oCage = GetObjectByTag("q1rumgut_range_trigger");

    if (GetLocalInt(OBJECT_SELF, "X1_BECKACAGE") == 10 && GetIsInTrigger(oCage, oPC) == TRUE)
        return TRUE;
    return FALSE;
}

int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}
