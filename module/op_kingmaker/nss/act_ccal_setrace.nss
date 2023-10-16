//::///////////////////////////////////////////////
//:: act_ccal_setrace
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the PC's race
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int nPC = GetRacialType(oPC);

    if(GetLocalInt(oPC,"OS_PCRACE")==0)
    {
        if(nPC == RACIAL_TYPE_HALFELF
            || nPC == RACIAL_TYPE_ELF)
        {
            SetLocalInt(oPC,"OS_PCRACE",2);
        }
        else if(nPC == RACIAL_TYPE_DWARF)
        {
            SetLocalInt(oPC,"OS_PCRACE",3);
        }
        else if(nPC == RACIAL_TYPE_GNOME)
        {
            SetLocalInt(oPC,"OS_PCRACE",4);
        }
        else if(nPC == RACIAL_TYPE_HALFLING)
        {
            SetLocalInt(oPC,"OS_PCRACE",5);
        }
        else
        {
            SetLocalInt(oPC,"OS_PCRACE",1);
        }
    }
}
