// tunnels on-enter: apply dead-magic zone if active

#include "x2_inc_itemprop"

void DebugString(string sStr)
{
    //PrintString(sStr);
}

object GetChest(object oCreature)
{
    object oChest = GetObjectByTag("q5c_chest" + ObjectToString(oCreature));
    if(oChest == OBJECT_INVALID)
    {
        object oWP = GetWaypointByTag("q5c_wp_chest_sp");
        oChest = CreateObject(OBJECT_TYPE_PLACEABLE, "q5c_keep_chest", GetLocation(oWP), FALSE,
                    "q5c_chest" + ObjectToString(oCreature));
    }
    return oChest;
}

int GetIsAlcohol(object oItem)
{
    itemproperty ip;
    ip = GetFirstItemProperty(oItem);
    // if there is more than 1 property then this item should be stripped
    if(GetIsItemPropertyValid(GetNextItemProperty(oItem)))
        return FALSE;
    if(GetItemPropertyType(ip) == ITEM_PROPERTY_CAST_SPELL)
    {
        if(GetItemPropertySubType(ip) == IP_CONST_CASTSPELL_SPECIAL_ALCOHOL_BEER ||
           GetItemPropertySubType(ip) == IP_CONST_CASTSPELL_SPECIAL_ALCOHOL_SPIRITS ||
           GetItemPropertySubType(ip) == IP_CONST_CASTSPELL_SPECIAL_ALCOHOL_WINE)
            return TRUE;
    }
    return FALSE;
}

int GetIsPoisonAmmo(object oItem)
{
    itemproperty ip;
    ip = GetFirstItemProperty(oItem);
    // if there is more than 1 property then this item should be stripped
    if(GetIsItemPropertyValid(GetNextItemProperty(oItem)))
        return FALSE;

    if(IPGetItemHasItemOnHitPropertySubType(oItem, IP_CONST_ONHIT_ITEMPOISON))
        return TRUE; // single poison property
    return FALSE;
}

int GetIsDyeKit(object oItem)
{
    if(GetBaseItemType(oItem) == BASE_ITEM_MISCSMALL)
    {
        itemproperty ip = GetFirstItemProperty(oItem);
        if(GetItemPropertyType(ip) == ITEM_PROPERTY_CAST_SPELL)
        {
            int nSubType = GetItemPropertySubType(ip);
            return (nSubType >= 490 && nSubType <= 497);
        }
        return FALSE;
    }
    return FALSE;
}

void RemoveAllProperties(object oItem, object oPC)
{
    DebugString("BOOM DEADM: TRYING to Remove props from item= <" + GetName(oItem) + "> tag= <" + GetTag(oItem) + ">");

    int nType = GetBaseItemType(oItem);
    if(nType == BASE_ITEM_TORCH ||
       nType == BASE_ITEM_TRAPKIT ||
       nType == BASE_ITEM_HEALERSKIT ||
       nType == BASE_ITEM_GRENADE ||
       nType == BASE_ITEM_THIEVESTOOLS ||
       nType == 109 || // crafting stuff
       nType == 110 ||
       nType == 112)
        return;

    if(GetIsAlcohol(oItem) || GetIsPoisonAmmo(oItem) || GetIsDyeKit(oItem))
        return;
    if(oItem == OBJECT_INVALID)
        return;

    object oWP = GetWaypointByTag("q5c_wp_chest_sp");

    // generating key (global value on area)
    int nKey = GetLocalInt(OBJECT_SELF, "ITEM_KEY");
    nKey++;
    SetLocalInt(OBJECT_SELF, "ITEM_KEY", nKey);
    string sKey = IntToString(nKey);
    DebugString("BOOM DEADM: REMOVING props from item= <" + GetName(oItem) + "> with key value= <" + sKey + "> of creature= " + GetName(oPC));

    //object oChest = GetChest(oPC);
    //object oCopy = CopyObject(oItem, GetLocation(oChest), oChest);

    // copying  original item to a secluded waypoint in the area
    // and giving it a tag that contains the key string
    object oCopy = CopyObject(oItem, GetLocation(oWP), OBJECT_INVALID, "q5c_item" + sKey);

    //storing the key value on the original item (key value would point to the copy item)
    SetLocalString(oItem, "ITEM_KEY", sKey);

    //SetLocalObject(oItem, "ITEM_CHEST", oChest); // so the chest can be found
    //SetLocalObject(oChest, sKey, oCopy); // and referenced in the chest

    // Stripping original item from all properties
    itemproperty ip = GetFirstItemProperty(oItem);
    while(GetIsItemPropertyValid(ip))
    {
        RemoveItemProperty(oItem, ip);
        ip = GetNextItemProperty(oItem);
    }
}

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        int nType = GetEffectType(eEff);
        if(GetEffectSubType(eEff) != SUBTYPE_EXTRAORDINARY &&
           (nType == EFFECT_TYPE_ABILITY_INCREASE ||
           nType == EFFECT_TYPE_AC_INCREASE ||
           nType == EFFECT_TYPE_ATTACK_INCREASE ||
           nType == EFFECT_TYPE_BLINDNESS ||
           nType == EFFECT_TYPE_CHARMED ||
           nType == EFFECT_TYPE_CONCEALMENT ||
           nType == EFFECT_TYPE_CONFUSED ||
           nType == EFFECT_TYPE_CURSE ||
           nType == EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE ||
           nType == EFFECT_TYPE_DAMAGE_INCREASE ||
           nType == EFFECT_TYPE_DAMAGE_REDUCTION ||
           nType == EFFECT_TYPE_DAMAGE_RESISTANCE ||
           nType == EFFECT_TYPE_DAZED ||
           nType == EFFECT_TYPE_DEAF ||
           nType == EFFECT_TYPE_DOMINATED ||
           nType == EFFECT_TYPE_ELEMENTALSHIELD ||
           nType == EFFECT_TYPE_ETHEREAL ||
           nType == EFFECT_TYPE_FRIGHTENED ||
           nType == EFFECT_TYPE_HASTE ||
           nType == EFFECT_TYPE_IMMUNITY ||
           nType == EFFECT_TYPE_IMPROVEDINVISIBILITY ||
           nType == EFFECT_TYPE_INVISIBILITY ||
           nType == EFFECT_TYPE_INVULNERABLE ||
           nType == EFFECT_TYPE_ABILITY_INCREASE ||
           nType == EFFECT_TYPE_NEGATIVELEVEL ||
           nType == EFFECT_TYPE_PARALYZE ||
           nType == EFFECT_TYPE_POLYMORPH ||
           nType == EFFECT_TYPE_REGENERATE ||
           nType == EFFECT_TYPE_SANCTUARY ||
           nType == EFFECT_TYPE_SAVING_THROW_INCREASE ||
           nType == EFFECT_TYPE_SEEINVISIBLE ||
           nType == EFFECT_TYPE_SILENCE ||
           nType == EFFECT_TYPE_SKILL_INCREASE ||
           nType == EFFECT_TYPE_SLOW ||
           nType == EFFECT_TYPE_SPELL_IMMUNITY ||
           nType == EFFECT_TYPE_SPELL_RESISTANCE_INCREASE ||
           nType == EFFECT_TYPE_SPELLLEVELABSORPTION ||
           nType == EFFECT_TYPE_TEMPORARY_HITPOINTS ||
           nType == EFFECT_TYPE_TRUESEEING ||
           nType == EFFECT_TYPE_ULTRAVISION ||
           nType == EFFECT_TYPE_INVULNERABLE))

            RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void SetupArea(object oPC)
{
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);
    SetLocalInt(GetModule(), "X2Q5_HANDLED_BEBELITH", 1);
    object oObelisk = GetObjectByTag("q5c_obelisk");
    object oRunes = GetObjectByTag("q5c_runes");
    effect eVis = EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10);
    effect eVis2 = EffectVisualEffect(VFX_DUR_BLUR);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oObelisk);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oObelisk);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oRunes);

    effect eWeb = EffectVisualEffect(VFX_DUR_WEB);
    effect eBigWeb = EffectVisualEffect(VFX_DUR_WEB_MASS);
    object oWeb = GetFirstObjectInArea(OBJECT_SELF);
    effect eInv = EffectVisualEffect(VFX_COM_UNLOAD_MODEL);
    effect eHold = EffectCutsceneParalyze();
    while(oWeb != OBJECT_INVALID)
    {
        if(GetTag(oWeb) == "q5c_web_source" || GetTag(oWeb) == "q5c_device")
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eWeb, oWeb);
        }
        else if(GetTag(oWeb) == "q5c_web_source_big")
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBigWeb, oWeb);
        }
        oWeb = GetNextObjectInArea(OBJECT_SELF);
    }
}

