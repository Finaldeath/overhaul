//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: NW_C2_DEFAULT1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    if ( (GetLocalInt(GetModule(),"NW_G_M3Q02TALKUTHGARDTATTACK") == 1) && (GetLocalInt(OBJECT_SELF,"NW_I_AM_MOVING") == 0))
    {  //SpeakString("DEBUG: Moving");
      ClearAllActions();
      SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);
      ActivateFleeToExit();
    //  SetLocalInt(OBJECT_SELF,"NW_I_AM_MOVING",1) ;
    }
    if(GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS) &&
        !GetIsInCombat() &&
        !GetIsObjectValid(GetAttackTarget()) &&
        !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
//        PlayAmbientAnimations();
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE);
    }
}
