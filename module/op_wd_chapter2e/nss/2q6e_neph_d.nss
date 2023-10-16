//::///////////////////////////////////////////////
//:: Erinyes Custom User Defined Event
//:: 2Q6E_NEPH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Nephitys to turn into her true form.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 26, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    int nPlot = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nUser == 1002)
    {
        if(GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
        {
            SpeakOneLinerConversation("2q6c_nyphithys02");
            SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT, FALSE);
        }
    }
    else if(nUser == 1005 && nPlot == FALSE) // ATTACKED
    {
        effect ePoly = EffectPolymorph(32);
        effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, OBJECT_SELF);
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }

}

