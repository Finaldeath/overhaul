//::///////////////////////////////////////////////
//:: Sell Beggar Fish
//:: act_beg_sellfish
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC gives the beggar some fish
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oFish = GetItemPossessedBy(oPC,"q2c_itm_fish");
    GiveGoldToCreature(oPC,1);

    SetLocalInt(oPC,"os_jointemple_pc",27);
    SetLocalInt(GetModule(), "OS_BEGGAR_FISH",15);
    SetLocalInt(OBJECT_SELF, "OS_BEGGAR_FISH",15);

    if(GetIsObjectValid(oFish))
    {
        DestroyObject(oFish);
    }
}
