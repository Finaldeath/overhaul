//::///////////////////////////////////////////////
//:: Name hx_ud_handdmn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

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
        location lLoc = GetLocation(GetObjectByTag("h4c_spawn_exit_wp"));
        SetLocalInt(GetModule(), "HX_DEMON_ABORTED", FALSE);

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_X), lLoc);
        CreateObject(OBJECT_TYPE_PLACEABLE, "h4a_portal_out", lLoc);
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


