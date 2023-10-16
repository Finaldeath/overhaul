//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_ratgem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Behavior for mimic rats. They will eat gems
     and leave them behind when killed (not eaten).
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 12, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oGem = GetNearestObjectByTag("hx_mimic_gem");

        if(GetIsObjectValid(oGem) && GetTag(GetArea(OBJECT_SELF)) != "hx_hand_plane")
        {
            if(!GetIsInCombat(OBJECT_SELF) && !IsInConversation(OBJECT_SELF))
            {
                if(GetDistanceToObject(oGem) < 2.0)
                {
                    SetLocalInt(OBJECT_SELF, "HX_RAT_ATE_GEM", TRUE);
                    ClearAllActions();
                    SetFacingPoint(GetPosition(oGem));
                    DelayCommand(0.7, PlaySound("it_jewelry"));
                    DelayCommand(0.8, DestroyObject(oGem));
                    DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedDecrease(50), OBJECT_SELF));
                }
                else if(GetCurrentAction() != ACTION_MOVETOPOINT)
                {
                    ClearAllActions();
                    ActionMoveToObject(oGem, TRUE, 1.8);
                }
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

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
        int iAteGem = GetLocalInt(OBJECT_SELF, "HX_RAT_ATE_GEM");
        location lLoc = GetLocation(OBJECT_SELF);
        object oKiller = GetLastKiller();

        AdjustReputation(oKiller, OBJECT_SELF, 100);
        AdjustReputation(oKiller, OBJECT_SELF, -50);

        if(iAteGem == TRUE && GetIsPC(oKiller))
        {
            object oGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
            if(GetLocalInt(GetModule(), "PCHasHellRingOn") == 1)
            {
                AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oGem));
            }
        }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

