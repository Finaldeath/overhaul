//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Check that PC is in cage with Becka.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:March 14, 2003
//:://////////////////////////////////////////////

int GetIsInTrigger(object oTrigger, object oCreature);
int StartingConditional()
{
            object oCage = GetObjectByTag("q1rumgut_range_trigger");
            object oPC = GetPCSpeaker();
            if (GetIsInTrigger(oCage, oPC) == TRUE)
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
