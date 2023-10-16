//::///////////////////////////////////////////////
//:: On Acquire Item
//:: os_module_acquir
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the PC acquires the Psionic gems
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetModuleItemAcquiredBy();
    object oItem = GetModuleItemAcquired();
    object oLoser = GetModuleItemAcquiredFrom();

    if (Random(5) == 0)
    {
        DelayCommand(IntToFloat(Random(999)),
            AssignCommand(GetNearestObject(OBJECT_TYPE_ALL, oPC, Random(999)),
                ActionSpeakStringByStrRef(40499)));
    }

    //or check module item against tag of psionic gem
    if((GetTag(oItem) == "q3_psionicgem") && (GetIsPC(oPC) == TRUE))
    {
        if(GetIsInCombat(oPC) == TRUE)
        {
            FloatingTextStringOnCreature("You are still in combat mode" ,oPC);
            FloatingTextStringOnCreature("and are too busy to pick up this item." ,oPC);

            CopyItem(oItem, oLoser, TRUE);
            DestroyObject(oItem);
        }
        else
        {
            location lPC = GetLocation(oPC);
            object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"q3_psioniclight",lPC);

            SetDroppableFlag(oItem,FALSE);
            AssignCommand(oPC,ClearAllActions(TRUE));
            DelayCommand(0.5,AssignCommand(oLight,ActionStartConversation(oPC)));
        }
    }
}
