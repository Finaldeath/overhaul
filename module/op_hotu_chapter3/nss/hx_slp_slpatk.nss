//::///////////////////////////////////////////////
//:: Name hx_slp_slpatk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping man attacks PC. Sensei attacks him.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");
    object oSensei = GetObjectByTag("H2_Sensei");

    if(!GetIsObjectValid(oPC))
    {
        oPC = GetLastSpeaker();
    }

    SetPlotFlag(oSleep, FALSE);

    // Sensei attacks Sleeping Man.
    SetIsTemporaryEnemy(oSleep, oSensei);
    AssignCommand(oSensei, ActionAttack(oSleep));

    // Sleeping Man attacks PC.
    SetIsTemporaryEnemy(oPC, oSleep);
    AssignCommand(oSleep, ActionEquipMostDamagingMelee());
    DelayCommand(0.5, AssignCommand(oSleep, ActionAttack(oPC)));
}
