//::///////////////////////////////////////////////
//:: con_chk_exorcist.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make sure there are more then 2 charges on the sword
     before allowing the exorcism
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();
    object oMW = GetItemPossessedBy(oPC, "os_magicweapon");
    int iCharge = GetItemCharges(oMW);

    iResult = (iCharge > 2);

    return iResult;
}
