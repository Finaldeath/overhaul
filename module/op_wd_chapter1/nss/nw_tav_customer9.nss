//::///////////////////////////////////////////////
//::
//:: OnSpawnIn
//::
//:: NW_TAV_Customer9.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script determines the customer's characteristics
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: June 19, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    //  The number of drinks a customer can have before
    //  getting drunk is based on the racial type.
    if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ELF)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MaxDrinks",3);
    }
    else if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DWARF)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MaxDrinks",7);
    }
    else if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFORC)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MaxDrinks",6);
    }
    else if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_GNOME)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MaxDrinks",2);
    }
    else if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HALFLING)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MaxDrinks",1);
    }
    else
    {
        SetLocalInt(OBJECT_SELF,"NW_L_MaxDrinks",5);
    }
}
