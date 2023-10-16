//::///////////////////////////////////////////////
//:: Teleport Field
//:: 2Q6_Teleport
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    While the Teleporter is active people can use
    it for 30 seconds to transport to the area
    they specified in the dialogue
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTeleport = GetLocalObject(OBJECT_SELF, "NW_2Q6_PORTAL_DESTINATION");
    if(GetIsObjectValid(oTeleport))
    {
        object oEnter = GetEnteringObject();
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oEnter);
        location lLocal = GetLocation(oTeleport);
        AssignCommand(oEnter, JumpToLocation(lLocal));
    }
}
