//::///////////////////////////////////////////////
//:: Enter SnowGlobe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Moves the PC into the snowglobe
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

//* Goes throughthe dwarf/dryad encounters and refreshes the spawnpoints
void  RefreshSpawnPoints()
{
    object oTrigger = GetObjectByTag("M3Q3_SPAWNGlobe");
    int i = 1;
    while (GetIsObjectValid(oTrigger) == TRUE)
    {
        i++;
        SetLocalInt(oTrigger, "NW_L_DOONCE",0);
        oTrigger = GetObjectByTag("M3Q3_SPAWNGlobe", i);
    }
}

void ClearAllFactionMembers(object oPlayer, object oMember)
{
//    AssignCommand(oMember, SpeakString("here"));
//    AdjustReputation(oPlayer, oMember, 100);
//    SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad

    object oClear = GetFirstFactionMember(oMember, FALSE);
    while (GetIsObjectValid(oClear) == TRUE)
    {
        ClearPersonalReputation(oPlayer, oClear);
        // * June 2002: trying to stop the bizarre behavior they are exhibiting
        AssignCommand(oClear, ClearAllActions());

        // * May 2002: Clear henchmen personal reputation as well
        object oHench = GetHenchman(oPlayer);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            ClearPersonalReputation(oHench, oClear);
            ClearPersonalReputation(oClear, oHench);
        }
        oHench = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayer);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            ClearPersonalReputation(oHench, oClear);
            ClearPersonalReputation(oClear, oHench);
        }
        oHench = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayer);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            ClearPersonalReputation(oHench, oClear);
            ClearPersonalReputation(oClear, oHench);
        }
        oHench = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayer);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            ClearPersonalReputation(oHench, oClear);
            ClearPersonalReputation(oClear, oHench);
        }
        oHench = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayer);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            ClearPersonalReputation(oHench, oClear);
            ClearPersonalReputation(oClear, oHench);
        }

        AssignCommand(oMember,ClearAllActions());
        oClear = GetNextFactionMember(oMember, FALSE);
    }
}
void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    object oPC = GetPCSpeaker();
    location lPC = GetLocation(oPC);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);

  object oClicker = GetPCSpeaker();
  object oTarget = GetObjectByTag("WP_Insidesnowglobe");
  location lLoc = GetLocation(oTarget);

    // * this local is set to prevent players
    // * from rotating the globe

  SetLocalInt(GetModule(), "NW_G_GLOBE_IN_USE", 1);

    object oDryadFaction = GetObjectByTag("M3Q3CSnowDryad");
    object oDwarfFaction = GetObjectByTag("M3Q3CSnowDwarf");
    object oArwylFaction = GetObjectByTag("M3Q3C04_ARWYL");
    object oHoddFaction = GetObjectByTag("M3Q3C07_HODD");

  ClearAllFactionMembers(oClicker,oDryadFaction);
  ClearAllFactionMembers(oClicker,oDwarfFaction);
  ClearAllFactionMembers(oClicker,oArwylFaction);
  ClearAllFactionMembers(oClicker,oHoddFaction);
  RefreshReputation();
  if (GetLocalInt(OBJECT_SELF,"NW_G_REFRESH")==0)
  {
     RefreshSpawnPoints();
     SetLocalInt(OBJECT_SELF,"NW_G_REFRESH",1);
  }
  else if (GetLocalInt(OBJECT_SELF,"NW_G_REFRESH")==1)
  {
    RefreshSpawnPoints();
    SetLocalInt(OBJECT_SELF,"NW_G_REFRESH",2);
  }
  ChangeSGWeather();
  SetAreaTransitionBMP(AREA_TRANSITION_RURAL);

  DelayCommand(2.0,AssignCommand(oClicker,JumpToLocation(lLoc)));
}
