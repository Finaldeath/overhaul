//::///////////////////////////////////////////////
//:: M3Q2F18Glass.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Handles the placement of the glass gems in
    the pillars.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"


float nDestroyTime = 6.0;

void DoColor(object oItem)
{
    // * if red gem in, then spawn temporary Red Beam
    // * which must destroy itself after 18 seconds
    if (GetTag(oItem) == "M3Q2F18_RED")
    {
       object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2F18_RED",GetLocation(OBJECT_SELF));
       AssignCommand(oLight, DelayCommand(nDestroyTime, DestroyObject(OBJECT_SELF)));

    }
    else
    if (GetTag(oItem) == "M3Q2F18_BLUE")
    {
       object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2F18_BLUE",GetLocation(OBJECT_SELF));
       AssignCommand(oLight, DelayCommand(nDestroyTime, DestroyObject(OBJECT_SELF)));

    }
    else
    if (GetTag(oItem) == "M3Q2F18_GREEN")
    {
       object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2F18_GREEN",GetLocation(OBJECT_SELF));
       AssignCommand(oLight, DelayCommand(nDestroyTime, DestroyObject(OBJECT_SELF)));

    }
    else
    if (GetTag(oItem) == "M3Q2F18_ORANGE")
    {
       object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2F18_ORANGE",GetLocation(OBJECT_SELF));
       AssignCommand(oLight, DelayCommand(nDestroyTime, DestroyObject(OBJECT_SELF)));

    }
    else
    if (GetTag(oItem) == "M3Q2F18_PURPLE")
    {
       object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2F18_PURPLE",GetLocation(OBJECT_SELF));
       AssignCommand(oLight, DelayCommand(nDestroyTime, DestroyObject(OBJECT_SELF)));

    }
    else
    if (GetTag(oItem) == "M3Q2F18_YELLOW")
    {
       object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q2F18_YELLOW",GetLocation(OBJECT_SELF));
       AssignCommand(oLight, DelayCommand(nDestroyTime, DestroyObject(OBJECT_SELF)));

    }

}

//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns the resref of the secondary gem that matches
    the two primary colored gems.
    Returns NOMATCH if no valid primary gems
    in each primary pillar
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

string GetPrimaryColorMatch()
{
    object oPillar1 = GetNearestObjectByTag("M3Q2LampPRIM", OBJECT_SELF, 1);
    object oPillar2 = GetNearestObjectByTag("M3Q2LampPRIM", OBJECT_SELF, 2);

    object oTempItem = OBJECT_INVALID;

    // * Find Gem color for pillar one
    int nColor1 = GetLocalInt(oPillar1, "NW_G_M2_GEMPRESSED");
    int nColor2 = GetLocalInt(oPillar2, "NW_G_M2_GEMPRESSED");

//    SpeakString(IntToString(nColor1));
//    SpeakString(IntToString(nColor2));
    string sTemp =  "NOMATCH";

    // * purple match
    if (((nColor1 == 3) && (nColor2 == 1)) || ((nColor1 == 1) && (nColor2 == 3)))
    {
        sTemp = "M3Q2F18_PURPLE";
    }
    // * orange match
    else
    if (((nColor1 == 3) && (nColor2 == 2)) || ((nColor1 == 2) && (nColor2 == 3)))
    {
        sTemp = "M3Q2F18_GREEN";
    }
    // * green match
    else
    if (((nColor1 == 1) && (nColor2 == 2)) || ((nColor1 == 2) && (nColor2 == 1)))
    {
        sTemp = "M3Q2F18_ORANGE";
    }
  //  SpeakString(sTemp);
    return sTemp;
}

