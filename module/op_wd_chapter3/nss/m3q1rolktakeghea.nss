//::///////////////////////////////////////////////
//:: Takes Guzud's head
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  November 16 2001
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
 if (HasItem(GetPCSpeaker(),"M3Q3_A02GUZUD") == TRUE)
 {
      object oItem = GetItemPossessedBy(GetPCSpeaker(), "M3Q3_A02GUZUD");
     if (GetIsObjectValid(oItem) == TRUE)
     {
        DestroyObject(oItem);
     }
//    ActionTakeItem(GetObjectByTag("M3Q3_A02GUZUD"), GetPCSpeaker());
    AddJournalQuestEntry("M3Q1_A07_BANDIT_PLOT",30, GetPCSpeaker());
    // * put head on pike
    CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q1A07GuzudHead", GetLocation(GetObjectByTag("M3Q1A07GuzudHead")));
    SetLocalInt(OBJECT_SELF,"NW_G_M3Q1A_ROLKIDGUZUD",1);
 }
}
