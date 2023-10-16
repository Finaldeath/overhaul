//::///////////////////////////////////////////////
//:: Has Torch
//:: con_exp_hastorch
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has a torch.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oTorch = GetItemPossessedBy(oPC,"NW_IT_TORCH001");
    iResult = GetIsObjectValid(oTorch);
    return iResult;
}
