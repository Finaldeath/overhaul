//::///////////////////////////////////////////////
//:: Slaves Exit
//:: q3_trg_slaveexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the slaves as they enter the trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oSlave = GetObjectByTag("q3_hslave");
    object oSlave1 = GetObjectByTag("q3_hslave1");

    if(GetEnteringObject()==oSlave)
    {
        if(GetLocalInt(oSlave,"OS_SLAVE_FREED")==10)
        {
            object oWay = GetObjectByTag("q2_way_slave");
            AssignCommand(oSlave, ActionJumpToObject(oWay));
        }
        else
        {
            DestroyObject(oSlave);
        }
    }
    else if(GetEnteringObject()==oSlave1)
    {
        DestroyObject(oSlave1);
    }
}