void FeedbackMessage(object oPC)
{
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(oPC, "Q5C_DO_FEEDBACK_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(oPC, "Q5C_DO_FEEDBACK_ONCE", 1);
    object oTalker = CreateObject(OBJECT_TYPE_PLACEABLE, "q5c_talker", GetLocation(oPC));
    DelayCommand(2.0, AssignCommand(oPC, ActionStartConversation(oPC, "q5c_dead_magic", FALSE, FALSE)));
}

void main()
{
    object oEnter = GetEnteringObject();
    FeedbackMessage(oEnter);
    SetupArea(oEnter);
    if(GetLocalInt(OBJECT_SELF, "REST_INIT") == 0)
    {
        SetLocalString(OBJECT_SELF, "X2_WM_ENCOUNTERTABLE", "q5_LowerTunnels");
        SetLocalInt(OBJECT_SELF, "REST_INIT", 1);
    }

    // Making a check to see whether the creature is already inside (save game)
    int nInside = GetLocalInt(oEnter, "Q5C_INSIDE");
    if(nInside == 1) // loaded a save game
        return;
    SetLocalInt(oEnter, "Q5C_INSIDE", 1);
    if(GetObjectType(oEnter) == OBJECT_TYPE_CREATURE &&
        GetLocalInt(OBJECT_SELF, "DEAD_MAGIC_DISABLED") == 0 &&
        GetAppearanceType(oEnter) != 422 /*bebelith*/ &&
        GetRacialType(oEnter) != RACIAL_TYPE_VERMIN /* spiders */&&
        GetAppearanceType(oEnter) != APPEARANCE_TYPE_LIZARDFOLK_B /*ghosts*/)
    {
        DebugString("BOOM DEADM: *** Handling removal of magic from creature: " + GetName(oEnter));
        RemoveEffects(oEnter);
        effect eSpellFailure = EffectSpellFailure(100, SPELL_SCHOOL_GENERAL);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpellFailure, oEnter);
        // Handle all items in inventory:
        object oItem = GetFirstItemInInventory(oEnter);
        while(oItem != OBJECT_INVALID)
        {
            RemoveAllProperties(oItem, oEnter);
            oItem = GetNextItemInInventory(oEnter);
        }
        oItem = GetItemInSlot(INVENTORY_SLOT_ARMS, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_ARROWS, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_BELT, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_BOLTS, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_BOOTS, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_BULLETS, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_NECK, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oEnter);
        RemoveAllProperties(oItem, oEnter);
        oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oEnter);
        RemoveAllProperties(oItem, oEnter);
    }
}
