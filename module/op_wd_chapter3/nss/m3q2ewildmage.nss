//::///////////////////////////////////////////////
//:: Wild Mage spawns creatures
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The wild mage creates hostile creatures
    in a weird wild magic'ish effect.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    // * If wild magic object is in creator race ruins then exit immediately
    // * I am just using this object as spell-caster in this area
    // * In the exterior of the creator race ruins it is used as a
    // * 'summon weird creatures' system.
    if (GetTag(GetModule()) == "M3Q2F")
    {
        return;
    }
   // * every 5 heartbeats do this, if I can see a player
   object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
   if (GetIsObjectValid(oPC) == FALSE)
   {
    return;
   }
   if (GetDistanceToObject(oPC) > 20.0)
   {
     return;
   }
 //  SpeakString("here");
   int nPeriod = GetLocalInt(OBJECT_SELF,"NW_L_PERIOD");
   nPeriod = nPeriod + 1;
   SetLocalInt(OBJECT_SELF,"NW_L_PERIOD", nPeriod);
   object oCreature = OBJECT_INVALID;
   if (nPeriod == 5)
   {
     //   SpeakString("inner loop");
        SetLocalInt(OBJECT_SELF,"NW_L_PERIOD", 0);
        oCreature = GetLocalObject(OBJECT_SELF,"NW_L_LAST_SUMMONED");
        if (GetIsObjectValid(oCreature) == TRUE)
        {
            // * there was a previous creature, destroy it
            DestroyObject(oCreature);
            oCreature = OBJECT_INVALID;
        }
        int nRandom = Random(3) + 1;
        location lLoc = GetLocation(GetNearestObjectByTag("M3Q2EWILDMAGES"));
        switch (nRandom)
        {
            case 1:  oCreature = CreateObject(OBJECT_TYPE_CREATURE, "NW_SLAADBL", lLoc);
            break;
            case 2:  oCreature = CreateObject(OBJECT_TYPE_CREATURE, "NW_HORROR", lLoc);
            break;
            case 3:  oCreature = CreateObject(OBJECT_TYPE_CREATURE, "NW_KRENSHAR", lLoc);
            break;
        }
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis, lLoc);
        if (GetIsObjectValid(oCreature) == TRUE)
        {
           SetLocalObject(OBJECT_SELF,"NW_L_LAST_SUMMONED", oCreature);
        }
    }
}
