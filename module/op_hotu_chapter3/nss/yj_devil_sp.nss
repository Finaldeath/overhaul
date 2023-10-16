//:://////////////////////////////////////////////////
//:: CUSTOM OnSpawn handler.

//#include "x0_i0_anims"

void main()
{
    //SetSpawnInCondition(NW_FLAG_DEATH_EVENT);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), OBJECT_SELF);
    effect eVis = EffectVisualEffect(471);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    // spawn a weapon
    int nRand = d20();
    string sBP;
    if(nRand <= 5)
        sBP = "NW_WPLSC001";
    else if(nRand <= 12)
        sBP = "NW_WPLHB001";
    else if(nRand <= 19)
        sBP = "NW_WSWBS001";
    else
        sBP = "NW_WBWMLN010";

    object oWeapon = CreateItemOnObject(sBP);
    SetDroppableFlag(oWeapon, FALSE);
    ActionEquipItem(oWeapon, INVENTORY_SLOT_RIGHTHAND);
    // ***** ADD ANY CUSTOM ON-SPAWN CODE HERE ***** //

    // Adjust base attack bonsu
    // Current BAB is: 10 (barbarian 10) + 4 (str)
    effect eBonus = EffectAttackIncrease(14);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBonus, OBJECT_SELF);

}


