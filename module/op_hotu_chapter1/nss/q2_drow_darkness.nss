//::///////////////////////////////////////////////
//:: Name q2_drow_darkness
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The nearest drow will cast darkness on the pc.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Aug 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    int bFound = FALSE;
    int nCount = 1;
    object oDrow = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, nCount);
    while (oDrow != OBJECT_INVALID && bFound == FALSE)
    {
        if (GetStringLeft(GetTag(oDrow), 9) == "x2_q2drow")
        {
            bFound = TRUE;
            if (GetDistanceBetween(oDrow, oPC) < 25.0)
            {
                AssignCommand(oDrow, ClearAllActions(TRUE));
                AssignCommand(oDrow, ActionCastSpellAtObject(SPELL_DARKNESS, oPC, METAMAGIC_ANY, TRUE));
            }
        }
        nCount++;
        oDrow = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, nCount);

    }
}
