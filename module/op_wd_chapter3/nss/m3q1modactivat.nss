//::///////////////////////////////////////////////
//:: M3Q1MODACTIVAT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script fires whenever the player
    uses a custom plot item.

    Custom Plot Items
    a) Time Crystal: Can be used on a sundial to
    travel in time.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


//::///////////////////////////////////////////////
//:: StripItems
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through and removes any 'non-time
    travellable items' from the player.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void DeleteItem(string sTag,object oClicker)
{
    object oAnachronism = GetItemPossessedBy(oClicker, sTag);
    if (GetIsObjectValid(oAnachronism) == TRUE)
    {
//        AssignCommand(oClicker,ActionSpeakString("Amulet destroyed."));
        DestroyObject(oAnachronism);
        DelayCommand(1.0,DeleteItem(sTag,oClicker));
    }
}
void StripItems(object oClicker)
{
  /*
  M3Q2F25FAKEWORD
  M3Q2GTRANAM
  M3Q2STASIS_SCROL
  - display an error string
  */
  object oItem = GetItemPossessedBy(oClicker, "M3Q2F25FAKEWORD");
  if (GetIsObjectValid(oItem) == TRUE)
  {
    DestroyObject(oItem);
  }

//  DeleteItem("M3Q2GTRANAM",oClicker);

  DeleteItem("M3Q2STASIS_SCROL",oClicker);
}

// * feedback if item activator is no longer valid
void CheckError()
{
  if (GetIsObjectValid(GetItemActivatedTarget()) == FALSE)
  {
    AssignCommand(GetItemActivator(), ActionSpeakStringByStrRef(0));
    return;
  }
}

void CheckTimeCrystalError()
{
  if (GetIsObjectValid(GetItemActivatedTarget()) == FALSE)
  {
    AssignCommand(GetItemActivator(), ActionSpeakStringByStrRef(66933));
    return;
  }
}
void GoTo(string sTag)
{
              object oClicker = GetItemActivator();
              object oTarget = GetObjectByTag(sTag);
             // AssignCommand(GetItemActivator(), SpeakString(sTag));
                // * if I don't do this, gets stuck in a loop
                // * of casting.
              AssignCommand(oClicker, ClearAllActions());
              //SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    location lPC = GetLocation(oClicker);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);
              DelayCommand(1.0,AssignCommand(oClicker,JumpToObject(oTarget)));

              AssignCommand(oClicker, ActionDoCommand(ClearAllActions()));
}


#include "nw_i0_plot"


void main()
{
    // * Word of Recall has been used
    if (IsRecall() == TRUE)
    {
    }
    else

    // * If TimeKey was used
   //  AssignCommand(GetItemActivator(), SpeakString("39"));
    // * Room 11                        M3Q2FTIME_CRY
    if (GetTag(GetItemActivated()) == "M3Q2FTIME_CRY")
    {
        CheckTimeCrystalError();
//AssignCommand(GetItemActivator(), SpeakString("44"));
        string sTag = GetTag(GetItemActivatedTarget());
        if ( sTag == "M3Q2F05SUNDIAL")
        {
              GoTo("M3Q2G05SUNDIAL");
        }
        else
        if ( sTag == "M3Q2F11SUNDIAL")
        {
              GoTo("M3Q2G11SUNDIAL");
        }
        else
        if ( sTag == "M3Q2G05SUNDIAL")
        {
              GoTo("M3Q2F05SUNDIAL");
        }
        else
        if (sTag  == "M3Q2G11SUNDIAL")
        {
              GoTo("M3Q2F11SUNDIAL");
        }
      StripItems(GetItemActivator());
    }
    else
   // * Stasis Scroll
   if (GetTag(GetItemActivated()) == "M3Q2STASIS_SCROL")
   {
      object oClicker = GetItemActivator();
      location lLoc = GetLocation(oClicker);
      object oArea = GetAreaFromLocation(lLoc);
      vector vPos = GetPositionFromLocation(lLoc);
      float fFacing = GetFacingFromLocation(lLoc);
      // * swap in 'present' area


  //     GoTo("M3Q2_ID_RACE_PRESENT");
  //        AssignCommand(oClicker,SpeakString("here"));

      /*
         The area you grab depends upon the area you were in
         when you used the scroll
      */
      if (GetTag(oArea) == "M3Q2G")
      {
        oArea = GetArea(GetObjectByTag("M3Q2_ID_RACE_PRESENT"));
      }
      else
      {
        oArea = GetArea(GetObjectByTag("M3Q2_ID_RACE_PRESENT_GARDEN"));
      }


      // * rebuild location
      lLoc = Location(oArea, vPos, fFacing);
     // SetAreaTransitionBMP(AREA_TRANSITION_RURAL);
      AssignCommand(oClicker, ClearAllActions());
      AssignCommand(oClicker,JumpToLocation(lLoc));
   //      DestroyObject(GetItemActivated());
      StripItems(GetItemActivator());
   }
   else
   // * Fairy in a Bottle
   if (GetTag(GetItemActivated()) == "m3q2fsprite")
   {
        object oPC = GetItemActivator();
        object oItem = GetItemActivated();
        if (GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(GetNearestObjectByTag("M3Q1F20Gong1", oPC))) < 25.0)
        {
          // * allow pixie to come out
          effect eVis = EffectVisualEffect(VFX_FNF_SOUND_BURST);
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oPC);
          DestroyObject(oItem, 0.5);
          object oSprite = CreateObject(OBJECT_TYPE_CREATURE, "M3Q2F20Musical", GetLocation(oPC));
          eVis = EffectVisualEffect(VFX_FNF_SOUND_BURST);
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oSprite);
          DelayCommand(0.5, AssignCommand(oSprite, SpeakOneLinerConversation()));
        }
        else
        {
          // * DO NOT allow pixie to come out
          effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oPC);
          AssignCommand(oPC, ActionSpeakStringByStrRef(53003));
        }
   }
}
