//::///////////////////////////////////////////////
//:: goblin gives crystal
//:: act_gob_givegem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The goblin gives the psionic gem to the PC and runs away
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: January 2005
//::----------------------------------------------
//:: Fixed an Infinite XP loop.
//:://////////////////////////////////////////////

void main()
{
//give crystal, 100 xp, and goblin runs away
    object oPC = GetFirstPC();
    object oGem = GetItemPossessedBy(OBJECT_SELF,"q3_poisoncrystal");
    object oWay = GetNearestObjectByTag("q3_map_exit");
    int iDoOnce = GetLocalInt(OBJECT_SELF, "act_gob_givegem");

    if (iDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "act_gob_givegem", TRUE);
        ActionGiveItem(oGem, oPC);
        GiveXPToCreature(oPC, 100);
    }

    ActionMoveToObject(oWay,TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
