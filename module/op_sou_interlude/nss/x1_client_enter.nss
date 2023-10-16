// Remove un-needed items from player.

/*void RemoveItem(object oPC, string sItem)
{
    object oItem = GetItemPossessedBy(oPC, sItem);
    while(oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetItemPossessedBy(oPC, sItem);
    }
} */

#include "x1_inc_plot"

void FakeRestore(object oTarget);

void Restore(object oPC)
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oPC);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC);

    FakeRestore(oPC);
    if(GetIsObjectValid(oHenchman))
    {
        FakeRestore(oHenchman);
    }
    if(GetIsObjectValid(oAnimal))
    {
        FakeRestore(oAnimal);
    }
    if(GetIsObjectValid(oFamiliar))
    {
        FakeRestore(oFamiliar);
    }
    if(GetIsObjectValid(oDominated))
    {
        FakeRestore(oDominated);
    }
    if(GetIsObjectValid(oSummoned))
    {
        FakeRestore(oSummoned);
    }
}

int IsInvalidItem(object oItem)
{
    string sTag = GetTag(oItem);
    return (sTag == "x1_ice_phylac" ||
           sTag == "xp1_mystrashand" ||
           sTag == "q3_bearhorn" ||
           sTag == "Q3_ANCIENT_BOOK" ||
           sTag == "Q3A_KEY_JAIL" ||
           sTag == "Q3_CAGE_KEY" ||
           sTag == "focuscrystal" ||
           sTag == "mummifiedhand" ||
           sTag == "q5_Tymo_Amulet" ||
           sTag == "q7_banditbook" ||
           sTag == "q5_Deekin_Shoe" ||
           sTag == "Q5A_KEY_KOBOLD_PRISON" ||
           sTag == "q5_Tymo_Head"
           );
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(oPC, "DO_PLAYER_INIT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(oPC, "DO_PLAYER_INIT_ONCE", 1);

    SetPlot("idcrystal", 1, oPC);

    // restore henchman story vars
    SetLocalInt(oPC, "XP1_Deekin_Story", GetCampaignInt("dbPlayers", "DeekinStory", oPC));
    SetLocalInt(oPC, "XP1_Dorna_Story", GetCampaignInt("dbPlayers", "DornaStory", oPC));
    SetLocalInt(oPC, "XP1_Xanos_Story", GetCampaignInt("dbPlayers", "XanosStory", oPC));

    // destroy plot items:
    object oItem = GetFirstItemInInventory(oPC);
    string sTag;
    while(oItem != OBJECT_INVALID)
    {
        sTag = GetTag(oItem);
        if(sTag == "x1towercrystal")
        {
           SetLocalInt(GetModule(), "X1_ONE_PLAYER_GOT_CRYSTAL", 1);
           SetDroppableFlag(oItem, FALSE);
        }
        if(IsInvalidItem(oItem))
            DestroyObject(oItem);

        oItem = GetNextItemInInventory(oPC);
    }

    if(GetLocalInt(GetModule(), "X1_ONE_PLAYER_GOT_CRYSTAL") == 0)
    {
        object oCrystal = CreateItemOnObject("x1towercrystal", oPC);
        SetLocalInt(GetModule(), "X1_ONE_PLAYER_GOT_CRYSTAL", 1);
        SetDroppableFlag(oCrystal, FALSE);
    }
    oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);
    if(IsInvalidItem(oItem)) DestroyObject(oItem);

    Restore(oPC);

    /*RemoveItem(oPC, "x1_ice_phylac");
    RemoveItem(oPC, "xp1_mystrashand");
    RemoveItem(oPC, "q5_Tymo_Amulet");
    RemoveItem(oPC, "q3_bearhorn");
    RemoveItem(oPC, "Q3_ANCIENT_BOOK");
    RemoveItem(oPC, "Q3A_KEY_JAIL");
    RemoveItem(oPC, "Q3_CAGE_KEY");
    RemoveItem(oPC, "focuscrystal");*/
}

void FakeRestore(object oTarget)
{

    effect eBad = GetFirstEffect(oTarget);
    //Search for negative effects
    while(GetIsEffectValid(eBad))
    {
       /* if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
            GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
            GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
            GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
            GetEffectType(eBad) == EFFECT_TYPE_POISON ||
            GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)*/
        if(GetIsEffectValid(eBad)) // remove anyeffect
        {
            //Remove effect if it is negative.
            RemoveEffect(oTarget, eBad);
        }
        eBad = GetNextEffect(oTarget);
    }
    if(GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
    {
        //Apply the VFX impact and effects
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        effect eHeal = EffectHeal(nHeal);
        if (nHeal > 0)
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
    }
}
