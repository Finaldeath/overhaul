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
int GetIsRanged(object oRight, object oLeft);
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
        object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);

        if(GetIsObjectValid(oEnemy))
        {
            if(GetDistanceToObject(oEnemy) > 4.0)
            {
                if(GetIsRanged(oLeft, oRight) == FALSE)
                {
                    ClearAllActions();
                    ActionEquipMostDamagingRanged();
                }
            }
            else
            {
                if(GetIsRanged(oLeft, oRight) == TRUE)
                {
                    ClearAllActions();
                    ActionEquipMostDamagingMelee();
                }
            }
        }

        if(Random(100) < 35)
        {
            SpeakOneLinerConversation("");
        }

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

int GetIsRanged(object oRight, object oLeft)
{
    if(GetWeaponRanged(oLeft))
    {
        return TRUE;
    }
    if(GetWeaponRanged(oRight))
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
