//::///////////////////////////////////////////////
//:: Give Beggar Fish
//:: act_beg_givefish
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
    int nFish = GetLocalInt(oPC,"os_jointemple_pc");

    if(nFish != 27)
    {
        SetLocalInt(oPC, "os_jointemple_pc", nFish+1);
    }

    SetLocalInt(GetModule(), "OS_BEGGAR_FISH",20);
    SetLocalInt(OBJECT_SELF, "OS_BEGGAR_FISH",20);

    if(GetIsObjectValid(oFish))
    {
        DestroyObject(oFish);
    }
}
