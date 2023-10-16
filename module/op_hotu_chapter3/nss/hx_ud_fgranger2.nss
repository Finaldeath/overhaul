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
        object oMelee = GetLocalObject(OBJECT_SELF, "hx_melee");
        object oRanged = GetLocalObject(OBJECT_SELF, "hx_ranged");
        object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
        object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);

        if(GetIsObjectValid(oEnemy))
        {
            if(GetDistanceToObject(oEnemy) > 4.0)
            {
                if(oRanged != oLeft || oRanged != oRight)
                {
                    ClearAllActions();
                    ActionEquipItem(oRanged, INVENTORY_SLOT_LEFTHAND);
                }
            }
            else
            {
                if(oMelee != oLeft || oMelee != oRight)
                {
                    ClearAllActions();
                    ActionEquipItem(oMelee, INVENTORY_SLOT_RIGHTHAND);
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

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

