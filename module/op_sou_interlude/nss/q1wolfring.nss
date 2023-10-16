//::///////////////////////////////////////////////
//:: Name q1wolfring
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wolf ring that is created by herbalist's wolf
    dog.  Charged item that lets you summon a dire
    wolf.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 26/03
//:://////////////////////////////////////////////

void main()
{
    //Only works outside**Not possible to script at the moment**

    // Get the activator
    object oPC = GetItemActivator();
    //DEBUG
    //    SendMessageToPC(GetFirstPC(), "USing Ring");
    //DEBUG
    // Get the ring
    object oRing = GetItemActivated();

    location lTarget = GetItemActivatedTargetLocation();

    //Declare major variables
    int nSpellID = GetSpellId();
    int nDuration = 6;



    string sSummon = "NW_S_WOLFDIRE";//q1ring_wolf
    effect eSummonedMonster = EffectSummonCreature(sSummon, VFX_FNF_SUMMON_MONSTER_1);

    //Apply the VFX impact and summon effect

    //if (GetIsEffectValid(eSummonedMonster) == TRUE)
    //{
        //DEBUG
        //SendMessageToPC(GetFirstPC(), "eSummonedMonster is Valid");
        //DEBUG
    //}
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSummonedMonster, oPC, RoundsToSeconds(nDuration));


}





