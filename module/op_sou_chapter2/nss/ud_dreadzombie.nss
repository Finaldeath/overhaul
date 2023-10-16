//::///////////////////////////////////////////////
//:: Dread Zombie (UserDefined)
//:: UD_Dread Zombie.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Keep track of the Dread Zombie count, keeping
     them from spawning out of control.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 12, 2003
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
        int iZombieCount = GetLocalInt(GetModule(), "iZombieCount_Crypt01");
        SetLocalInt(GetModule(), "iZombieCount_Crypt01", iZombieCount-1);
    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {

    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}
