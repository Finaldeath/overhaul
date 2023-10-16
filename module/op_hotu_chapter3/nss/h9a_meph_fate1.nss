//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Cease to Exist (Action Script)
//:: H9a_Meph_Fate1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles ceases to exist.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
void main()
{
    //Set M's Fate local
    //SetLocalString(GetModule(), "sMephistophelesFate", "CeaseExist");

   /* //Define the locations for the Implosion VFX
    location lMeph0 = GetLocation(OBJECT_SELF);
    object oArea = GetAreaFromLocation(lMeph0);
    float fOrientation = GetFacingFromLocation(lMeph0);
    vector vMeph0 = GetPositionFromLocation(lMeph0);
    vector vMeph1 = Vector(vMeph0.x+4.0, vMeph0.y+4.0, vMeph0.z+4.0);
    vector vMeph2 = Vector(vMeph0.x+4.0, vMeph0.y-4.0, vMeph0.z+4.0);
    vector vMeph3 = Vector(vMeph0.x-4.0, vMeph0.y-4.0, vMeph0.z+4.0);
    vector vMeph4 = Vector(vMeph0.x-4.0, vMeph0.y+4.0, vMeph0.z+4.0);
    vector vMeph5 = Vector(vMeph0.x, vMeph0.y, vMeph0.z+8.0);
    location lMeph1 = Location(oArea, vMeph1, fOrientation);
    location lMeph2 = Location(oArea, vMeph2, fOrientation);
    location lMeph3 = Location(oArea, vMeph3, fOrientation);
    location lMeph4 = Location(oArea, vMeph4, fOrientation);
    location lMeph5 = Location(oArea, vMeph5, fOrientation);

    //Apply the Implosion VFX
    effect eImplode = EffectVisualEffect(VFX_FNF_IMPLOSION);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lMeph0);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lMeph1);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lMeph2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lMeph3);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lMeph4);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, lMeph5);

    //Apply the Coverup effect
    effect eCover = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eCover, lMeph0));

    //Destroy Mephistopheles
    PlayVoiceChat(VOICE_CHAT_DEATH);
    DestroyObject(OBJECT_SELF, 3.0);

    *///Add Journal entry
    //object oPC = GetPCSpeaker();
    //DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    //DelayCommand(3.5, AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE));

    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 1);
}
