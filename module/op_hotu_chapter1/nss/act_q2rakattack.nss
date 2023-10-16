//::///////////////////////////////////////////////
//:: act_q2rakattack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All Rakata transform and attack

    //if PC had met Linu - then PC now knows that Linu was a fake
    X2_PCKnowsRakshasa
    0   PC knows nothing
    1   PC has met Linu in the Rakshasa area - doesn't know she's a fake
    2   PC knows that Linu was a fake
    3   PC has found the real Linu
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 4/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void CreateRak(object oRak);
void DelayRakCreate(location lLoc);
void DelayRakLeadCreate(location lLoc);
void CreateLeader(object oRak);
void CreateChest(location lLoc);

void main()
{
    ///Update players journal
    AddJournalQuestEntry("rakshasa",99,GetFirstPC(),TRUE,TRUE);



///all Rakata transform and attack the player

    //OBJECT_SELF should be the area
    object oArea = OBJECT_SELF;
    if (GetLocalInt(oArea, "X2_RakTransformed") == 1)
        return;

    SetLocalInt(oArea, "X2_RakTransformed", 1);

    if (GetLocalInt(GetModule(), "X2_PCKnowsRakshasa") == 1)
        SetLocalInt(GetModule(), "X2_PCKnowsRakshasa", 2);

    float fDelay;
    object oRak = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oRak) == TRUE)
    {
        if (GetTag(oRak) == "q2crakslaveleader")
        {
            CreateLeader(oRak);
        }
        else if (GetStringLeft(GetTag(oRak), 6) == "q2crak")
        {
            fDelay = IntToFloat(Random(5));
            //DelayCommand(fDelay, SignalEvent(oRak, EventUserDefined(101)));
            DelayCommand(fDelay, CreateRak(oRak));
        }
        oRak = GetNextObjectInArea(oArea);
    }

    //Destroy some old illusionary placeables and put in some new ones..
    object oPlace1 = GetObjectByTag("q2c_rakplaceable1");
    object oPlace2 = GetObjectByTag("q2c_rakplaceable2");
    object oPlace3 = GetObjectByTag("q2c_rakplaceable3");
    object oPlace4 = GetObjectByTag("q2c_rakplaceable4");
    location lChest1 = GetLocation(GetWaypointByTag("wp_q2crakchest_1"));
    location lChest2 = GetLocation(GetWaypointByTag("wp_q2crakchest_2"));
    location lChest3 = GetLocation(GetWaypointByTag("wp_q2crakchest_3"));
    location lChest4 = GetLocation(GetWaypointByTag("wp_q2crakchest_4"));

    effect eVis1 = EffectVisualEffect(VFX_IMP_HEALING_G);
    effect eVis2 = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
    effect eLink = EffectLinkEffects(eVis1, eVis2);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lChest1);
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lChest2));
    DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lChest3));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lChest4));

    DestroyObject(oPlace1, 0.5);
    DestroyObject(oPlace2, 1.0);
    DestroyObject(oPlace3, 1.5);
    DestroyObject(oPlace4, 2.0);

    DelayCommand(1.0, CreateChest(lChest1));
    DelayCommand(1.5, CreateChest(lChest2));
    DelayCommand(2.0, CreateChest(lChest3));
    DelayCommand(2.5, CreateChest(lChest4));

    location lThrone1 = GetLocation(GetWaypointByTag("wp_q2crakthrone_1"));
    location lThrone2 = GetLocation(GetWaypointByTag("wp_q2crakthrone_2"));
    location lThrone3 = GetLocation(GetWaypointByTag("wp_q2crakthrone_3"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lThrone1);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lThrone2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lThrone3);
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_throneevil", lThrone1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_throneevil", lThrone2);
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_throneevil", lThrone3);

}
void CreateRak(object oRak)
{
    AssignCommand(oRak, ClearAllActions(TRUE));

    location lLoc = GetLocation(oRak);
    //Apply a transformation effect
    effect eTransform1 = EffectVisualEffect(VFX_DUR_PIXIEDUST);
    effect eTransform2 = EffectVisualEffect(VFX_IMP_DISPEL);
    effect eTransform3 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    effect eTransform4 = EffectVisualEffect(471);
    effect eLink1 = EffectLinkEffects(eTransform1, eTransform2);
    effect eLink2 = EffectLinkEffects(eTransform3, eTransform4);
    effect eLink = EffectLinkEffects(eLink1, eLink2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lLoc);
    DestroyObject(oRak);

    DelayCommand(0.5, DelayRakCreate(lLoc));


}

void CreateLeader(object oRak)
{
    AssignCommand(oRak, ClearAllActions(TRUE));

    location lLoc = GetLocation(oRak);
    //Apply a transformation effect
    effect eTransform1 = EffectVisualEffect(VFX_DUR_PIXIEDUST);
    effect eTransform2 = EffectVisualEffect(VFX_IMP_DISPEL);
    effect eTransform3 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    effect eTransform4 = EffectVisualEffect(471);
    effect eLink1 = EffectLinkEffects(eTransform1, eTransform2);
    effect eLink2 = EffectLinkEffects(eTransform3, eTransform4);
    effect eLink = EffectLinkEffects(eLink1, eLink2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lLoc);
    DestroyObject(oRak);
    DelayCommand(0.5, DelayRakLeadCreate(lLoc));


}
void DelayRakCreate(location lLoc)
{
    int nRandom = Random(3) + 1;
    string szTag;

    switch (nRandom)
    {
        case 1: szTag = "q2crak1";
                break;
        case 2: szTag = "q2crak2";
                break;
        case 3: szTag = "q2cguardrak";
                break;
    }
    object oRak = CreateObject(OBJECT_TYPE_CREATURE, szTag, lLoc);
    AssignCommand(oRak, DetermineCombatRound(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)));
}

void DelayRakLeadCreate(location lLoc)
{

    int nRandom = Random(3) + 1;
    string szTag = "q2crakshareesh";

    object oRak = CreateObject(OBJECT_TYPE_CREATURE, szTag, lLoc);
    AssignCommand(oRak, DetermineCombatRound(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)));
}

void CreateChest(location lLoc)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2crakchest", lLoc);
}

