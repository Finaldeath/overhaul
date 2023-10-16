//::///////////////////////////////////////////////
//:: Name cut108_spellcast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Spell Cast At script
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
    ExecuteScript("nw_c2_defaultb", OBJECT_SELF);
}
