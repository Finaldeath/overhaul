//::///////////////////////////////////////////////
//:: Name x2_def_userdef
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

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
        if(GetCurrentHitPoints(OBJECT_SELF) <= 20)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SURRENDER_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_SURRENDER_ONCE", 1);
            // remove area of effect spells
            object oObject = GetFirstObjectInArea(GetArea(OBJECT_SELF));
            while(oObject != OBJECT_INVALID)
            {
                if(GetObjectType(oObject) == OBJECT_TYPE_AREA_OF_EFFECT)
                    DestroyObject(oObject, 1.0);
                oObject = GetNextObjectInArea(GetArea(OBJECT_SELF));
            }

            PlaySpeakSoundByStrRef(84826);
            ClearAllActions();
            PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 3.0);
            SurrenderToEnemies();
            // calm down the henchmen
            int i = 1;
            object oHench = GetHenchman(GetFirstPC(), i);
            while(oHench != OBJECT_INVALID)
            {
                AssignCommand(oHench, ClearAllActions());
                i++;
                oHench = GetHenchman(GetFirstPC(), i);
            }
            DelayCommand(5.0, SetImmortal(OBJECT_SELF, FALSE));
            object Elemental1 = GetNearestObjectByTag("NW_FIREHUGE", OBJECT_SELF, 1);
            object Elemental2 = GetNearestObjectByTag("NW_FIREHUGE", OBJECT_SELF, 2);
            object Elemental3 = GetNearestObjectByTag("NW_FIREHUGE", OBJECT_SELF, 3);
            effect eUnsummon = EffectVisualEffect(VFX_IMP_UNSUMMON);
            // remove elementals
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(Elemental1));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(Elemental2));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(Elemental3));
            DestroyObject(Elemental1, 1.0);
            DestroyObject(Elemental2, 1.0);
            DestroyObject(Elemental3, 1.0);

        }
    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {
        object oPC = GetLastKiller();
        if(!GetIsPC(oPC))
            return;

        // evil hit when killing after surrender
        if(GetLocalInt(OBJECT_SELF, "DO_SURRENDER_ONCE") == 1)
        {
            if(GetAlignmentGoodEvil(oPC) != ALIGNMENT_EVIL)
                AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);
        }
    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {

    }


}


