//::///////////////////////////////////////////////
//:: Looting skeleton bones - disturbed event
//:: q2_bones_dis
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a pc removed an item from the bones, doing the following:
    1. create a skeleton
    2. move remaining items to skeletons
    3. destroy bones.
    4. minor evil hit.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////


void main()
{
    //TODO: when an item is TAKEN: destroy bones and create one skeleton to attack PC
    //      and have the pc take a minor evil hit.

    if(GetInventoryDisturbType() != INVENTORY_DISTURB_TYPE_REMOVED)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int nType = Random(4) + 1;
    string sSkel;
    switch (nType)
    {
        case 1: sSkel = "skeleton001"; break;
        case 2: sSkel = "skeleton002"; break;
        case 3: sSkel = "skeleton004"; break;
        case 4: sSkel = "skeleton005"; break;
        default: sSkel = "skeleton001"; break;

    }

    object oSkel = CreateObject(OBJECT_TYPE_CREATURE, sSkel, GetLocation(OBJECT_SELF));
    //effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    //DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oSkel));
    //AssignCommand(oSkel, ActionAttack(GetLastUsedBy()));

    // placing all remaining items on skeleton
    object oItem = GetFirstItemInInventory();
    while (oItem != OBJECT_INVALID)
    {
        ActionGiveItem(oItem, oSkel);
        oItem = GetNextItemInInventory();
    }
    DelayCommand(0.3, DestroyObject(OBJECT_SELF));

    if(GetAlignmentGoodEvil(GetLastUsedBy()) != ALIGNMENT_EVIL)
    {
        FloatingTextStrRefOnCreature(40408, GetLastUsedBy());
        AdjustAlignment(GetLastUsedBy(), ALIGNMENT_EVIL, 1);
    }
}
