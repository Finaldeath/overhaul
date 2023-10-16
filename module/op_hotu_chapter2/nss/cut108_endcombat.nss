//::///////////////////////////////////////////////
//:: Name cut108_endcombat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default Combat Round End script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nRetreat") == 1)
    {
        ClearAllActions(TRUE);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        ActionMoveAwayFromObject(oPC, TRUE);
        return;
    }
    ExecuteScript("nw_c2_default3", OBJECT_SELF);
}
