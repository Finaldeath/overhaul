//::///////////////////////////////////////////////
//:: On Client Enter (Kingmaker)
//:: km_oncl_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Event fired when a Client enters the module
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Aug 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    // If its a PC add the CREDITS journal entry
    if (GetIsPC(oPC) == TRUE)
    {
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
        //AddJournalQuestEntry("MODULE_CREDITS", 1, oPC);
    }
}
