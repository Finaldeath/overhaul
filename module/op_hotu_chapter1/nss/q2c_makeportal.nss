//::///////////////////////////////////////////////
//:: Name  q2c_makeportal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create the two Rakshasa Portals and
    Destroy the Portal Stone placemarker
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 4/03
//:://////////////////////////////////////////////

void main()
{
    //effects
    effect eVis1 = EffectVisualEffect(VFX_DUR_PIXIEDUST);
    effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH_WARD);
    effect eLink = EffectLinkEffects(eVis1, eVis2);

    location lLoc = GetLocation(OBJECT_SELF);

    object oPC = GetLastUsedBy();
    //Play Portal Activation Sound
    AssignCommand(oPC, PlaySound("gui_dm_drop"));
    //Play VisualEffect

    location lPortal2= GetLocation(GetWaypointByTag("wp_q2crakportal2"));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lLoc);

    CreateObject(OBJECT_TYPE_PLACEABLE, "q2crakportal1", lLoc);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2crakportal2", lPortal2);


    DestroyObject(OBJECT_SELF, 0.5);
    object oStone = GetLocalObject(OBJECT_SELF, "oStone");
    DestroyObject(oStone);

    object oArea = GetArea(OBJECT_SELF);
    if (GetLocalInt(oArea, "X2_RakTransformed") == 1)
        return;

    object oShareesh = GetObjectByTag("q2crakslaveleader");
    AssignCommand(oShareesh, SpeakStringByStrRef(101025));

    ExecuteScript("act_q2rakattack", oArea);



}
