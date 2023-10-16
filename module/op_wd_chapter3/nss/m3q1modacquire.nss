//::///////////////////////////////////////////////
//:: Module OnAcquire Item
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  If Words of Power are picked up Haedraline will appear.
  Only the first time for each word.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  November 19 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"




// * removes an existing Haedraline from the world
void   DestroyExistingHaedraline()
{
 object oHaed = GetObjectByTag("Haedraline3Q11");
 if (GetIsObjectValid(oHaed) == TRUE)
 {
    DestroyObject(oHaed);
 }

}


void main()
{
    // * only care about this event if it fires for PCs
    if (GetIsPC(GetItemPossessor(GetModuleItemAcquired())) == FALSE)
    {
        return;
    }
    if (GetIsObjectValid(GetModuleItemAcquired()) == FALSE)
    {
        return;
    }
    object oFound = GetItemPossessor(GetModuleItemAcquired());
    object oItemFound = GetModuleItemAcquired();
    if (GetTag(oItemFound)=="M3Q1_A11_LIL_SNO")
    {
        AddJournalQuestEntry("M3Q1_A11_LILLIAN",15,oFound);
        SetLocalInt(oFound,"HasSnowGlobe",1);
    }
    object oHaed = OBJECT_INVALID;
    // * Snow Globe
    if ((GetTag(GetModuleItemAcquired()) == "M3Q1_WORDPOWER1")
        && (GetLocalInt(GetModule(),"M3Q1_WORDPOWER1GOT") == 0))
    {
        SetLocalInt(GetModule(),"NW_G_RECALL_HAED", 10);
        DestroyExistingHaedraline();
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        location lWay = GetLocation(GetObjectByTag("M3Q3C10PortalL"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lWay,0.5);
         CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q3C10Portal", GetLocation(GetObjectByTag("M3Q3C10PortalL")));

        oHaed = CreateObject(OBJECT_TYPE_CREATURE,"Haedraline3Q11",GetLocation(GetNearestObjectByTag("M3Q1A11HAEDSPWN",oFound)));
        SetLocalInt(GetModule(),"M3Q1_WORDPOWERGOT",GetLocalInt(GetModule(),"M3Q1_WORDPOWERGOT") + 1);
        SetLocalInt(GetModule(),"M3Q1_WORDPOWER1GOT",1);
//       RewardXP("M3Q1_A01_WORDPOWER",100,oFound);
       AddJournalQuestEntry("M3Q1_A11_LILLIAN", 99, oFound);
    }
    // * Creator Race
    else if ((GetTag(GetModuleItemAcquired()) == "M3Q1_WORDPOWER2")
        && (GetLocalInt(GetModule(),"M3Q1_WORDPOWER2GOT") == 0))
    {
        SetLocalInt(GetModule(),"NW_G_RECALL_HAED", 10);
         DestroyExistingHaedraline();
        effect eVis2 = EffectVisualEffect(VFX_IMP_UNSUMMON);
        location lWay2 = GetLocation(GetObjectByTag("WP_M3Q2F_PORTAL"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis2,lWay2,0.5);
         CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q2F_PORTAL", GetLocation(GetObjectByTag("WP_M3Q2F_PORTAL")));
        oHaed = CreateObject(OBJECT_TYPE_CREATURE,"Haedraline3Q11",GetLocation(GetNearestObjectByTag("M3Q1A11HAEDSPWN", oFound)));
        SetLocalInt(GetModule(),"M3Q1_WORDPOWERGOT",GetLocalInt(GetModule(),"M3Q1_WORDPOWERGOT") + 1);
        SetLocalInt(GetModule(),"M3Q1_WORDPOWER2GOT",1);
//        RewardXP("M3Q1_A01_WORDPOWER",100,oFound);
    }
    else if ((GetTag(GetModuleItemAcquired()) == "M3Q1_WORDPOWER3")
        && (GetLocalInt(GetModule(),"M3Q1_WORDPOWER3GOT") == 0))
    {
        SetLocalInt(GetModule(),"NW_G_RECALL_HAED", 10);
        DestroyExistingHaedraline();
        effect eVis3 = EffectVisualEffect(VFX_IMP_UNSUMMON);
        location lWay3 = GetLocation(GetObjectByTag("WP_M3Q4HC_PORTAL"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis3,lWay3,0.5);
        CreateObject(OBJECT_TYPE_PLACEABLE, "M3Q4HC_PORTAL", GetLocation(GetObjectByTag("WP_M3Q4HC_PORTAL")));
        oHaed = CreateObject(OBJECT_TYPE_CREATURE,"Haedraline3Q11",GetLocation(GetNearestObjectByTag("M3Q1A11HAEDSPWN", oFound)));
        SetLocalInt(GetModule(),"M3Q1_WORDPOWERGOT",GetLocalInt(GetModule(),"M3Q1_WORDPOWERGOT") + 1);
        SetLocalInt(GetModule(),"M3Q1_WORDPOWER3GOT",1);
//        RewardXP("M3Q1_A01_WORDPOWER",100,oFound);
    }
    // * no valid, Haedraline, then exit
    if (GetIsObjectValid(oHaed) == FALSE)
    {
        return;
    }
        object oItem = GetModuleItemAcquired();
        object oGot = GetItemPossessor(oItem);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MAGICAL_VISION),oHaed);
        AssignCommand(oHaed, ActionStartConversation(oGot));

}
