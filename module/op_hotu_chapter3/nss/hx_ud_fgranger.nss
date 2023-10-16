//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_fgranger
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the creature swap between
     ranged and melee depending on situation.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 14, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        int iMelee = GetLocalInt(OBJECT_SELF, "hx_melee");
        int iRanged = GetLocalInt(OBJECT_SELF, "hx_ranged");

        if(GetIsObjectValid(oEnemy))
        {
            if(iRanged == 1 && GetDistanceToObject(oEnemy) > 4.0 && GetDistanceToObject(oEnemy) <= 30.0)
            {
                if(GetCurrentAction() != ACTION_ATTACKOBJECT)
                {
                    ActionAttack(oEnemy);
                }
            }

            if(GetDistanceToObject(oEnemy) > 4.0)
            {
                if(iRanged == 0 || !GetCommandable())
                {
                    if(!GetCommandable())
                    {
                        SetCommandable(TRUE);
                    }
                    ClearAllActions();
                    DelayCommand(0.1, ActionEquipMostDamagingRanged());
                    SetLocalInt(OBJECT_SELF, "hx_ranged", 1);
                    SetLocalInt(OBJECT_SELF, "hx_melee", 0);
                }
            }
            else
            {
                if(iMelee == 0)
                {
                    ClearAllActions();
                    DelayCommand(0.1, ActionEquipMostDamagingMelee());
                    SetLocalInt(OBJECT_SELF, "hx_melee", 1);
                    SetLocalInt(OBJECT_SELF, "hx_ranged", 0);
                }
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        object oEnemy = GetAttemptedAttackTarget();
        object oEnemy2 = GetAttackTarget();
        object oEnemy3 = GetLastAttacker();
        int iMelee = GetLocalInt(OBJECT_SELF, "hx_melee");

        //if(iMelee == 1)
        //{
            if(GetIsObjectValid(oEnemy) && GetDistanceToObject(oEnemy) > 4.0)
            {
                ClearAllActions(TRUE);
                SetCommandable(FALSE);
            }
            else if(GetIsObjectValid(oEnemy2) && GetDistanceToObject(oEnemy) > 4.0)
            {
                ClearAllActions(TRUE);
                SetCommandable(FALSE);
            }
            else if(GetIsObjectValid(oEnemy3) && GetDistanceToObject(oEnemy) > 4.0)
            {
                ClearAllActions(TRUE);
                SetCommandable(FALSE);
            }
        //}
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

