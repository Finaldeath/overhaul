//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_aasimar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the fighter fly to its target.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 27, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oTarget = GetLocalObject(OBJECT_SELF, "HX_LAST_ATTACKER");
        int iStart = GetLocalInt(OBJECT_SELF, "HX_TARGET_STARTED");
        int iStart2 = GetLocalInt(OBJECT_SELF, "HX_PERC_STARTED");

        if(!GetIsObjectValid(oTarget))
        {
            oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        }

        if(GetDistanceToObject(oTarget) >= 10.0 && GetDistanceToObject(oTarget) <= 20.0 && GetIsObjectValid(oTarget) && iStart == 0 && iStart2 == 0)
        {
            SetLocalInt(OBJECT_SELF, "HX_TARGET_STARTED", 1);
            ClearAllActions(TRUE);
            SetFacingPoint(GetPosition(oTarget));
            DelayCommand(0.9, PlaySound("fs_flapfeather"));
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDisappearAppear(GetLocation(oTarget)), OBJECT_SELF, 5.0));
            DelayCommand(6.1, PlaySound("fs_flapfeather"));
            DelayCommand(7.5, ActionAttack(oTarget));
            DelayCommand(8.2, SetLocalInt(OBJECT_SELF, "HX_TARGET_STARTED", 0));
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {
        object oPerc = GetLastPerceived();
        int iRep = GetReputation(OBJECT_SELF, oPerc);
        int iStart = GetLocalInt(OBJECT_SELF, "HX_PERC_STARTED");
        int iStart2 = GetLocalInt(OBJECT_SELF, "HX_TARGET_STARTED");

        if(iRep <= 10)
        {
            if(GetDistanceToObject(oPerc) >= 10.0 && GetDistanceToObject(oPerc) <= 20.0 && iStart == 0 && iStart2 == 0)
            {
                SetLocalInt(OBJECT_SELF, "HX_PERC_STARTED", 1);
                ClearAllActions(TRUE);
                SetFacingPoint(GetPosition(oPerc));
                DelayCommand(0.9, PlaySound("fs_flapfeather"));
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDisappearAppear(GetLocation(oPerc)), OBJECT_SELF, 5.0));
                DelayCommand(6.1, PlaySound("fs_flapfeather"));
                DelayCommand(7.5, ActionAttack(oPerc));
                DelayCommand(8.2, SetLocalInt(OBJECT_SELF, "HX_PERC_STARTED", 0));
            }
            else
            {
                if(GetCurrentAction() != ACTION_ATTACKOBJECT)
                {
                    ClearAllActions(TRUE);
                    ActionAttack(oPerc);
                }
            }
        }
    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if(Random(100) < 35)
        {
            SpeakOneLinerConversation("");
        }

        /*object oAttacker = GetLastDamager();
        object oTarget = GetAttackTarget();

        //if(GetIsObjectValid(oTarget))
        //{
        //    SetLocalObject(OBJECT_SELF, "HX_LAST_ATTACKER", oTarget);
        //}
        //else if(GetIsObjectValid(oAttacker))
        //{
            SetLocalObject(OBJECT_SELF, "HX_LAST_ATTACKER", oAttacker);
        //}
        //else
        //{
        //    ClearAllActions(TRUE);
        //    DeleteLocalObject(OBJECT_SELF, "HX_LAST_ATTACKER");
        //}*/
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
