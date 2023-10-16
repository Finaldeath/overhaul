// User defined events for portal area:
// 101: One of the stones holding Halaster has been destroyed.
// 102: re-channel portal to hit living beings
#include "nw_i0_plot"

void ClearAOE(object oCreature);
void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 101)
    {
        int nCount = GetLocalInt(OBJECT_SELF, "STONES_COUNT");
        nCount++;
        SetLocalInt(OBJECT_SELF, "STONES_COUNT", nCount);
        if(nCount == 3) // all stones destroyed
        {
            effect eVis1 = EffectVisualEffect(VFX_IMP_HOLY_AID);
            effect eVis2 = EffectVisualEffect(VFX_FNF_SUNBEAM);
            effect eVis3 = EffectVisualEffect(VFX_FNF_HOWL_MIND);
            object oHalaster = GetObjectByTag("q2d_halaster");
            location lVis1 = GetLocation(GetWaypointByTag("wp_q2dhalvis1"));
            location lVis2 = GetLocation(GetWaypointByTag("wp_q2dhalvis2"));
            location lVis3 = GetLocation(GetWaypointByTag("wp_q2dhalvis3"));

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis1, lVis1);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis1, lVis2);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis1, lVis3);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oHalaster);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis3, oHalaster);
            ClearAOE(oHalaster);

            //Reward XP to the PC
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oHalaster);
            SetImmortal(oPC, TRUE);
            Reward_2daXP(oPC, 45, TRUE, 100);

            DelayCommand(3.0, SignalEvent(oHalaster, EventUserDefined(101)));
        }
    }
    else if(nEvent == 102)
    {
        // The portal would attack creatures for 10 rounds
        SetLocalInt(OBJECT_SELF, "CHANNEL_PORTAL", 1);
        DelayCommand(RoundsToSeconds(10), SetLocalInt(OBJECT_SELF, "CHANNEL_PORTAL", 0));
    }
}

//Clear  a sphere around a creature of all area of effect spells
void ClearAOE(object oCreature)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oCreature);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
}
