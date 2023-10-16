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

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {
        int iAwake = GetLocalInt(GetModule(), "HX_LAZY_AWAKE");

        if(iAwake == FALSE)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), OBJECT_SELF);
        }
    }
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        object oLazy = GetObjectByTag("H2_Lazy");

        AssignCommand(oLazy, ActionStartConversation(oPC, "h2_devil_info", FALSE, FALSE));
    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {

    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH  - do not use for critical code, does not fire reliably all the time
    {
        //Shift alignment toward evil
        object oPC = GetFirstPC();
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

        //Reactivate Grinder
        object oGrinder5 = GetObjectByTag("QuarryGrinder5");
        SetLocalInt(oGrinder5, "bImpInGrinder", FALSE);
        SetLocalInt(oGrinder5, "bActivated", TRUE);
        SetLocalInt(oGrinder5, "bDismantled", FALSE);
        SetLocalInt(oGrinder5, "bQuestComplete", TRUE);
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


