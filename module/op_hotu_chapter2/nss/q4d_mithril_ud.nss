

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

#include "nw_i0_generic"

void RemoveEffects(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

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

    }
    else if(nUser == 101) // activate
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_GOLEM_ATTACK_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_GOLEM_ATTACK_ONCE", 1);

        SetLocalInt(OBJECT_SELF, "ACTIVATED", 1);
        SetPlotFlag(OBJECT_SELF, FALSE);
        RemoveEffects(OBJECT_SELF);
        object oOther;
        if(GetTag(OBJECT_SELF) == "q4d_mithril2")
            oOther = GetNearestObjectByTag("q4d_mithril1");
        else
            oOther = GetNearestObjectByTag("q4d_mithril2");
        SignalEvent(oOther, EventUserDefined(101));
        object oKeeper = GetNearestObjectByTag("q4d_keeper");
        object oCopySP = GetObjectByTag("q4d_wp_copy_sp");
        AssignCommand(oKeeper, JumpToObject(oCopySP));
        //SetPlotFlag(oKeeper, FALSE);
        //DestroyObject(oKeeper);
    }


}


