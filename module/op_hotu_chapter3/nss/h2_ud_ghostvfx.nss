//::///////////////////////////////////////////////
//:: Spirit of the Dead, Ghost VFX
//:: H2_UD_GhostVFX.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Apply the Ghost VFX to the creature (must
     have the "X2_USERDEFINED_ONSPAWN_EVENTS" int
     set to 2 via the toolset.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: August 1, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {

    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {
        int iGender = GetGender(OBJECT_SELF);
        string sSound;

        if(iGender == GENDER_MALE)
        {
            sSound = "vs_nclerkm1_dead";
        }
        else
        {
            sSound = "vs_ncomolf1_dead";
        }

        //Verify the the PC fired the Perceive event
        object oPerceived = GetLastPerceived();
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        int bSeen = GetLastPerceptionSeen();
        if (GetIsPC(oPerceived) == TRUE &&
            bSeen == TRUE)
        {
            // Don't do if a cutscene is active.
            int iCut = CutGetActiveCutsceneForObject(oPerceived);
            if(iCut < 1)
            {
                //Small chance that the ghost's soul will be devoured.
                int iDevour = Random(100);
                /*DEBUG*///SendMessageToPC(oPerceived, "[NOT IN STRING EDITOR] iDevour == "+IntToString(iDevour));
                if (iDevour < 10)
                {
                    effect eVFX = EffectVisualEffect(VFX_IMP_DEATH);
                    location lLoc = GetLocation(OBJECT_SELF);
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lLoc);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), OBJECT_SELF);
                    AssignCommand(oCreature, ClearAllActions());
                    DelayCommand(0.1, AssignCommand(oCreature, PlaySound(sSound)));
                    DestroyObject(OBJECT_SELF, 0.2);
                }
            }
        }
    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {

    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {

    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {

    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {
        //Apply Ghost VFX to myself OnSpawn
        effect eSmoke = EffectVisualEffect(VFX_DUR_GHOST_SMOKE_2);
        effect eGhost = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSmoke, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);
    }


}


