//::///////////////////////////////////////////////
//:: Default On Percieve
//:: NW_C2_DEFAULT2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    if(GetLastPerceptionSeen())
    {
        if(GetIsPC(GetLastPerceived()) && GetLocalInt(OBJECT_SELF,"NW_L_GulnanSpoke") == FALSE)
        {
            SetLocalInt(OBJECT_SELF,"NW_L_GulnanSpoke",TRUE);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DOMINATED),OBJECT_SELF,15.0f);
            SpeakOneLinerConversation();
            ActionWait(15.0);
            ActionDoCommand(SetPlotFlag(OBJECT_SELF,FALSE));
            ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(TRUE),OBJECT_SELF));
            SetCommandable(FALSE);
        }
    }
}
