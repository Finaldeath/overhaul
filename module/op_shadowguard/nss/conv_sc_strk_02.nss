#include "help_general"

void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);

    RemoveAllEffects(OBJECT_SELF);

    object oItem = GetItemPossessedBy(GetPCSpeaker(), "IT_PLOT_026");

    object oEquip = GetItemPossessedBy(OBJECT_SELF, "IT_ARM_TSH_901");

    int nEquip = INVENTORY_SLOT_LEFTHAND;

    DestroyObject(oItem);

    AssignCommand(OBJECT_SELF, ActionEquipItem(oEquip, nEquip));

    SetPlotFlag(OBJECT_SELF, TRUE);

    DelayCommand(3.0, MakeStatue(OBJECT_SELF));
}
