//::///////////////////////////////////////////////
//:: Aribeth Custom User Defined Event
//:: 2Q6K_ARIBETH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes aribeth pray to Morag
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: MArch 3, 2002
//:://////////////////////////////////////////////

#include "NW_I0_HOSTINCL"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    int nPlot = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nUser == 1001 && nPlot == 0) //HEARTBEAT
    {
        effect eVis = EffectVisualEffect(VFX_DUR_INVISIBILITY);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);
        object oWay = GetWaypointByTag("2Q6K_MORAG");
        vector vWay = GetPosition(oWay);
        SetFacingPoint(vWay);
        ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 1000.0);
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }
}

