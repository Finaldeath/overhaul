//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: q3_ud_jumpghost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Ghost disappears when damaged
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 8, 2003
//:://////////////////////////////////////////////

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

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {
        int nCurrent = GetCurrentHitPoints();
        int nMax = GetMaxHitPoints();

        if(nCurrent < nMax/2)
        {
            object oSarc = GetObjectByTag("q3ah_plc_invjump");
            int nSarc = GetLocalInt(oSarc,"Q3AH_JUMPING");

            if(nSarc<5)
            {
                GiveXPToCreature(GetLastDamager(), 100);
                DestroyObject(OBJECT_SELF);
            }
        }
    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

