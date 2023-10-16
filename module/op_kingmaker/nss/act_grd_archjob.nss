//::///////////////////////////////////////////////
//:: act_grd_archjob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The PC has taken the Gord's archeologist job
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q3_map_undead");
    location lWay = GetLocation(oWay);
    object oDoor = GetObjectByTag("q1ab_at_q3af");
    object oMap = GetObjectByTag("q3_map_undead");

    SetMapPinEnabled(oMap,1);
    SetLocked(oDoor,FALSE);

    effect eGhost = EffectCutsceneGhost();
    object oOhio = CreateObject(OBJECT_TYPE_CREATURE,"q3_ohio",lWay);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oOhio);

    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",10);
    SetLocalInt(GetModule(), "OS_THEGORD_ARCH",20);
}
