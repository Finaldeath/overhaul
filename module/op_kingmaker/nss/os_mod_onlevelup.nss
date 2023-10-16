//::///////////////////////////////////////////////
//:: os_mod_onlevelup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Levels up the player's henchman
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
#include "inc_remeffect"

void InitLight(object oPC);
void TripUpgrade(int iLevel);

void main()
{
    object oPC = GetFirstPC();
    object oModule = GetModule();

    if((oPC == GetPCLevellingUp())
    && (GetLocalInt(oModule, "MW_ACTIVATE") == TRUE)
    && (GetHitDice(oPC) > 2))
    {
        InitLight(oPC);
    }
}

void InitLight(object oPC)
{
    object oModule = GetModule();

    if ((GetIsInCombat(oPC) == FALSE) && (IsInConversation(oPC) == FALSE))
    {
        RemovePoly(oPC);
        SetCutsceneMode(oPC, TRUE);

        location lPC = GetLocation(oPC);
        int nLevel = GetLocalInt(oPC,"OS_LEVELUP")+1;

        SetLocalInt(oPC,"OS_LEVELUP",nLevel);
        LevelUpXP1Henchman(oPC);
        TripUpgrade(nLevel);
        AssignCommand(oPC,ClearAllActions(TRUE));

        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE, "q3ai_mw_intro", lPC);
        DelayCommand(0.5, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(0.6, AssignCommand(oMW, ActionStartConversation(oPC)));
    }
    else
    {
        DelayCommand(1.0f, InitLight(oPC));
    }
}

void TripUpgrade(int iLevel)
{
    object oPC = GetFirstPC();
    object oTrip = GetNearestObjectByTag("os_hen_trp",oPC);
    object oItem;

    AssignCommand(oTrip, ClearAllActions(TRUE));

    if (iLevel == 2)
    {
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oTrip);
        DestroyObject(oItem);
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oTrip);
        DestroyObject(oItem);

        oItem = CreateItemOnObject("os_tripclaws001", oTrip);
        DelayCommand(0.5f, AssignCommand(oTrip, ActionEquipItem(oItem, INVENTORY_SLOT_CWEAPON_L)));
        oItem = CreateItemOnObject("os_tripclaws001", oTrip);
        DelayCommand(0.5f, AssignCommand(oTrip, ActionEquipItem(oItem, INVENTORY_SLOT_CWEAPON_R)));
    }
    else if (iLevel == 4)
    {
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oTrip);
        DestroyObject(oItem);
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oTrip);
        DestroyObject(oItem);

        oItem = CreateItemOnObject("os_tripclaws002", oTrip);
        DelayCommand(0.5f, AssignCommand(oTrip, ActionEquipItem(oItem, INVENTORY_SLOT_CWEAPON_L)));
        oItem = CreateItemOnObject("os_tripclaws002", oTrip);
        DelayCommand(0.5f, AssignCommand(oTrip, ActionEquipItem(oItem, INVENTORY_SLOT_CWEAPON_R)));
    }
    else if (iLevel == 6)
    {
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oTrip);
        DestroyObject(oItem);
        oItem = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oTrip);
        DestroyObject(oItem);

        oItem = CreateItemOnObject("os_tripclaws003", oTrip);
        DelayCommand(0.5f, AssignCommand(oTrip, ActionEquipItem(oItem, INVENTORY_SLOT_CWEAPON_L)));
        oItem = CreateItemOnObject("os_tripclaws003", oTrip);
        DelayCommand(0.5f, AssignCommand(oTrip, ActionEquipItem(oItem, INVENTORY_SLOT_CWEAPON_R)));
    }
}
