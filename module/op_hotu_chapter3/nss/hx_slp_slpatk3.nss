//::///////////////////////////////////////////////
//:: Name hx_slp_slpatk3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sensei attacks PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oSensei = GetObjectByTag("H2_Sensei");

    if(!GetIsObjectValid(oPC))
    {
        oPC = GetLastSpeaker();
    }

    // Sensei attacks Sleeping Man.
    SetIsTemporaryEnemy(oPC, oSensei);
    AssignCommand(oSensei, ActionAttack(oPC));
}
