//::///////////////////////////////////////////////
//:: Mephistopheles, Death (Action Script)
//:: H9a_Meph_Death.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Similar to Fate 1 (Cease to Exist) but the
     player attacks Mephistopheles first.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

void main()
{
    //Set M's Fate local
    SetLocalString(GetModule(), "sMephistophelesFate", "CeaseExist");

    //Make the player attack M.
    object oPC = GetPCSpeaker();
    object oMeph = OBJECT_SELF;
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionAttack(oMeph));

    //Define the locations for the Implosion VFX
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

    //Add Journal entry
    DelayCommand(3.5, AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE));
}
