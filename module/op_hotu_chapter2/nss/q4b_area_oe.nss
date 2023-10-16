// Upper dungeon on-enter event

#include "x2_inc_itemprop"

void AutoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();
}

int HasPolymorphEffect(object oPC)
{
    effect eEff = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEff))
    {
        if(GetEffectType(eEff) == EFFECT_TYPE_POLYMORPH)
            return TRUE;
        eEff = GetNextEffect(oPC);
    }
    return FALSE;
}

void SetAttackingWeapon(object oPC)
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "Q4B_DO_WEAPON_SET_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "Q4B_DO_WEAPON_SET_ONCE", 1);

    object oItemLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    object oItemRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    if(!IPGetIsMeleeWeapon(oItemLeft))
        oItemLeft = OBJECT_INVALID;
    if(!IPGetIsMeleeWeapon(oItemRight))
        oItemRight = OBJECT_INVALID;

    // if the player has has melee weapon un-equiped (choosing the most powerful one):
    if(HasPolymorphEffect(oPC) || (oItemLeft == OBJECT_INVALID && oItemRight == OBJECT_INVALID))
    {
        object oItem = GetFirstItemInInventory(oPC);
        int nCost;
        int nHighCost = 23000;
        SetLocalInt(OBJECT_SELF, "HIGH_COST", nHighCost);
        while(oItem != OBJECT_INVALID)
        {
            if(IPGetIsMeleeWeapon(oItem))
            {
                nCost = GetGoldPieceValue(oItem);
                nHighCost = GetLocalInt(OBJECT_SELF, "HIGH_COST");
                if(nCost > nHighCost)
                {
                    SetLocalInt(OBJECT_SELF, "HIGH_COST", nCost);
                    oItemRight = oItem;
                    SetLocalObject(oPC, "Q4B_RIGHT", oItem);
                }

            }
            oItem = GetNextItemInInventory(oPC);
        }
    }

    if(oItemLeft != OBJECT_INVALID)
        SetLocalObject(oPC, "Q4B_LEFT", oItemLeft);
    if(oItemRight != OBJECT_INVALID)
        SetLocalObject(oPC, "Q4B_RIGHT", oItemRight);

}

void SetupArea()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SETUP_ONCE", 1);

    object oChain = GetObjectByTag("q4b_chain");
    effect eVis = EffectVisualEffect(VFX_DUR_BLUR);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oChain);

    object oLever1 = GetObjectByTag("q4b_Lever_a");
    object oLever2 = GetObjectByTag("q4b_Lever_b");
    object oLever3 = GetObjectByTag("q4b_action_lever");
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oLever3);

    SignalEvent(OBJECT_SELF, EventUserDefined(101));
}

void GenerateArcaneTreasure()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_WIZ_LOOT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_WIZ_LOOT_ONCE", 1);

    object oChest1 = GetObjectByTag("q4b_chest1");
    object oChest2 = GetObjectByTag("q4b_chest2");

    CreateItemOnObject("q4d_golemhead", oChest1);
    CreateItemOnObject("q4_golrighthand", oChest2);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nSorc = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int nWiz = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);

    if(nSorc >= 5 || nWiz >= 5)
        GenerateArcaneTreasure();
    SetAttackingWeapon(oPC);
    SetupArea();
    AutoSave();
}
