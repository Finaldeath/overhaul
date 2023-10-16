//::///////////////////////////////////////////////
//:: M2Q2E2_ENDFIGHT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The druid circle fight is over when the player opens the door.
    The druids are destroyed, the door is re-closed, and the local
    saying that a fight is on is set to false.
    The player is sent to the druid camp.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

void main()
{
    DestroyObject(GetObjectByTag("M2Q2EWELCARFT"));
    DestroyObject(GetObjectByTag("M2Q2EHENNAFT"));
    DestroyObject(GetObjectByTag("M2Q2EJANKENFT"));
    DestroyObject(GetObjectByTag("M2Q2EELGARFT"));
    DestroyObject(GetObjectByTag("M2Q2EWELCARFTPET"));
    DestroyObject(GetObjectByTag("M2Q2EHENNAFTPET"));
    DestroyObject(GetObjectByTag("M2Q2EJANKENFTPET"));
    DestroyObject(GetObjectByTag("M2Q2EELGARFTPET"));
    SetLocalInt(GetObjectByTag("M2Q2EJAER"),"NW_M2Q2E_LFIGHT",FALSE);
//    AssignCommand(GetLastOpenedBy(),ActionSpeakString("She's valid"));
    object oTarget = GetLastOpenedBy();
    effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_X);
    int nHeal = GetMaxHitPoints(oTarget);
        //Set the heal effect
    effect eHeal = EffectHeal(nHeal);
        //Apply the heal effect and the VFX impact
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealVis, oTarget);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
    ActionCloseDoor(OBJECT_SELF);
    AssignCommand(GetLastOpenedBy(),JumpToLocation(GetLocation(GetWaypointByTag("WP_M2Q2E_ENDDCC"))));

}
