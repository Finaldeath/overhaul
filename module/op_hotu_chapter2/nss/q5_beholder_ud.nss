//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {
        if(GetIsInCombat(OBJECT_SELF) || IsInConversation(OBJECT_SELF))
            return;
        object oSlave = GetLastPerceived();
        if(GetTag(oSlave) == "q5b_slave" && GetLastPerceptionSeen())
        {
            ClearAllActions();
            SetLocalInt(OBJECT_SELF, "BUSY", 1);
            effect eBeam = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_MONSTER_0);
            effect eKnock = EffectKnockdown();
            SetFacingPoint(GetPosition(oSlave));
            DelayCommand(1.0, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0));
            DelayCommand(4.0, PlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 3.0));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oSlave, 1.0));
            AssignCommand(oSlave, ClearAllActions());
            DelayCommand(1.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oSlave, 3.0));
            DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "BUSY", 0));
        }
    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