//::///////////////////////////////////////////////
//:: CheckValidMatch
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Returns true if this is a secondary pillar
   and it and the other secondary pillar have the
   correct Secondary colored gem inside of it.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void CheckValidMatch()
{
    // * this is a secondary colored pillar
    if (GetTag(OBJECT_SELF) == "M3Q2LampSECO")
    {
        object oOtherPillar = OBJECT_INVALID;
       // * check primary
       // * do later
       // * Check that both secondaries have the right one in it
//       SpeakString("In CheckValidMatch: Is Secondary");
       string sRightColor = GetPrimaryColorMatch();

        // * stops running the script if there wasn't a primary color match
//       SpeakString(sRightColor);
       if (sRightColor == "NOMATCH")
       {
        return;
       }

       // * find the other pillar
       if (GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,sRightColor)) == TRUE)
       {
        //SpeakString("Secondary color match Pillar 1");
        int nPos = 1;
        do
        {
            oOtherPillar = GetNearestObjectByTag("M3Q2LampSECO", OBJECT_SELF, nPos);
            nPos++;
        }
        while (GetObjectType(oOtherPillar) != OBJECT_TYPE_PLACEABLE) ;
       }
       if (GetIsObjectValid(oOtherPillar) == TRUE && GetObjectType(oOtherPillar) == OBJECT_TYPE_PLACEABLE)
       {
        if (GetIsObjectValid(GetItemPossessedBy(oOtherPillar,sRightColor)) == TRUE)
        {
          // SpeakString("Secondary color match Pillar 2: LOCK UNLOCKED BY THIS IS NOT IMPLEMENTED YET");
          DestroyObject(GetItemPossessedBy(OBJECT_SELF,sRightColor));
          DestroyObject(GetItemPossessedBy(oOtherPillar,sRightColor));
          object oPrim1 =GetNearestObjectByTag("M3Q2LampPRIM",OBJECT_SELF,1);
          SetPlotFlag(oPrim1,FALSE);
          object oPrim2 = GetNearestObjectByTag("M3Q2LampPRIM",OBJECT_SELF,2);
          SetPlotFlag(oPrim2,FALSE);
          object oSec1 = GetNearestObjectByTag("M3Q2LampSECO",OBJECT_SELF,1);
          SetPlotFlag(oSec1,FALSE);
//            object oSec2 = GetNearestObjectByTag("M3Q2LampSECO",OBJECT_SELF,2);
            object oSec2 = OBJECT_SELF;
          SetPlotFlag(oSec2,FALSE);
            effect eDest = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
            location lPrim1 = GetLocation(oPrim1);
            location lPrim2 = GetLocation(oPrim2);
            location lSec1 = GetLocation(oSec1);
            location lSec2 = GetLocation(oSec2);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eDest,lPrim1);
            DestroyObject(oPrim1);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eDest,lPrim2);
            DestroyObject(oPrim2);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eDest,lSec1);
            DestroyObject(oSec1);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eDest,lSec2);
            DestroyObject(oSec2);
            DecrementLocksOnDoor();
        }

       }
    }
}

void main()
{

    object oContainer = GetLastDisturbed();
    object oItem = GetFirstItemInInventory();

    // * exit if nothing
   if (GetIsObjectValid(oContainer) == FALSE)
    {
        return;
    }
    if ( (GetIsObjectValid(oItem) == FALSE) )
    {
        return;
    }
    DoColor(oItem);
    oItem = GetNextItemInInventory();
    // * move all items except one into the pool
    // * Move any and all items past the 'first item' to the pool
    while (GetIsObjectValid(oItem))
    {
      ActionGiveItem(oItem, oContainer);
      oItem = GetNextItemInInventory();
    }

    // * If this is a Primary colored pillar
    // * then run this CheckValidMatch on the nearest secondary color
    // * pillar.  This is because all the code relies in the function
    // * relies upon it being a secondary colored pillar.
    if (GetTag(OBJECT_SELF) == "M3Q2LampPRIM")
    {
        object oSec = GetNearestObjectByTag("M3Q2LampSECO");
        AssignCommand(oSec, CheckValidMatch());

    }
    else
    {
        CheckValidMatch();
    }

}
